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
import Backend.repository.SearchRepository;
import java.util.List;

public class SearchService {

    private SearchRepository searchRepo = 
        new SearchRepository();

    public List<Konten> cari(String keyword, 
                              String genre, 
                              String sortBy) {
        // Kalau semua kosong, kembalikan list kosong
        if ((keyword == null || keyword.trim().isEmpty())
            && (genre == null || genre.equals("Semua"))) {
            return searchRepo.search("", "Semua", sortBy);
        }
        return searchRepo.search(keyword, genre, sortBy);
    }

    public List<String> getGenreList() {
        return searchRepo.getAllGenre();
    }
}
