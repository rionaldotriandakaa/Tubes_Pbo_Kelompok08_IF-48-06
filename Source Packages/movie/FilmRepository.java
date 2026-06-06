/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package movie;

import config.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author ACER
 */
public class FilmRepository {

    public List<Film> getAllFilm() {

        List<Film> films = new ArrayList<>();

        try {

            Connection conn =
                    DatabaseConnection.getConnection();

            String sql = "SELECT * FROM film";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Film film = new Film();

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

    public Film getFilmById(int id){
        return null;
    }

    public boolean insertFilm(Film film){
        return true;
    }

    public boolean updateFilm(Film film){
        return true;
    }

    public boolean deleteFilm(int id){
        return true;
    }
}
