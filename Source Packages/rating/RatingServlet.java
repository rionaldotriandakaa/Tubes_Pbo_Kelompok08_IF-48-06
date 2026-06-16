package rating; // SESUAIKAN: Ubah sesuai dengan nama package asli di proyek Anda

import config.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * @author ACER
 */
@WebServlet("/rating")
public class RatingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Ambil data session profile yang aktif
        HttpSession session = request.getSession();
        Integer profileId = (Integer) session.getAttribute("activeProfileId");

        // Proteksi jika session habis atau belum pilih profil
        if (profileId == null) {
            response.sendRedirect(request.getContextPath() + "/Frontend/Profile.jsp");
            return;
        }

        // 2. Tangkap semua parameter dari form jsp
        String filmIdParam = request.getParameter("film_id");
        String seriesIdParam = request.getParameter("series_id");
        String nilaiParam = request.getParameter("nilai");
        String komentar = request.getParameter("komentar");

        // 3. Validasi nilai rating (bintang)
        int nilai = 0;
        if (nilaiParam != null && !nilaiParam.trim().isEmpty()) {
            nilai = Integer.parseInt(nilaiParam);
        }

        // 4. Proses Penyimpanan ke Database
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DatabaseConnection.getConnection();
            
            // Query adaptif: Mendukung pengisian film_id ATAU series_id (salah satu akan bernilai NULL)
            String sql = "INSERT INTO rating (profile_id, film_id, series_id, nilai, komentar) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            
            ps.setInt(1, profileId);
            
            // Set parameter film_id (jika dikirim dari Konten.jsp)
            if (filmIdParam != null && !filmIdParam.trim().isEmpty()) {
                ps.setInt(2, Integer.parseInt(filmIdParam));
            } else {
                ps.setNull(2, java.sql.Types.INTEGER);
            }
            
            // Set parameter series_id (jika dikirim dari kontenSeries.jsp)
            if (seriesIdParam != null && !seriesIdParam.trim().isEmpty()) {
                ps.setInt(3, Integer.parseInt(seriesIdParam));
            } else {
                ps.setNull(3, java.sql.Types.INTEGER);
            }
            
            ps.setInt(4, nilai);
            ps.setString(5, komentar);
            
            ps.executeUpdate();
            
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Rating Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Selalu bersihkan resource database di blok finally
            if (ps != null) try { ps.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }

        // 5. LOGIKA REDIRECT DINAMIS (Mengatasi Masalah Salah Halaman)
        if (filmIdParam != null && !filmIdParam.trim().isEmpty()) {
            // Jika asal kirim dari halaman Film, kembalikan ke Konten.jsp
            response.sendRedirect(request.getContextPath() + "/Frontend/Konten.jsp?id=" + filmIdParam);
        } else if (seriesIdParam != null && !seriesIdParam.trim().isEmpty()) {
            // Jika asal kirim dari halaman Series, kembalikan ke kontenSeries.jsp
            response.sendRedirect(request.getContextPath() + "/Frontend/kontenSeries.jsp?id=" + seriesIdParam);
        } else {
            // Fallback jika terjadi anomali parameter
            response.sendRedirect(request.getContextPath() + "/Frontend/Dashboard.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Mengarahkan request GET ke doPost jika diperlukan
        doPost(request, response);
    }
}