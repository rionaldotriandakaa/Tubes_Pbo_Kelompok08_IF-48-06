/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package favorite;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author ACER
 */
@WebServlet("/favorite")
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
            throws IOException {

        int userId = 1; // sementara untuk demo

        int filmId =
                Integer.parseInt(
                        request.getParameter("filmId"));

        service.addFavorite(userId, filmId);

        response.sendRedirect(
                "Frontend/Favorites.jsp");
    }
}