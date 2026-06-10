package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

    public static Connection getConnection() {
        Connection conn = null;

        // Coba koneksi ke port 3306
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cinemastream",
                    "root",
                    ""
            );

            System.out.println("Database Connected via Port 3306!");
            return conn;

        } catch (Exception e) {
            System.out.println("=== ERROR PORT 3306 ===");
            e.printStackTrace();
        }

        // Coba koneksi ke port 3307
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/cinemastream",
                    "root",
                    ""
            );

            System.out.println("Database Connected via Port 3307!");
            return conn;

        } catch (Exception e) {
            System.out.println("=== ERROR PORT 3307 ===");
            e.printStackTrace();
        }

        System.out.println("Database connection failed!");
        return null;
    }
}