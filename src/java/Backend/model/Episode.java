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

    private Series series;

    public Episode(int episodeNumber,
                   String judulEpisode,
                   Series series) {

        this.episodeNumber = episodeNumber;
        this.judulEpisode = judulEpisode;
        this.series = series;
    }

    public void playEpisode() {

        System.out.println("Memutar episode " + judulEpisode);

    }

    public Series getSeries() {

        return series;

    }
}