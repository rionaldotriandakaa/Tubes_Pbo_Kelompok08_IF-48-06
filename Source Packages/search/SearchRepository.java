/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package search;

import config.DatabaseConnection;
import java.sql.*;
import java.util.*;

/**
 *
 * @author ACER
 */

public class SearchRepository {

    public List<Map<String, String>> search(String keyword, String genre, String sort) {
        List<Map<String, String>> list = new ArrayList<>();

        if (keyword == null) keyword = "";
        if (genre == null) genre = "";
        if (sort == null) sort = "terbaru";

        // Tentukan ORDER BY berdasarkan pilihan sort
        String orderBy;
        switch (sort) {
            case "az":      orderBy = "judul ASC";           break;
            case "za":      orderBy = "judul DESC";          break;
            case "terlama": orderBy = "tahun_rilis ASC";     break;
            default:        orderBy = "tahun_rilis DESC";    break; // "terbaru"
        }

        String queryParam = "%" + keyword + "%";
        boolean filterGenre = !genre.isEmpty();

        // Bangun SQL UNION (film + series) dengan kondisi genre opsional
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT id, judul, poster, genre, durasi AS info_tambahan, 'film' AS tipe, tahun_rilis ")
           .append("FROM film WHERE (judul LIKE ? OR genre LIKE ?)");
        if (filterGenre) sql.append(" AND genre = ?");

        sql.append(" UNION ");

        sql.append("SELECT id, judul, poster, genre, CONCAT(total_episode, ' Episodes') AS info_tambahan, 'series' AS tipe, tahun_rilis ")
           .append("FROM series WHERE (judul LIKE ? OR genre LIKE ?)");
        if (filterGenre) sql.append(" AND genre = ?");

        sql.append(" ORDER BY ").append(orderBy);

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection();
            ps = conn.prepareStatement(sql.toString());

            int idx = 1;
            ps.setString(idx++, queryParam);
            ps.setString(idx++, queryParam);
            if (filterGenre) ps.setString(idx++, genre);

            ps.setString(idx++, queryParam);
            ps.setString(idx++, queryParam);
            if (filterGenre) ps.setString(idx++, genre);

            rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> item = new HashMap<>();
                item.put("id",    rs.getString("id"));
                item.put("judul", rs.getString("judul"));
                item.put("poster", rs.getString("poster"));
                item.put("genre", rs.getString("genre"));
                item.put("info",  rs.getString("info_tambahan"));
                item.put("tipe",  rs.getString("tipe"));
                list.add(item);
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

    //mengambil semua genre unik dari film dan series (untuk dropdown filter)
    public List<String> getAllGenres() {
        List<String> genres = new ArrayList<>();
        String sql = "SELECT DISTINCT genre FROM film WHERE genre IS NOT NULL " +
                     "UNION " +
                     "SELECT DISTINCT genre FROM series WHERE genre IS NOT NULL " +
                     "ORDER BY genre ASC";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                genres.add(rs.getString("genre"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (ps != null) try { ps.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }

        return genres;
    }
}
