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

    protected double ratingAverage;
    protected String poster;
    protected int tahunRilis;
    protected boolean trending;

    public Konten(int id,
                  String judul,
                  String genre,
                  String deskripsi,
                  int durasi,
                  double ratingAverage,
                  String poster,
                  int tahunRilis,
                  boolean trending) {

        this.id = id;
        this.judul = judul;
        this.genre = genre;
        this.deskripsi = deskripsi;
        this.durasi = durasi;
        this.ratingAverage = ratingAverage;
        this.poster = poster;
        this.tahunRilis = tahunRilis;
        this.trending = trending;

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

    public double getRatingAverage() {
        return ratingAverage;
    }
        
    public int getDurasi() {
        return durasi;
    }
    public void play() {

        System.out.println("Memutar konten...");

    }
    
    public abstract void tampilDetail();
}