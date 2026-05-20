/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.repository;

import Backend.model.Favorite;
import java.util.ArrayList;
/**
 *
 * @author ACER
 */
public class FavoriteRepository {

    private ArrayList<Favorite> daftarFavorite;

    public FavoriteRepository() {
        daftarFavorite = new ArrayList<>();
    }

    public void simpanFavorite(Favorite favorite) {
        daftarFavorite.add(favorite);
        System.out.println("Favorite berhasil disimpan");
    }

    public void hapusFavorite(Favorite favorite) {
        daftarFavorite.remove(favorite);
        System.out.println("Favorite berhasil dihapus");
    }

    public void tampilFavorite() {
        if (daftarFavorite.isEmpty()) {
            System.out.println("Belum ada favorite");
        } else {
            System.out.println("Daftar Favorite:");
            for (Favorite f : daftarFavorite) {
                System.out.println("- "
                        + f.getKonten().getJudul());

            }
        }
    }
}