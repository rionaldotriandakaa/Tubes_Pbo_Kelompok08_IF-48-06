/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rating;

import java.util.List;
/**
 *
 * @author ACER
 */
public class RatingService {

    private RatingRepository repository;

    public RatingService() {
        repository = new RatingRepository();
    }

    public List<Rating> getAllRating() {
        return repository.getAllRating();
    }

    public boolean tambahRating(Rating rating) {
        return repository.tambahRating(rating);
    }

    public double getAverageRating(int idKonten) {
        return repository.getAverageRating(idKonten);
    }
}
