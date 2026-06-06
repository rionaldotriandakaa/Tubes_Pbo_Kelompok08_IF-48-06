/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package movie;

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
@WebServlet("/series")
public class SeriesServlet extends HttpServlet {

    private SeriesService service;

    @Override
    public void init() {
        service = new SeriesService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("seriesList",
                service.getAllSeries());

        request.getRequestDispatcher(
                "/Frontend/Series.jsp")
                .forward(request, response);
    }
}
