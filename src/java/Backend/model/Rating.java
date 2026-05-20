/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.model;

/**
 *
 * @author ACER
 */
public class Rating {

    private int nilaiRating;
    private String komentar;

    private Konten konten;

    public Rating(int nilaiRating,
                  String komentar,
                  Konten konten) {
        
        this.nilaiRating = nilaiRating;
        this.komentar = komentar;
        this.konten = konten;
    }

    public int getNilaiRating() {
        return nilaiRating;
    }

    public String getKomentar() {
        return komentar;
    }

    public Konten getKonten() {
        return konten;
    }

    // beri rating
    public void beriRating() {
        System.out.println("Rating "
                + nilaiRating
                + " diberikan untuk "
                + konten.getJudul());
    }

    // update rating
    public void updateRating(int ratingBaru) {
        this.nilaiRating = ratingBaru;
        System.out.println("Rating berhasil diperbarui");
    }

    // tampil detail rating
    public void tampilRating() {
        System.out.println("Konten : "
                + konten.getJudul());
        System.out.println("Rating : "
                + nilaiRating);
        System.out.println("Komentar : "
                + komentar);
    }
}