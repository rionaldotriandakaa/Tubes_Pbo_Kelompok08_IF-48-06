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
 * @author ACER
 */
public class KontenRepository {

    public List<Konten> getAllKonten() {
        List<Konten> list = new ArrayList<>();

        try {
            Connection conn = DatabaseConnection.getConnection();

            String sql = "SELECT * FROM konten";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Konten k = new Konten();

                k.setIdKonten(rs.getInt("id_konten"));
                k.setJudul(rs.getString("judul"));
                k.setDeskripsi(rs.getString("deskripsi"));
                k.setGenre(rs.getString("genre"));
                k.setThumbnail(rs.getString("thumbnail"));

                list.add(k);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
