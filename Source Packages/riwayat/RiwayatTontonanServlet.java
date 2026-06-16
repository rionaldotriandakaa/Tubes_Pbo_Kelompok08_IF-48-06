/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package riwayat;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
/**
 *
 * @author ACER
 */
@WebServlet("/riwayat")
public class RiwayatTontonanServlet extends HttpServlet {

    private RiwayatTontonanService service;

    @Override
    public void init() {
        service = new RiwayatTontonanService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Integer userId = (Integer) request.getSession().getAttribute("userId");

        if (userId == null) {
            // Belum login, redirect ke halaman login
            response.sendRedirect(request.getContextPath() + "/Frontend/Login.jsp");
            return;
        }
        request.setAttribute("riwayatList", service.getRiwayatByUser(userId));

        request.getRequestDispatcher(
                "/Frontend/MyList.jsp")
                .forward(request, response);
    }
    
        @Override
         protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Integer userId = (Integer) request.getSession().getAttribute("userId");
        String filmIdStr = request.getParameter("filmId");

        if (userId != null && filmIdStr != null) {
            RiwayatTontonan r = new RiwayatTontonan();
            r.setIdUser(userId);
            r.setIdKonten(Integer.parseInt(filmIdStr));
            service.tambahRiwayat(r);
        }

        // Redirect kembali ke halaman yang memanggil
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer != null ? referer : request.getContextPath() + "/Frontend/Dashboard.jsp");
    }
}