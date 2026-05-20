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

    public Episode(int episodeNumber, String judulEpisode) {
        this.episodeNumber = episodeNumber;
        this.judulEpisode = judulEpisode;
    }

    public void playEpisode() {
        System.out.println("Memutar episode " + judulEpisode);
    }
}