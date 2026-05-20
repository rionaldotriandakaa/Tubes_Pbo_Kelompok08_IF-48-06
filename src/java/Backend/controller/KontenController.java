/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.controller;

import Backend.model.Konten;
import java.util.ArrayList;

/**
 *
 * @author ACER
 */
public class KontenController {
    private ArrayList<Konten> daftarKonten;
    public KontenController() {
        daftarKonten = new ArrayList<>();
    }

    // tambah konten
    public void tambahKonten(Konten konten) {
        daftarKonten.add(konten);
        System.out.println(konten.getJudul() + " berhasil ditambahkan");
    }

    // tampil semua konten
    public void tampilKonten() {
        if (daftarKonten.isEmpty()) {
            System.out.println("Belum ada konten");
        } else {
            System.out.println("Daftar Konten:");
            for (Konten k : daftarKonten) {
                System.out.println("- " + k.getJudul());
            }
        }
    }

    // cari konten berdasarkan judul
    public void cariKonten(String judul) {
        boolean ditemukan = false;
        for (Konten k : daftarKonten) {
            if (k.getJudul().equalsIgnoreCase(judul)) {
                System.out.println("Konten ditemukan:");
                k.tampilDetail();
                ditemukan = true;
            }
        }
        if (!ditemukan) {
            System.out.println("Konten tidak ditemukan");
        }
    }
}