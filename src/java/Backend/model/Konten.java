/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.model;

/**
 *
 * @author ACER
 */

public abstract class Konten {

    protected int id;
    protected String judul;
    protected String genre;
    protected String deskripsi;
    protected int durasi;
    protected String posterPath;

    public Konten(int id, String judul, String genre,
                  String deskripsi, int durasi) {

        this.id = id;
        this.judul = judul;
        this.genre = genre;
        this.deskripsi = deskripsi;
        this.durasi = durasi;
    }

    public int getId() {
        return id;
    }

    public String getJudul() {
        return judul;
    }

    public String getGenre() {
        return genre;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public int getDurasi() {
        return durasi;
    }

    public String getPosterPath() {
        return posterPath;
    }

    public void setPosterPath(String posterPath) {
        this.posterPath = posterPath;
    }

    public abstract void tampilDetail();
}