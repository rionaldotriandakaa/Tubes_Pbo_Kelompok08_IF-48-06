/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.repository;

/**
 *
 * @author ASUS
 */

import Backend.model.Konten;
import Backend.model.Film;
import Backend.model.Series;
//import Util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SearchRepository {

    // Cari konten berdasarkan keyword + filter genre + sort
    public List<Konten> search(String keyword, 
                                String genre, 
                                String sortBy) {
        List<Konten> hasil = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
            "SELECT * FROM konten WHERE 1=1");

        if (keyword != null && !keyword.trim().isEmpty())
            sql.append(" AND LOWER(judul) LIKE ?");

        if (genre != null && !genre.equals("Semua"))
            sql.append(" AND genre = ?");

        if ("rating".equals(sortBy))
            sql.append(" ORDER BY rating DESC");
        else if ("tahun".equals(sortBy))
            sql.append(" ORDER BY tahun_rilis DESC");
        else
            sql.append(" ORDER BY judul ASC");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = 
                 conn.prepareStatement(sql.toString())) {

            int idx = 1;
            if (keyword != null && !keyword.trim().isEmpty())
                ps.setString(idx++, 
                    "%" + keyword.toLowerCase() + "%");
            if (genre != null && !genre.equals("Semua"))
                ps.setString(idx++, genre);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                hasil.add(mapToKonten(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hasil;
    }

    // Ambil semua genre untuk dropdown filter
    public List<String> getAllGenre() {
        List<String> genres = new ArrayList<>();
        String sql = "SELECT DISTINCT genre FROM konten 
                      ORDER BY genre ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = 
                 conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                genres.add(rs.getString("genre"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genres;
    }

    // Konversi hasil query jadi object Konten
    private Konten mapToKonten(ResultSet rs) 
            throws SQLException {
        String tipe = rs.getString("tipe");

        if ("FILM".equals(tipe)) {
            return new Film(
                rs.getInt("id"),
                rs.getString("judul"),
                rs.getString("genre"),
                rs.getString("deskripsi"),
                rs.getInt("durasi"),
                rs.getString("sutradara")
            );
        } else {
            return new Series(
                rs.getInt("id"),
                rs.getString("judul"),
                rs.getString("genre"),
                rs.getString("deskripsi"),
                rs.getInt("durasi"),
                rs.getInt("total_episode")
            );
        }
    }
}
