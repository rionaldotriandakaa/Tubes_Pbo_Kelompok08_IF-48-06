/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Backend.controller;

import Backend.model.Konten;
import Backend.service.SearchService;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.util.List;

@WebServlet("/search")
public class SearchController extends HttpServlet {

    private SearchService searchService = 
        new SearchService();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        String keyword = req.getParameter("keyword");
        String genre   = req.getParameter("genre");
        String sortBy  = req.getParameter("sort");

        // Default nilai kalau null
        if (keyword == null) keyword = "";
        if (genre == null)   genre = "Semua";
        if (sortBy == null)  sortBy = "judul";

        // Ambil hasil search
        List<Konten> hasilSearch = 
            searchService.cari(keyword, genre, sortBy);
        List<String> genreList = 
            searchService.getGenreList();

        // Kirim ke JSP
        req.setAttribute("hasilSearch", hasilSearch);
        req.setAttribute("genreList", genreList);
        req.setAttribute("keyword", keyword);
        req.setAttribute("genre", genre);
        req.setAttribute("sort", sortBy);

        req.getRequestDispatcher(
            "/Frontend/search.jsp")
            .forward(req, resp);
    }
}
