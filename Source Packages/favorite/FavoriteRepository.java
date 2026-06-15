package favorite;

import config.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author ACER
 */
public class FavoriteRepository {

    public boolean addFilmFavorite(int profileId, int filmId) {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean success = false;

        try {
            conn = DatabaseConnection.getConnection();
            String sql = "INSERT INTO favorite(profile_id, film_id, series_id) VALUES (?, ?, NULL)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, profileId);
            ps.setInt(2, filmId);

            success = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Repository Film Error : " + e.getMessage());
        } finally {
            closeResources(ps, conn);
        }
        return success;
    }

    public boolean addSeriesFavorite(int profileId, int seriesId) {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean success = false;

        try {
            conn = DatabaseConnection.getConnection();
            String sql = "INSERT INTO favorite(profile_id, film_id, series_id) VALUES (?, NULL, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, profileId);
            ps.setInt(2, seriesId);

            success = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Repository Series Error : " + e.getMessage());
        } finally {
            closeResources(ps, conn);
        }
        return success;
    }

    private void closeResources(PreparedStatement ps, Connection conn) {
        if (ps != null) try { ps.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
}