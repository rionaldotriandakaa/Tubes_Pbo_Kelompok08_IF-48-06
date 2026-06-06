/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package movie;

import java.util.List;
/**
 *
 * @author ACER
 */
public class FilmService {

    private FilmRepository repository;

    public FilmService() {
        repository = new FilmRepository();
    }

    public List<Film> getAllFilm() {
        return repository.getAllFilm();
    }

    public Film getFilmById(int id) {
        return repository.getFilmById(id);
    }
}
