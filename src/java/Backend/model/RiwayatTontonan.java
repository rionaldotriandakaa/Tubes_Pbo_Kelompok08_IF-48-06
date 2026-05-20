/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.model;

/**
 *
 * @author ACER
 */
public class RiwayatTontonan {

    private Konten konten;

    private boolean selesai;

    public RiwayatTontonan(Konten konten, boolean selesai) {

        this.konten = konten;
        this.selesai = selesai;

    }

    public void tampilRiwayat() {

        System.out.println(konten.getJudul());

    }
}