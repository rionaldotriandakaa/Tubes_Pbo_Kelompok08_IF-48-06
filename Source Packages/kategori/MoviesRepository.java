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
public class MoviesRepository {

    public List<Movies> getAllFilm() {

        List<Movies> films = new ArrayList<>();

        try {

            Connection conn =
                    DatabaseConnection.getConnection();

            String sql = "SELECT * FROM film";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Movies film = new Movies();

                film.setIdFilm(
                        rs.getInt("id"));

                film.setJudul(
                        rs.getString("judul"));

                film.setGenre(
                        rs.getString("genre"));

                film.setDeskripsi(
                        rs.getString("deskripsi"));

                film.setDurasi(
                        rs.getInt("durasi"));

                film.setThumbnail(
                        rs.getString("poster"));

                films.add(film);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return films;
    }

    public Movies getFilmById(int id){
        return null;
    }

    public boolean insertFilm(Movies film){
        return true;
    }

    public boolean updateFilm(Movies film){
        return true;
    }

    public boolean deleteFilm(int id){
        return true;
    }
}
