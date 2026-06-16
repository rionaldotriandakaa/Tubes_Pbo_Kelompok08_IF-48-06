package rating;

import config.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RatingRepository {

    public List<Rating> getAllRating() {

        List<Rating> ratings = new ArrayList<>();

        try {

            Connection conn =
                    DatabaseConnection.getConnection();

            String sql =
                    "SELECT * FROM rating";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Rating rating =
                        new Rating();

                rating.setId(
                        rs.getInt("id"));

                rating.setUserId(
                        rs.getInt("user_id"));

                rating.setProfileId(
                        rs.getInt("profile_id"));

                rating.setFilmId(
                        (Integer) rs.getObject("film_id"));

                rating.setSeriesId(
                        (Integer) rs.getObject("series_id"));

                rating.setNilai(
                        rs.getInt("nilai"));

                rating.setKomentar(
                        rs.getString("komentar"));

                ratings.add(rating);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return ratings;
    }

    public boolean tambahRating(Rating rating) {

        try {

            Connection conn =
                    DatabaseConnection.getConnection();

            String sql =
                    "INSERT INTO rating "
                    + "(user_id, profile_id, series_id, nilai, komentar) "
                    + "VALUES (?, ?, ?, ?, ?)";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(
                    1,
                    rating.getUserId());

            ps.setInt(
                    2,
                    rating.getProfileId());

            ps.setInt(
                    3,
                    rating.getSeriesId());

            ps.setInt(
                    4,
                    rating.getNilai());

            ps.setString(
                    5,
                    rating.getKomentar());

            int result =
                    ps.executeUpdate();

            ps.close();
            conn.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;

        }
    }

    public double getAverageRating(int seriesId) {

        double average = 0;

        try {

            Connection conn =
                    DatabaseConnection.getConnection();

            String sql =
                    "SELECT AVG(nilai) AS avg_rating "
                    + "FROM rating "
                    + "WHERE series_id = ?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, seriesId);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                average =
                        rs.getDouble("avg_rating");

            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return average;
    }
}