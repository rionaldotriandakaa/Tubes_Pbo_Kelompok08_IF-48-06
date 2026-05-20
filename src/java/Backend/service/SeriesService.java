/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.service;

import Backend.model.Series;
import Backend.repository.SeriesRepository;
/**
 *
 * @author ACER
 */
public class SeriesService {

    private SeriesRepository seriesRepository;

    public SeriesService() {
        seriesRepository = new SeriesRepository();
    }

    public void tambahSeries(Series series) {

        seriesRepository.simpanSeries(series);

        System.out.println("Series berhasil ditambahkan");

    }

    public void tampilSeries() {

        seriesRepository.ambilSeries();

    }

    public void tampilEpisode(Series series) {

        series.tampilEpisode();

    }

    public void nextEpisode() {

        System.out.println("Memutar episode berikutnya");

    }

}
