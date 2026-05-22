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

    // constructor
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

    // getter
    public int getTotalEpisode() {
        return totalEpisode;
    }

    public ArrayList<Episode> getDaftarEpisode() {
        return daftarEpisode;
    }

    // setter
    public void setTotalEpisode(int totalEpisode) {
        this.totalEpisode = totalEpisode;
    }

    // tambah episode
    public void tambahEpisode(Episode episode) {

        daftarEpisode.add(episode);

        System.out.println(
            "Episode berhasil ditambahkan"
        );

    }

    // tampil semua episode
    public void tampilEpisode() {

        if (daftarEpisode.isEmpty()) {

            System.out.println(
                "Belum ada episode"
            );

        } else {

            System.out.println("===== DAFTAR EPISODE =====");

            for (Episode e : daftarEpisode) {

                System.out.println(
                    "Episode "
                    + e.getEpisodeNumber()
                    + " : "
                    + e.getJudulEpisode()
                );
            }
        }
    }

    // play series
    @Override
    public void play() {

        System.out.println(
            "Memutar series : " + judul
        );

    }

    // tampil detail series
    @Override
    public void tampilDetail() {

        System.out.println("===== DETAIL SERIES =====");
        System.out.println("ID : " + id);
        System.out.println("Judul : " + judul);
        System.out.println("Genre : " + genre);
        System.out.println("Deskripsi : " + deskripsi);
        System.out.println("Durasi : " + durasi + " menit");
        System.out.println("Rating : " + ratingAverage);
        System.out.println("Tahun Rilis : " + tahunRilis);
        System.out.println("Trending : " + trending);
        System.out.println("Total Episode : " + totalEpisode);

    }
}