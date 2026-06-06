/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package search;

import kategori.Movies;
import java.util.List;

/**
 *
 * @author ACER
 */

public class SearchService {

    private SearchRepository repository;

    public SearchService(){
        repository = new SearchRepository();
    }

    public List<Movies> searchMovies(String keyword){
        return repository.searchMovies(keyword);
    }
}