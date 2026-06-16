<%-- 
    Document   : Player
    Created on : May 20, 2026, 9:08:50 PM
    Author     : ASUS
--%>
<%@page import="java.sql.*"%>
<%@page import="config.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id = request.getParameter("id");

    String videoUrl = "";
    String title = "Now Playing";
    String type = "MOVIE";

    if (id != null) {
        try {
            Connection conn = DatabaseConnection.getConnection();

            String sql = "SELECT judul, video_url FROM film WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                title = rs.getString("judul");
                videoUrl = rs.getString("video_url");
            }

            conn.close();
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CineStream Player</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
/* ===== gabungan styling dari versi 1 ===== */

*{margin:0;padding:0;box-sizing:border-box;font-family:Poppins;}

body{
    background:#050816;
    color:white;
}

/* navbar */
.navbar{
    width:100%;
    height:85px;
    padding:0 60px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    position:fixed;
    top:0;
    background:rgba(0,0,0,0.35);
    backdrop-filter:blur(14px);
}

.logo{font-size:32px;font-weight:700;color:#ff9b9b;}

.player-hero{
    min-height:100vh;
    padding-top:110px;
    background:
    linear-gradient(to right,rgba(5,8,22,0.97),rgba(5,8,22,0.7)),
    url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba');
    background-size:cover;
}

.player-content{
    display:grid;
    grid-template-columns:1fr 420px;
    gap:60px;
    padding:60px 80px;
}

.video-screen iframe{
    width:100%;
    height:100%;
    border:none;
}
.video-screen{
    width:100%;
    height:300px;
    border-radius:20px;
    overflow:hidden;
}
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">CineStream</div>
</div>

<!-- PLAYER -->
<div class="player-hero">

<div class="player-content">

    <!-- LEFT -->
    <div>
        <div style="color:#ff9b9b;font-weight:700;margin-bottom:10px;">
            <%= type %>
        </div>

        <h1 style="font-size:50px;">
            <%= title %>
        </h1>

        <p style="color:#aaa;margin-top:15px;">
            Streaming from database
        </p>
    </div>

    <!-- RIGHT VIDEO -->
    <div>

        <div class="video-screen">

            <% if(videoUrl != null && !videoUrl.isEmpty()) { %>

                <iframe src="<%= videoUrl %>" allowfullscreen></iframe>

            <% } else { %>

                <div style="display:flex;justify-content:center;align-items:center;height:100%;color:#777;">
                    Video tidak tersedia
                </div>

            <% } %>

        </div>

    </div>

</div>

</div>

</body>
</html>
</html>