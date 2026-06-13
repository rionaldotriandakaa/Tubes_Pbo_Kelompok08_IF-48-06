package auth;

import config.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SelectProfileServlet")
public class SelectProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String profileId = request.getParameter("id");

        HttpSession session = request.getSession();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            conn = DatabaseConnection.getConnection();

            String sql =
                "SELECT * FROM profiles WHERE profile_id = ?";

            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(profileId));

            rs = ps.executeQuery();

            if (rs.next()) {

                session.setAttribute(
                    "selectedProfileId",
                    rs.getInt("profile_id")
                );

                session.setAttribute(
                    "activeProfileName",
                    rs.getString("profile_name")
                );

                session.setAttribute(
                    "activeProfileAvatar",
                    rs.getString("profile_avatar")
                );

                session.setAttribute(
                    "activeProfileKids",
                    rs.getBoolean("is_kids")
                );

            }

        } catch (Exception e) {

            System.out.println(
                "SelectProfile Error : " + e.getMessage()
            );

        } finally {

            try {

                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();

            } catch (Exception e) {
            }

        }

        response.sendRedirect("Frontend/Dashboard.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}