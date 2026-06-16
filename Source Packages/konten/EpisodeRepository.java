/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package konten;
import config.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author ASUS
 */
public class EpisodeRepository {
    public List<Episode> findBySeriesId(int seriesId) {
        List<Episode> list = new ArrayList<>();
        String sql = "SELECT * FROM episode WHERE series_id = ? ORDER BY nomor_episode ASC";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, seriesId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Episode ep = new Episode();
                ep.setIdEpisode(rs.getInt("id"));
                ep.setIdSeries(rs.getInt("series_id"));
                ep.setNomorEpisode(rs.getInt("nomor_episode"));
                ep.setJudulEpisode(rs.getString("judul"));
                ep.setDurasi(rs.getInt("durasi"));
                list.add(ep);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (ps != null) try { ps.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }

        return list;
    }

    //mengambil satu episode berdasarkan id episode
    public Episode findById(int idEpisode) {
        String sql = "SELECT * FROM episode WHERE id = ?";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idEpisode);
            rs = ps.executeQuery();

            if (rs.next()) {
                Episode ep = new Episode();
                ep.setIdEpisode(rs.getInt("id"));
                ep.setIdSeries(rs.getInt("series_id"));
                ep.setNomorEpisode(rs.getInt("nomor_episode"));
                ep.setJudulEpisode(rs.getString("judul"));
                ep.setDurasi(rs.getInt("durasi"));
                return ep;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return null;
    }
}
