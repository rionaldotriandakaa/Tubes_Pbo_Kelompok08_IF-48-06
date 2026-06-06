/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rating;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
/**
 *
 * @author ACER
 */
@WebServlet("/rating")
public class RatingServlet extends HttpServlet {

    private RatingService service;

    @Override
    public void init() {
        service = new RatingService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("ratings",
                service.getAllRating());

        request.getRequestDispatcher(
                "/Frontend/Konten.jsp")
                .forward(request, response);
    }
}
