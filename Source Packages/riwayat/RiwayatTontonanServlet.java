/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package riwayat;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

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
            response.sendRedirect(request.getContextPath() + "/Frontend/Login.jsp");
            return;
        }

        request.setAttribute("riwayatList", service.getRiwayatByUser(userId));

        request.getRequestDispatcher("/Frontend/MyList.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Integer userId = (Integer) request.getSession().getAttribute("userId");

        String filmIdStr = request.getParameter("filmId");
        String episodeIdStr = request.getParameter("episodeId");

        if (userId != null && filmIdStr != null) {

            int filmId = Integer.parseInt(filmIdStr);

            Integer episodeId = (episodeIdStr != null && !episodeIdStr.isEmpty())
                    ? Integer.parseInt(episodeIdStr)
                    : null;

            RiwayatTontonan r = new RiwayatTontonan();
            r.setIdUser(userId);
            r.setIdKonten(filmId);
            r.setEpisodeId(episodeId);

            // 🔥 SESSION ANTI DOUBLE REQUEST
            HttpSession session = request.getSession();

            String key = "riwayat_" + userId + "_" + filmId + "_" + (episodeId != null ? episodeId : "0");

            if (session.getAttribute(key) == null) {

                if (!service.sudahAdaRiwayat(userId, filmId, episodeId)) {
                    service.tambahRiwayat(r);
                }

                session.setAttribute(key, true);
            }
        }

        String referer = request.getHeader("Referer");
        response.sendRedirect(referer != null ? referer
                : request.getContextPath() + "/Frontend/Dashboard.jsp");
    }
}