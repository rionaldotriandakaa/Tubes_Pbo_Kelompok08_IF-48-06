/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package favorite;

import config.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author ACER
 */
public class FavoriteRepository {

    public boolean addFavorite(int userId, int filmId) {

        try {

            Connection conn =
                    DatabaseConnection.getConnection();

            String sql =
                    "INSERT INTO favorite(user_id, film_id) VALUES (?, ?)";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, filmId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {

            System.out.println(
                    "Favorite Error : "
                    + e.getMessage());

        }

        return false;
    }
}