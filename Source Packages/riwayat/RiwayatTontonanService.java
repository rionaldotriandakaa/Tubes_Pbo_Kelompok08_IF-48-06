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

    private final RiwayatTontonanRepository repository;

    public RiwayatTontonanService() {
        repository = new RiwayatTontonanRepository();
    }

    public List<RiwayatTontonan> getAllRiwayat() {
        return repository.getAllRiwayat();
    }
    
    public List<RiwayatTontonan> getRiwayatByUser(int userId) {
        return repository.getRiwayatByUser(userId);
    }

    public boolean tambahRiwayat(RiwayatTontonan riwayat) {
        return repository.tambahRiwayat(riwayat);
    }
    
    public boolean hapusRiwayat(int userId) {
        return repository.hapusRiwayatByUser(userId);
    }
    
    public boolean sudahAdaRiwayat(int userId, int filmId, Integer episodeId) {
    return repository.cekRiwayat(userId, filmId, episodeId);
}
}