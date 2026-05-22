/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.model;

/**
 *
 * @author ACER
 */
public class Episode {

    private int episodeNumber;
    private String judulEpisode;
    private int durasiEpisode;
    private boolean sudahDitonton;

    private Series series;

    public Episode(int episodeNumber,
                   String judulEpisode,
                   int durasiEpisode,
                   boolean sudahDitonton,
                   Series series) {

        this.episodeNumber = episodeNumber;
        this.judulEpisode = judulEpisode;
        this.durasiEpisode = durasiEpisode;
        this.sudahDitonton = sudahDitonton;
        this.series = series;
    }

    public int getEpisodeNumber() {
        return episodeNumber;
    }

    public String getJudulEpisode() {
        return judulEpisode;
    }

    public int getDurasiEpisode() {
        return durasiEpisode;
    }

    public boolean isSudahDitonton() {
        return sudahDitonton;
    }

    public Series getSeries() {
        return series;
    }

    public void playEpisode() {

        System.out.println(
            "Memutar episode "
            + episodeNumber
            + " : "
            + judulEpisode
        );
    }

    public void tampilDetailEpisode() {

        System.out.println("Episode : " + episodeNumber);
        System.out.println("Judul : " + judulEpisode);
        System.out.println("Durasi : " + durasiEpisode + " menit");

    }
}