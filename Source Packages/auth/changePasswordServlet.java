/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author viozkyyy
 */
// Disamakan urlPatterns-nya dengan action di form jsp kelompokmu
@WebServlet(name = "changePasswordServlet", urlPatterns = {"/change-password"})
public class changePasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Jika diakses lewat GET, langsung lempar balik ke halaman profile
        response.sendRedirect("Frontend/Profile.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Ambil session untuk tahu siapa user yang sedang ganti password
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        // Proteksi jika session kosong, paksa login ulang
        if (username == null) {
            response.sendRedirect("Frontend/Login.jsp");
            return;
        }

        // 2. Tangkap semua data ketikan dari form ChangePassword.jsp
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // 3. Validasi: Pastikan password baru dan konfirmasi nilainya sama
        if (!newPassword.equals(confirmPassword)) {
            System.out.println("Gagal: Password baru dan konfirmasi tidak cocok.");
            response.sendRedirect("Frontend/ChangePassword.jsp");
            return;
        }

        // 4. Panggil AuthService untuk memproses update data ke database
        AuthService authService = new AuthService();
        boolean isSuccess = authService.changePassword(username, currentPassword, newPassword);

        // 5. Alihkan halaman berdasarkan status sukses/gagal
        if (isSuccess) {
            System.out.println("Sukses ganti password untuk user: " + username);
            response.sendRedirect("Frontend/Profile.jsp");
        } else {
            System.out.println("Gagal ganti password: Password lama tidak sesuai.");
            response.sendRedirect("Frontend/ChangePassword.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet untuk menangani ganti password user";
    }
}