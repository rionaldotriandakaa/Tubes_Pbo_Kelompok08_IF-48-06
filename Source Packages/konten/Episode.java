/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package konten;

/**
 *
 * @author ACER
 */
public class Episode {
    private int idEpisode;
    private int idSeries;
    private int nomorEpisode;
    private String judulEpisode;
    private String videoUrl;

    public Episode() {
    }

    public Episode(int idEpisode, int idSeries,
                   int nomorEpisode, String judulEpisode,
                   String videoUrl) {
        this.idEpisode = idEpisode;
        this.idSeries = idSeries;
        this.nomorEpisode = nomorEpisode;
        this.judulEpisode = judulEpisode;
        this.videoUrl = videoUrl;
    }

    public int getIdEpisode() {
        return idEpisode;
    }

    public void setIdEpisode(int idEpisode) {
        this.idEpisode = idEpisode;
    }

    public int getIdSeries() {
        return idSeries;
    }

    public void setIdSeries(int idSeries) {
        this.idSeries = idSeries;
    }

    public int getNomorEpisode() {
        return nomorEpisode;
    }

    public void setNomorEpisode(int nomorEpisode) {
        this.nomorEpisode = nomorEpisode;
    }

    public String getJudulEpisode() {
        return judulEpisode;
    }

    public void setJudulEpisode(String judulEpisode) {
        this.judulEpisode = judulEpisode;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }
}
