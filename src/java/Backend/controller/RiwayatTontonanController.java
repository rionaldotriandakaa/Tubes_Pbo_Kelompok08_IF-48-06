/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.controller;

import Backend.model.RiwayatTontonan;
import java.util.ArrayList;
/**
 *
 * @author ACER
 */
public class RiwayatTontonanController {
    private ArrayList<RiwayatTontonan> daftarRiwayat;
    public RiwayatTontonanController() {
        daftarRiwayat = new ArrayList<>();
    }

    // tambah riwayat tontonan
    public void tambahRiwayat(RiwayatTontonan riwayat) {
        daftarRiwayat.add(riwayat);
        System.out.println("Riwayat berhasil ditambahkan");
    }

    // tampilkan semua riwayat
    public void tampilRiwayat() {
        if (daftarRiwayat.isEmpty()) {
            System.out.println("Belum ada riwayat tontonan");
        } else {
            System.out.println("Daftar Riwayat Tontonan:");
            for (RiwayatTontonan r : daftarRiwayat) {
                r.tampilRiwayat();
            }
        }
    }
}