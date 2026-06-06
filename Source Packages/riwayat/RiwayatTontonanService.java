/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package riwayat;

import java.util.List;
/**
 *
 * @author ACER
 */
public class RiwayatTontonanService {

    private RiwayatTontonanRepository repository;

    public RiwayatTontonanService() {
        repository = new RiwayatTontonanRepository();
    }

    public List<RiwayatTontonan> getAllRiwayat() {
        return repository.getAllRiwayat();
    }

    public boolean tambahRiwayat(RiwayatTontonan riwayat) {
        return repository.tambahRiwayat(riwayat);
    }
}