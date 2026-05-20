/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.model;

/**
 *
 * @author ACER
 */
public class Series extends Konten {

    private int totalEpisode;

    public Series(int id, String judul, String genre,
                  String deskripsi, int durasi,
                  int totalEpisode) {

        super(id, judul, genre, deskripsi, durasi);
        this.totalEpisode = totalEpisode;
    }

    public int getTotalEpisode() {
        return totalEpisode;
    }

    @Override
    public void tampilDetail() {
        System.out.println("Series : " + judul);
        System.out.println("Total Episode : " + totalEpisode);
    }
}