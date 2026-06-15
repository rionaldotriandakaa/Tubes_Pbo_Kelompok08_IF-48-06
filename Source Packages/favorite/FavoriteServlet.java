package favorite;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * @author ACER
 */
@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {

    private FavoriteService service;

    @Override
    public void init() {
        service = new FavoriteService();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer profileId = (Integer) session.getAttribute("activeProfileId");

        if (profileId == null) {
            response.sendRedirect(request.getContextPath() + "/Frontend/Profile.jsp");
            return;
        }

        // Membaca parameter film (Mendukung CamelCase dan Underscore)
        String filmIdParam = request.getParameter("filmId");
        if (filmIdParam == null) filmIdParam = request.getParameter("film_id");

        // Membaca parameter series (Mendukung CamelCase dan Underscore)
        String seriesIdParam = request.getParameter("seriesId");
        if (seriesIdParam == null) seriesIdParam = request.getParameter("series_id");
        
        if (filmIdParam != null && !filmIdParam.trim().isEmpty()) {
            try {
                int filmId = Integer.parseInt(filmIdParam);
                service.addFavorite(profileId, filmId, "film");
            } catch (NumberFormatException e) { e.printStackTrace(); }
        } 
        else if (seriesIdParam != null && !seriesIdParam.trim().isEmpty()) {
            try {
                int seriesId = Integer.parseInt(seriesIdParam);
                service.addFavorite(profileId, seriesId, "series");
            } catch (NumberFormatException e) { e.printStackTrace(); }
        }

        response.sendRedirect(request.getContextPath() + "/Frontend/Favorites.jsp");
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}