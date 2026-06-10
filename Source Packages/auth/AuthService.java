/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package auth;

import config.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ACER
 */
public class AuthService {
    
    // Metode standar mahasiswa untuk mencocokkan password lama dan update ke password baru
    public boolean changePassword(String username, String currentPassword, String newPassword) {
        Connection conn = null;
        PreparedStatement psCheck = null;
        PreparedStatement psUpdate = null;
        ResultSet rs = null;
        boolean isSuccess = false;
        
        try {
            conn = DatabaseConnection.getConnection();
            
            // 1. Cek dulu apakah username dan password lamanya cocok di database (Nama tabel diubah jadi 'users')
            String sqlCheck = "SELECT * FROM users WHERE username = ? AND password = ?";
            psCheck = conn.prepareStatement(sqlCheck);
            psCheck.setString(1, username);
            psCheck.setString(2, currentPassword);
            rs = psCheck.executeQuery();
            
            // 2. Kalau data ditemukan (cocok), lakukan update password baru (Nama tabel diubah jadi 'users')
            if (rs.next()) {
                String sqlUpdate = "UPDATE users SET password = ? WHERE username = ?";
                psUpdate = conn.prepareStatement(sqlUpdate);
                psUpdate.setString(1, newPassword);
                psUpdate.setString(2, username);
                
                int rowsUpdated = psUpdate.executeUpdate();
                if (rowsUpdated > 0) {
                    isSuccess = true; // Ganti password berhasil
                }
            }
            
        } catch (SQLException e) {
            System.out.println("AuthService Error: " + e.getMessage());
        } finally {
            // Blok menutup connection standar yang selalu disukai dosen biar ga memory leak
            try {
                if (rs != null) rs.close();
                if (psCheck != null) psCheck.close();
                if (psUpdate != null) psUpdate.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                System.out.println("Close Connection Error: " + ex.getMessage());
            }
        }
        
        return isSuccess;
    }
}