<%@page import="java.sql.*"%>
<%@page import="config.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // 1. Ambil parameter ID dan Tipe dari URL tombol WATCH NOW
    String idParam = request.getParameter("id");
    String tipeParam = request.getParameter("tipe"); // Nilainya: 'film' atau 'series'
    
    String title = "Konten Tidak Ditemukan";
    String videoUrl = ""; // Tempat menampung link embed YouTube dari database
    String backUrl = "Dashboard.jsp"; // Tautan balik default jika terjadi error
    
    if (idParam != null && tipeParam != null) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            int id = Integer.parseInt(idParam);
            conn = DatabaseConnection.getConnection();
            
            String sql = "";
            // 2. Logika adaptif untuk menentukan asal tabel berdasarkan parameter tipe
            if ("series".equalsIgnoreCase(tipeParam)) {
                // Mengambil data dari tabel series
                sql = "SELECT judul, video_url FROM series WHERE id = ?";
                backUrl = "kontenSeries.jsp?id=" + id;
            } else {
                // Mengambil data dari tabel film
                sql = "SELECT judul, video_url FROM film WHERE id = ?";
                backUrl = "Konten.jsp?id=" + id;
            }
            
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                title = rs.getString("judul");
                videoUrl = rs.getString("video_url");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 3. Selalu bersihkan resource database agar aman dari connection leak
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (ps != null) try { ps.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Watching <%= title %> - CineStream</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            background: #040816;
            color: white;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .container {
            width: 90%;
            max-width: 1100px;
        }
        .back-container {
            margin-bottom: 20px;
        }
        .back-btn {
            color: #bdbdbd;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
            transition: 0.3s;
        }
        .back-btn:hover {
            color: #ff9b9b;
        }
        
        /* Wadah Pemutar Video dengan Aspek Rasio Sinematik 16:9 */
        .video-wrapper {
            position: relative;
            padding-bottom: 56.25%; /* Rasio aspek 16:9 */
            height: 0;
            overflow: hidden;
            border-radius: 20px;
            box-shadow: 0 0 40px rgba(255, 155, 155, 0.15);
            background: #000;
        }
        .video-wrapper iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: none;
        }
        
        .video-info {
            margin-top: 25px;
        }
        .video-title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 5px;
        }
        .video-status {
            color: #ff9b9b;
            font-size: 14px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .error-box {
            text-align: center;
            padding: 50px 30px;
            background: rgba(255, 255, 255, 0.03);
            border-radius: 20px;
            border: 2px dashed rgba(255, 255, 255, 0.1);
        }
        .error-box h2 {
            color: #ff9b9b;
            font-size: 24px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="back-container">
        <a href="<%= backUrl %>" class="back-btn">← Kembali ke Detail</a>
    </div>

    <% if (videoUrl != null && !videoUrl.trim().isEmpty()) { %>
        <div class="video-wrapper">
            <iframe src="<%= videoUrl %>?autoplay=1&rel=0" 
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                    allowfullscreen>
            </iframe>
        </div>
        
        <div class="video-info">
            <span class="video-status">Now Streaming</span>
            <h1 class="video-title"><%= title %></h1>
        </div>
    <% } else { %>
        <div class="error-box">
            <h2>Video Belum Tersedia</h2>
            <p style="color: #aaa;">Maaf, tautan pemutar video atau trailer untuk konten ini belum diunggah di database.</p>
        </div>
    <% } %>
</div>

</body>
</html>