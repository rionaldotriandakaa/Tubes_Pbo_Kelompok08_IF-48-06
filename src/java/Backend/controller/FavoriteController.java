/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.controller;

import Backend.model.Favorite;
import java.util.ArrayList;

/**
 *
 * @author ACER
 */
public class FavoriteController {
    private ArrayList<Favorite> daftarFavorite;
    public FavoriteController() {
        daftarFavorite = new ArrayList<>();
    }

    // tambah favorite
    public void tambahFavorite(Favorite favorite) {
        daftarFavorite.add(favorite);
        System.out.println("Favorite berhasil ditambahkan");
    }

    // tampilkan semua favorite
    public void tampilFavorite() {
        if (daftarFavorite.isEmpty()) {
            System.out.println("Daftar favorite kosong");
        } else {
            System.out.println("Daftar Favorite:");
            for (Favorite fav : daftarFavorite) {
                System.out.println("- " + fav);
            }
        }
    }
}