/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package konten;
import java.util.List;
/**
 *
 * @author ASUS
 */
public class EpisodeService {
    private final EpisodeRepository repository;

    public EpisodeService() {
        this.repository = new EpisodeRepository();
    }

    //mengambil semua episode untuk satu series
    public List<Episode> getEpisodesBySeries(int seriesId) {
        return repository.findBySeriesId(seriesId);
    }

    //mengambil satu episode berdasarkan ID     
    public Episode getEpisodeById(int idEpisode) {
        return repository.findById(idEpisode);
    }
}
