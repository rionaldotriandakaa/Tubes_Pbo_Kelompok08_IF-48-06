package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    public static Connection getConnection() {
        Connection conn = null;
        
        // JALUR 1: Untuk Laptop Windows Temanmu (Port 3306, Tanpa Password)
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinemastream", "root", "");
            if (conn != null) {
                System.out.println("Database Connected via Port 3306 (Windows Mode)!");
                return conn;
            }
        } catch (Exception e) {
            // Abaikan error port 3306 di Mac, langsung lanjut ke Jalur 2
        }

        // JALUR 2: Untuk Laptop Mac Kamu (Port 3307, Tanpa Password)
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/cinemastream", "root", "");
            if (conn != null) {
                System.out.println("Database Connected via Port 3307 (Mac Mode)!");
                return conn;
            }
        } catch (Exception e) {
            System.out.println("Database Error (Semua Jalur Gagal): " + e.getMessage());
        }

        return conn;
    }
}