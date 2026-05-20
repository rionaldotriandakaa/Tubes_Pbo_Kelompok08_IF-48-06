/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.repository;

import Backend.model.Episode;
import java.util.ArrayList;
/**
 *
 * @author ACER
 */
public class EpisodeRepository {

    private ArrayList<Episode> daftarEpisode;

    public EpisodeRepository() {
        daftarEpisode = new ArrayList<>();
    }

    public void simpanEpisode(Episode episode) {
        daftarEpisode.add(episode);
        System.out.println("Episode berhasil disimpan");
    }

    public void ambilEpisode() {
        if (daftarEpisode.isEmpty()) {
            System.out.println("Belum ada data episode");
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
}