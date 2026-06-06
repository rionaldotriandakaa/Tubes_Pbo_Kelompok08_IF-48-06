/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package favorite;

/**
 *
 * @author ACER
 */
public class FavoriteService {

    private FavoriteRepository repository;

    public FavoriteService() {
        repository = new FavoriteRepository();
    }

    public boolean addFavorite(int userId, int filmId) {
        return repository.addFavorite(userId, filmId);
    }
}