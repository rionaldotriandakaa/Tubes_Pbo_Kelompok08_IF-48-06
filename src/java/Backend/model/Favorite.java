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
    private String namaKonten;

    public Favorite(int idFavorite, String namaKonten) {
        this.idFavorite = idFavorite;
        this.namaKonten = namaKonten;
    }

    public void tambahFavorite() {
        System.out.println(namaKonten + " ditambahkan");
    }

    public void hapusFavorite() {
        System.out.println(namaKonten + " dihapus");
    }
}