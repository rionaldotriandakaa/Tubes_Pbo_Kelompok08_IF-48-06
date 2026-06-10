/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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

/**
 *
 * @author ACER
 */
// Mendaftarkan jalur URL gerbang login untuk form di Login.jsp kelompokmu
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Jika diakses paksa lewat URL browser biasa, kembalikan ke halaman login jsp
        response.sendRedirect("Frontend/Login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Ambil data ketikan dari form Login.jsp
        String usernameInput = request.getParameter("username");
        String passwordInput = request.getParameter("password");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // 2. Hubungkan ke database MySQL cinemastream
            conn = DatabaseConnection.getConnection();
            
            // Tahap 1: Cek apakah username terdaftar di tabel 'users'
            String sqlCheckUser = "SELECT * FROM users WHERE username = ?";
            ps = conn.prepareStatement(sqlCheckUser);
            ps.setString(1, usernameInput);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Tahap 2: Jika username terdaftar, ambil password asli dari database untuk dicocokkan
                String dbPassword = rs.getString("password");
                
                if (dbPassword.equals(passwordInput)) {
                    // JIKA PASSWORD COCOK -> LOGIN SUKSES
                    HttpSession session = request.getSession();
                    
                    // ==================== TAMBAHAN UTAMA UNTUK MULTI-PROFILE ====================
                    // Mengambil nilai kolom id dari tabel 'users' (sesuaikan nama kolom id di database-mu)
                    session.setAttribute("user_id", rs.getInt("id")); 
                    // ============================================================================
                    
                    // Ambil data asli dari kolom MySQL dan simpan ke Session browser
                    session.setAttribute("username", rs.getString("username"));
                    session.setAttribute("email", rs.getString("email"));
                    session.setAttribute("genre", rs.getString("genre"));
                    session.setAttribute("avatar", rs.getString("avatar"));

                    System.out.println("Log Sukses: User '" + usernameInput + "' berhasil login.");
                    
                    // DIUBAH DI SINI: Alur diarahkan mampir ke ChooseProfile.jsp dulu, bukan langsung ke Dashboard!
                    response.sendRedirect("Frontend/ChooseProfile.jsp");
                } else {
                    // JIKA PASSWORD SALAH
                    System.out.println("Log Gagal: Password untuk user '" + usernameInput + "' salah.");
                    // Balikkan ke Login.jsp dengan membawa parameter error password salah
                    response.sendRedirect("Frontend/Login.jsp?error=wrong_password");
                }
            } else {
                // JIKA USERNAME TIDAK DITEMUKAN / BELUM TERDAFTAR
                System.out.println("Log Gagal: Username '" + usernameInput + "' belum terdaftar.");
                // Balikkan ke Login.jsp dengan membawa parameter error username tidak terdaftar
                response.sendRedirect("Frontend/Login.jsp?error=user_not_found");
            }

        } catch (SQLException e) {
            System.out.println("LoginServlet Error: " + e.getMessage());
            response.sendRedirect("Frontend/Login.jsp");
        } finally {
            // Blok penutup koneksi wajib biar database tidak gampang crash/gantung
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                System.out.println("Close DB Error: " + ex.getMessage());
            }
        }
    }
}