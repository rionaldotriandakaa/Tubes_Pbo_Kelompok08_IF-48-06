/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kategori;

import java.util.List;
/**
 *
 * @author ACER
 */
public class SeriesService {

    private SeriesRepository repository;

    public SeriesService() {
        repository = new SeriesRepository();
    }

    public List<Series> getAllSeries() {
        return repository.getAllSeries();
    }
}
