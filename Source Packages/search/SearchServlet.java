/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package search;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author ACER
 */

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    private SearchService service;

    @Override
    public void init(){
        service = new SearchService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String keyword =
            request.getParameter("keyword");

        request.setAttribute(
            "hasil",
            service.searchMovies(keyword)
        );

        request.getRequestDispatcher(
            "/Frontend/Search.jsp"
        ).forward(request,response);
    }
}