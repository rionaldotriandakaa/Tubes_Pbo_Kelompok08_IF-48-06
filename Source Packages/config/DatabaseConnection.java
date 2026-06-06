/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author ACER
 */
public class DatabaseConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/cinestream";

    private static final String USER = "root";

    private static final String PASSWORD = "";

    public static Connection getConnection() {

        Connection conn = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            System.out.println("Database Connected");

        } catch (ClassNotFoundException | SQLException e) {

            System.out.println("Database Error : "
                    + e.getMessage());

        }

        return conn;
    }
}