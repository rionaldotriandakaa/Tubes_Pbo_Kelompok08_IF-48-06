/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package search;

import java.util.List;
import java.util.Map;

/**
 *
 * @author ACER
 */

public class SearchService {

    private SearchRepository repository;

    public SearchService(){
        repository = new SearchRepository();
    }

    public List<Map<String, String>> search(String keyword, String genre, String sort) {
        return repository.search(keyword, genre, sort);
    }
    
    public List<String> getAllGenres() {
        return repository.getAllGenres();
    }
}