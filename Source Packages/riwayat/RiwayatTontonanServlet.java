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

        request.setAttribute("riwayatList",
                service.getAllRiwayat());

        request.getRequestDispatcher(
                "/Frontend/MyList.jsp")
                .forward(request, response);
    }
}