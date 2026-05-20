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

    private String judulKonten;
    private boolean selesai;

    public RiwayatTontonan(String judulKonten, boolean selesai) {
        this.judulKonten = judulKonten;
        this.selesai = selesai;
    }

    public void tampilRiwayat() {
        System.out.println(judulKonten);
    }
}