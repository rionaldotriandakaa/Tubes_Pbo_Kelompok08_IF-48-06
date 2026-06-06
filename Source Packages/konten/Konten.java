/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package konten;

/**
 *
 * @author ACER
 */
public class Konten {
    private int idKonten;
    private String judul;
    private String deskripsi;
    private String genre;
    private String thumbnail;

    public Konten() {
    }

    public Konten(int idKonten, String judul, String deskripsi,
                  String genre, String thumbnail) {
        this.idKonten = idKonten;
        this.judul = judul;
        this.deskripsi = deskripsi;
        this.genre = genre;
        this.thumbnail = thumbnail;
    }

    public int getIdKonten() {
        return idKonten;
    }

    public void setIdKonten(int idKonten) {
        this.idKonten = idKonten;
    }

    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }
}
