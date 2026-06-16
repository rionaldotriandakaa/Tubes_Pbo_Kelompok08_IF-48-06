/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package search;

import java.io.IOException;
import java.util.List;
import java.util.Map;
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

        String keyword = request.getParameter("keyword");
        String genre   = request.getParameter("genre");
        String sort    = request.getParameter("sort");

        if (keyword == null) keyword = "";
        if (genre == null)   genre = "";
        if (sort == null)    sort = "terbaru";

        List<Map<String, String>> hasil = service.search(keyword, genre, sort);
        List<String> daftarGenre = service.getAllGenres();

        request.setAttribute("hasil",       hasil);
        request.setAttribute("daftarGenre", daftarGenre);
        request.setAttribute("keyword",     keyword);
        request.setAttribute("genre",       genre);
        request.setAttribute("sort",        sort);

        
        request.getRequestDispatcher(
            "/Frontend/Search.jsp"
        ).forward(request,response);
    }
}