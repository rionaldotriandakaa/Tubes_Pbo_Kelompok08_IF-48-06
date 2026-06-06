/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kategori;

import config.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author ACER
 */
public class SeriesRepository {

    public List<Series> getAllSeries() {

        List<Series> list = new ArrayList<>();

        try {

            Connection conn =
                DatabaseConnection.getConnection();

            String sql =
                "SELECT * FROM series";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ResultSet rs =
                ps.executeQuery();

            while(rs.next()) {

                Series s = new Series();

                s.setIdSeries(
                    rs.getInt("id"));

                s.setJudul(
                    rs.getString("judul"));

                s.setGenre(
                    rs.getString("genre"));

                s.setDeskripsi(
                    rs.getString("deskripsi"));
                
                s.setPoster(
                    rs.getString("poster"));
                
                s.setPoster(
                    rs.getString("poster"));

                s.setTotalEpisode(
                    rs.getInt("total_episode"));

                list.add(s);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}