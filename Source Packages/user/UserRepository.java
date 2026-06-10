package user;

import config.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserRepository {

    // Fungsi standar mahasiswa untuk update data user berdasarkan username lama
    public boolean updateProfile(String currentUsername, String newUsername, String newEmail, String newGenre, String newAvatar) {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean isSuccess = false;

        try {
            conn = DatabaseConnection.getConnection();
            
            // Query SQL untuk mengubah data di tabel 'users'
            // Catatan: Sesuaikan nama kolom (username, email, dll) dengan struktur tabel users di phpMyAdmin kelompokmu
            String sql = "UPDATE users SET username = ?, email = ?, genre = ?, avatar = ? WHERE username = ?";
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, newUsername);
            ps.setString(2, newEmail);
            ps.setString(3, newGenre);
            ps.setString(4, newAvatar);
            ps.setString(5, currentUsername);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (SQLException e) {
            System.out.println("Repository Error: " + e.getMessage());
        } finally {
            // Tutup koneksi manual ala praktikum biar tidak leak
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                System.out.println("Close Connection Error: " + ex.getMessage());
            }
        }

        return isSuccess;
    }
}