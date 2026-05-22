/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.repository;

import Backend.model.Series;
import java.util.ArrayList;
/**
 *
 * @author ACER
 */
public class SeriesRepository {

    private ArrayList<Series> daftarSeries;

    public SeriesRepository() {

        daftarSeries = new ArrayList<>();

    }

    public void simpanSeries(Series series) {

        daftarSeries.add(series);

        System.out.println(
            "Series berhasil disimpan"
        );

    }

    public void ambilSeries() {

        if (daftarSeries.isEmpty()) {

            System.out.println(
                "Belum ada data series"
            );

        } else {

            System.out.println(
                "Daftar Series:"
            );

            for (Series s : daftarSeries) {

                System.out.println(
                    s.getJudul()
                );

            }
        }
    }
}