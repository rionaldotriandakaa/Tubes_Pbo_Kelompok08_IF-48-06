package auth;

import config.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("Frontend/Login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usernameInput = request.getParameter("username");
        String passwordInput = request.getParameter("password");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            conn = DatabaseConnection.getConnection();

            // Debug koneksi
            System.out.println("Connection = " + conn);

            if (conn == null) {
                throw new SQLException("Database connection failed!");
            }

            String sqlCheckUser = "SELECT * FROM users WHERE username = ?";

            ps = conn.prepareStatement(sqlCheckUser);
            ps.setString(1, usernameInput);

            rs = ps.executeQuery();

            if (rs.next()) {

                String dbPassword = rs.getString("password");

                if (dbPassword.equals(passwordInput)) {

                    HttpSession session = request.getSession();

                    session.setAttribute("user_id", rs.getInt("id"));
                    session.setAttribute("username", rs.getString("username"));
                    session.setAttribute("email", rs.getString("email"));
                    session.setAttribute("genre", rs.getString("genre"));
                    session.setAttribute("avatar", rs.getString("avatar"));

                    System.out.println("Login berhasil: " + usernameInput);

                    response.sendRedirect("Frontend/ChooseProfile.jsp");

                } else {

                    System.out.println("Password salah untuk user: " + usernameInput);

                    response.sendRedirect(
                            "Frontend/Login.jsp?error=wrong_password"
                    );
                }

            } else {

                System.out.println("Username tidak ditemukan: " + usernameInput);

                response.sendRedirect(
                        "Frontend/Login.jsp?error=user_not_found"
                );
            }

        } catch (SQLException e) {

            System.out.println("=== LOGIN ERROR ===");
            e.printStackTrace();

            response.sendRedirect(
                    "Frontend/Login.jsp?error=database_error"
            );

        } finally {

            try {

                if (rs != null) {
                    rs.close();
                }

                if (ps != null) {
                    ps.close();
                }

                if (conn != null) {
                    conn.close();
                }

            } catch (SQLException e) {

                System.out.println("Close DB Error:");
                e.printStackTrace();
            }
        }
    }
}