/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package konten;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import config.DatabaseConnection;

/**
 *
 * @author ACER
 */
@WebServlet(name = "WatchlistServlet", urlPatterns = {"/WatchlistServlet"})
public class WatchlistServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer profileId = (Integer) session.getAttribute("activeProfileId");
        
        // Proteksi session
        if (profileId == null) {
            response.sendRedirect(request.getContextPath() + "/Frontend/Profile.jsp");
            return;
        }

        String action = request.getParameter("action"); 
        String itemIdParam = request.getParameter("itemId"); 
        String tipe = request.getParameter("tipe"); 

        if (action != null && itemIdParam != null && tipe != null) {
            Connection conn = null;
            PreparedStatement ps = null;
            try {
                int itemId = Integer.parseInt(itemIdParam);
                conn = DatabaseConnection.getConnection();

                if ("add".equals(action)) {
                    // SINKRONISASI: Menggunakan tabel watchlist, kolom user_id, film_id, dan series_id
                    String sql = "INSERT INTO watchlist (user_id, film_id, series_id) VALUES (?, ?, ?)";
                    ps = conn.prepareStatement(sql);
                    ps.setInt(1, profileId);
                    
                    if ("film".equalsIgnoreCase(tipe)) {
                        ps.setInt(2, itemId);
                        ps.setNull(3, java.sql.Types.INTEGER);
                    } else {
                        ps.setNull(2, java.sql.Types.INTEGER);
                        ps.setInt(3, itemId);
                    }
                    ps.executeUpdate();
                    
                } else if ("remove".equals(action)) {
                    // SINKRONISASI: Hapus berdasarkan user_id profil yang aktif
                    String sql = "film".equalsIgnoreCase(tipe) 
                        ? "DELETE FROM watchlist WHERE user_id = ? AND film_id = ?"
                        : "DELETE FROM watchlist WHERE user_id = ? AND series_id = ?";
                    
                    ps = conn.prepareStatement(sql);
                    ps.setInt(1, profileId);
                    ps.setInt(2, itemId);
                    ps.executeUpdate();
                }

            } catch (SQLException | NumberFormatException e) {
                e.printStackTrace();
            } finally {
                if (ps != null) try { ps.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        }

        // Redirect balik ke halaman asal
        if ("add".equals(action)) {
            if ("film".equalsIgnoreCase(tipe)) {
                response.sendRedirect(request.getContextPath() + "/Frontend/Konten.jsp?id=" + itemIdParam);
            } else {
                response.sendRedirect(request.getContextPath() + "/Frontend/kontenSeries.jsp?id=" + itemIdParam);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/Frontend/MyList.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Watchlist Controller Servlet";
    }
}