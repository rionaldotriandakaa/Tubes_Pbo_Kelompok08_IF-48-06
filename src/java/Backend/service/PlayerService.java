/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.service;

/**
 *
 * @author ASUS
 */
import Backend.model.Konten;
import Backend.model.RiwayatTontonan;
import Backend.repository.RiwayatTontonanRepository;

public class PlayerService {

    private RiwayatTontonanRepository riwayatRepo = 
        new RiwayatTontonanRepository();

    // Ambil progress terakhir user pada konten ini
    public int getProgressTerakhir(int profilId, 
                                    int kontenId) {
        return riwayatRepo.getProgress(profilId, kontenId);
    }

    // Simpan/update progress tontonan
    public void simpanProgress(int profilId, 
                                int kontenId, 
                                int detik, 
                                int totalDurasi) {
        // Tandai selesai kalau sudah 90% dari durasi
        boolean selesai = detik >= (totalDurasi * 0.9);
        riwayatRepo.upsertProgress(
            profilId, kontenId, detik, selesai);
    }

    // Tandai konten selesai ditonton
    public void tandaiSelesai(int profilId, 
                               int kontenId) {
        riwayatRepo.upsertProgress(
            profilId, kontenId, 0, true);
    }
}
