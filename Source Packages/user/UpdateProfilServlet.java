package user;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "UpdateProfilServlet", urlPatterns = {"/update-profile"})
// Konfigurasi standar Java EE untuk menangani upload berkas file asli (Maksimal 5MB)
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
                 maxFileSize = 1024 * 1024 * 5,       
                 maxRequestSize = 1024 * 1024 * 10)  
public class UpdateProfilServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Jika diakses paksa lewat URL browser (GET), kembalikan ke halaman profil
        response.sendRedirect("Frontend/Profile.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String currentUsername = (String) session.getAttribute("username");

        // Proteksi: Jika session hilang / belum login, paksa ke halaman login
        if (currentUsername == null) {
            response.sendRedirect("Frontend/Login.jsp");
            return;
        }

        // 1. Ambil data parameter teks biasa dari form di Profile.jsp
        String newUsername = request.getParameter("newUsername");
        String newEmail = request.getParameter("newEmail");
        String newGenre = request.getParameter("newGenre");

        // 2. Ambil data berkas foto profil baru
        Part filePart = request.getPart("newAvatarFile");
        String fileName = filePart.getSubmittedFileName();
        
        // Ambil path foto lama dari session sebagai cadangan jika user tidak ganti foto
        String newAvatarPath = (String) session.getAttribute("avatar"); 

        // Jalankan logika upload jika user memilih berkas gambar baru
        if (fileName != null && !fileName.isEmpty()) {
            // Menentukan lokasi folder penyimpanan 'uploads' di dalam server lokal Tomcat
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir(); // Otomatis bikin folder 'uploads' kalau belum ada
            }
            
            // Ambil ekstensi file asli (.jpg / .png)
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            // Amankan nama file baru berdasarkan nama user agar tidak duplikat di server
            String newFileName = currentUsername + "_profile" + fileExtension;
            
            // Tulis dan salin file asli dari laptop ke folder server
            filePart.write(uploadPath + File.separator + newFileName);
            
            // Setel alamat path relatif baru untuk disimpan ke database
            newAvatarPath = "uploads/" + newFileName;
        }

        // 3. PROSES DATABASE: Kirim data baru untuk di-update ke MySQL via UserRepository
        UserRepository userRepo = new UserRepository();
        boolean isDbUpdated = userRepo.updateProfile(currentUsername, newUsername, newEmail, newGenre, newAvatarPath);

        // 4. SINKRONISASI SESSION: Jika data masuk database, perbarui juga session browsernya
        if (isDbUpdated) {
            session.setAttribute("username", newUsername);
            session.setAttribute("email", newEmail);
            session.setAttribute("genre", newGenre);
            session.setAttribute("avatar", newAvatarPath);
            System.out.println("Log Sukses: Database dan Session akun " + currentUsername + " berhasil disinkronkan.");
        } else {
            System.out.println("Log Gagal: Gagal mengeksekusi query SQL UPDATE ke MySQL.");
        }

        // 5. Tendang balik user ke halaman Profile.jsp dengan tampilan data baru
        response.sendRedirect("Frontend/Profile.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Servlet Tugas Besar untuk mengelola update profile dan upload avatar lokal";
    }
}