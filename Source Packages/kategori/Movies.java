/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kategori;

/**
 *
 * @author ACER
 */
public class Movies {

    private int idFilm;
    private String judul;
    private String genre;
    private String deskripsi;
    private int durasi;
    private String thumbnail;
    private String videoUrl;

    public Movies() {
    }

    public Movies(int idFilm, String judul, String genre,
                String deskripsi, int durasi,
                String thumbnail, String videoUrl) {
        this.idFilm = idFilm;
        this.judul = judul;
        this.genre = genre;
        this.deskripsi = deskripsi;
        this.durasi = durasi;
        this.thumbnail = thumbnail;
        this.videoUrl = videoUrl;
    }

    public int getIdFilm() {
        return idFilm;
    }

    public void setIdFilm(int idFilm) {
        this.idFilm = idFilm;
    }

    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public int getDurasi() {
        return durasi;
    }

    public void setDurasi(int durasi) {
        this.durasi = durasi;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }
}