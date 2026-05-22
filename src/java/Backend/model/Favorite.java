/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.model;

/**
 *
 * @author ACER
 */
public class Favorite {

    private int idFavorite;
    private Konten konten;

    public Favorite(int idFavorite, Konten konten) {

        this.idFavorite = idFavorite;
        this.konten = konten;

    }

    public int getIdFavorite() {
        return idFavorite;
    }

    public Konten getKonten() {
        return konten;
    }

    public void tambahFavorite() {

        System.out.println(konten.getJudul() + " ditambahkan");

    }

    public void hapusFavorite() {

        System.out.println(konten.getJudul() + " dihapus");

    }
}