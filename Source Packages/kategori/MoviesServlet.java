/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kategori;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author ACER
 */
@WebServlet("/movies")
public class MoviesServlet extends HttpServlet {

    private MoviesService service;

    @Override
    public void init() {
        service = new MoviesService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("films",
                service.getAllFilm());

        request.getRequestDispatcher(
                "/Frontend/Movies.jsp")
                .forward(request, response);
    }
}
