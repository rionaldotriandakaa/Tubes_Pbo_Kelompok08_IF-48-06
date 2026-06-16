/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package riwayat;

import config.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author ACER
 */
public class RiwayatTontonanRepository {

    public List<RiwayatTontonan> getRiwayatByUser(int userId) {
        List<RiwayatTontonan> list = new ArrayList<>();

        String sql = "SELECT r.id, r.user_id, r.film_id, r.tanggal_tonton, " +
                     "f.judul, f.poster, f.genre, f.durasi " +
                     "FROM riwayat_tontonan r " +
                     "JOIN film f ON r.film_id = f.id " +
                     "WHERE r.user_id = ? " +
                     "ORDER BY r.tanggal_tonton DESC";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            while (rs.next()) {
                RiwayatTontonan r = new RiwayatTontonan();
                r.setIdRiwayat(rs.getInt("id"));
                r.setIdUser(rs.getInt("user_id"));
                r.setIdKonten(rs.getInt("film_id"));
                r.setTanggalTonton(rs.getTimestamp("tanggal_tonton"));
                r.setJudulKonten(rs.getString("judul"));
                r.setPosterKonten(rs.getString("poster"));
                r.setGenre(rs.getString("genre"));
                r.setDurasi(rs.getInt("durasi"));
                list.add(r);
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

    public List<RiwayatTontonan> getAllRiwayat() {
        List<RiwayatTontonan> list = new ArrayList<>();

        String sql = "SELECT r.id, r.user_id, r.film_id, r.tanggal_tonton, " +
                     "f.judul, f.poster, f.genre, f.durasi " +
                     "FROM riwayat_tontonan r " +
                     "JOIN film f ON r.film_id = f.id " +
                     "ORDER BY r.tanggal_tonton DESC";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                RiwayatTontonan r = new RiwayatTontonan();
                r.setIdRiwayat(rs.getInt("id"));
                r.setIdUser(rs.getInt("user_id"));
                r.setIdKonten(rs.getInt("film_id"));
                r.setTanggalTonton(rs.getTimestamp("tanggal_tonton"));
                r.setJudulKonten(rs.getString("judul"));
                r.setPosterKonten(rs.getString("poster"));
                r.setGenre(rs.getString("genre"));
                r.setDurasi(rs.getInt("durasi"));
                list.add(r);
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

    /**
     * Tambah satu record riwayat tontonan.
     * Gunakan INSERT IGNORE agar tidak duplikat jika nonton ulang dalam hari yang sama.
     */
    public boolean tambahRiwayat(RiwayatTontonan riwayat) {
        String sql = "INSERT INTO riwayat_tontonan (user_id, film_id, tanggal_tonton) " +
                     "VALUES (?, ?, NOW())";

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DatabaseConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, riwayat.getIdUser());
            ps.setInt(2, riwayat.getIdKonten());
            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (ps != null) try { ps.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    }

    public boolean hapusRiwayatByUser(int userId) {
        String sql = "DELETE FROM riwayat_tontonan WHERE user_id = ?";

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DatabaseConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (ps != null) try { ps.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    }
}
