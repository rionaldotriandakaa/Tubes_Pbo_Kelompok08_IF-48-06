/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Backend.controller;

import Backend.model.Konten;
import Backend.service.PlayerService;
import Backend.service.KontenService;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/player")
public class PlayerController extends HttpServlet {

    private PlayerService playerService = 
        new PlayerService();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        String kontenIdStr = req.getParameter("id");
        // Ambil profil dari session
        HttpSession session = req.getSession();
        Integer profilId = (Integer) 
            session.getAttribute("profilId");

        if (kontenIdStr == null || profilId == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        int kontenId = Integer.parseInt(kontenIdStr);

        // Ambil progress terakhir
        int progressTerakhir = 
            playerService.getProgressTerakhir(
                profilId, kontenId);

        req.setAttribute("kontenId", kontenId);
        req.setAttribute("progressTerakhir", 
            progressTerakhir);

        req.getRequestDispatcher(
            "/Frontend/player.jsp")
            .forward(req, resp);
    }

    // Dipanggil saat save progress (dari JavaScript)
    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        int kontenId = Integer.parseInt(
            req.getParameter("kontenId"));
        int detik = Integer.parseInt(
            req.getParameter("detik"));
        int totalDurasi = Integer.parseInt(
            req.getParameter("totalDurasi"));

        HttpSession session = req.getSession();
        Integer profilId = (Integer) 
            session.getAttribute("profilId");

        if (profilId != null) {
            playerService.simpanProgress(
                profilId, kontenId, detik, totalDurasi);
        }

        resp.setStatus(HttpServletResponse.SC_OK);
    }
}
