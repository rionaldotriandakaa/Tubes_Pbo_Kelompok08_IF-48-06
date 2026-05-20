/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.model;

import java.util.ArrayList;
/**
 *
 * @author ACER
 */

public class Series extends Konten {

    private int totalEpisode;
    private ArrayList<Episode> daftarEpisode;

    public Series(int id,
                  String judul,
                  String genre,
                  String deskripsi,
                  int durasi,
                  double ratingAverage,
                  String poster,
                  int tahunRilis,
                  boolean trending,
                  int totalEpisode) {

        super(id,
              judul,
              genre,
              deskripsi,
              durasi,
              ratingAverage,
              poster,
              tahunRilis,
              trending);

        this.totalEpisode = totalEpisode;
        this.daftarEpisode = new ArrayList<>();

    }

    public int getTotalEpisode() {
        return totalEpisode;
    }

    public ArrayList<Episode> getDaftarEpisode() {
        return daftarEpisode;
    }

    public void tambahEpisode(Episode episode) {
        daftarEpisode.add(episode);
        System.out.println("Episode berhasil ditambahkan");
    }

    public void tampilEpisode() {
        if (daftarEpisode.isEmpty()) {
            System.out.println("Belum ada episode");
        } else {
            System.out.println("Daftar Episode:");
            for (Episode e : daftarEpisode) {
                System.out.println("Episode "
                        + e.getEpisodeNumber()
                        + " : "
                        + e.getJudulEpisode());
            }
        }
    }

    @Override
    public void tampilDetail() {

        System.out.println("Series : " + judul);
        System.out.println("Genre : " + genre);
        System.out.println("Total Episode : " + totalEpisode);
        System.out.println("Rating : " + ratingAverage);
    }
}