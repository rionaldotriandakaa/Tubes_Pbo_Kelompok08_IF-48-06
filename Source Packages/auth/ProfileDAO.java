package auth;

import config.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProfileDAO {

    public List<ProfileModel> getProfilesByUserId(int userId) {

        List<ProfileModel> list = new ArrayList<>();

        try (
            Connection conn = DatabaseConnection.getConnection();
            PreparedStatement ps =
                conn.prepareStatement(
                    "SELECT * FROM profiles WHERE user_id = ?"
                )
        ) {

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                ProfileModel p = new ProfileModel();

                p.setProfileId(rs.getInt("id"));
                p.setUserId(rs.getInt("user_id"));
                p.setProfileName(rs.getString("profile_name"));
                p.setProfileAvatar(rs.getString("avatar"));
                p.setKids(rs.getBoolean("is_kids"));

                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println("ProfileDAO Get Error: " + e.getMessage());
        }

        return list;
    }

    public String addCustomProfile(
            int userId,
            String name,
            String avatarFile,
            boolean isKids) {

        List<ProfileModel> existingProfiles =
                getProfilesByUserId(userId);

        if (existingProfiles.size() >= 4) {
            return "LIMIT_REACHED";
        }

        String status = "FAILED";

        try (
            Connection conn = DatabaseConnection.getConnection();
            PreparedStatement ps =
                conn.prepareStatement(
                    "INSERT INTO profiles "
                    + "(user_id, profile_name, avatar, is_kids) "
                    + "VALUES (?, ?, ?, ?)"
                )
        ) {

            ps.setInt(1, userId);
            ps.setString(2, name);
            ps.setString(3, avatarFile);
            ps.setBoolean(4, isKids);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                status = "SUCCESS";
            }

        } catch (SQLException e) {
            System.out.println("ProfileDAO Insert Error: " + e.getMessage());
        }

        return status;
    }
}