/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package search;

import config.DatabaseConnection;
import kategori.Movies;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ACER
 */

public class SearchRepository {

    public List<Movies> searchMovies(String keyword){

        List<Movies> list = new ArrayList<>();

        try{
            Connection conn =
                DatabaseConnection.getConnection();

            String sql =
                "SELECT * FROM film WHERE judul LIKE ?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setString(1, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Movies m = new Movies();

                m.setIdFilm(rs.getInt("id"));
                m.setJudul(rs.getString("judul"));
                m.setGenre(rs.getString("genre"));
                m.setDurasi(rs.getInt("durasi"));
                m.setThumbnail(rs.getString("poster"));

                list.add(m);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
}