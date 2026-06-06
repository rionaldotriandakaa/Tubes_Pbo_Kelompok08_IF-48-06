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
public class MoviesService {

    private MoviesRepository repository;

    public MoviesService() {
        repository = new MoviesRepository();
    }

    public List<Movies> getAllFilm() {
        return repository.getAllFilm();
    }

    public Movies getFilmById(int id) {
        return repository.getFilmById(id);
    }
}
