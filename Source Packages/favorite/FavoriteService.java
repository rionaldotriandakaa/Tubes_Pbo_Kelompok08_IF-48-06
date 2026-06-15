package favorite;

/**
 * @author ACER
 */
public class FavoriteService {

    private FavoriteRepository repository;

    public FavoriteService() {
        repository = new FavoriteRepository();
    }

    public boolean addFavorite(int profileId, int id, String type) {
        if ("series".equalsIgnoreCase(type)) {
            return repository.addSeriesFavorite(profileId, id);
        } else {
            return repository.addFilmFavorite(profileId, id);
        }
    }
}