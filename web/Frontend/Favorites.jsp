<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="config.DatabaseConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 1. Mengambil data session profile
    String dashboardUser = (String) session.getAttribute("activeProfileName");
    String dashboardAvatar = (String) session.getAttribute("activeProfileAvatar");
    Integer profileId = (Integer) session.getAttribute("activeProfileId");

    if (dashboardUser == null) {
        dashboardUser = "No Profile";
    }

    // 2. Menentukan path avatar profile
    String dashboardImgSrc;
    if (dashboardAvatar != null && !dashboardAvatar.trim().isEmpty()) {
        dashboardImgSrc = request.getContextPath() + "/Assets/avatars/" + dashboardAvatar;
    } else {
        dashboardImgSrc = request.getContextPath() + "/Assets/avatars/avatar1.png";
    }

    // 3. Mengambil data film & series favorit dari Database (GABUNGAN)
    List<Map<String, String>> favoriteItems = new ArrayList<>();
    
    if (profileId != null) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DatabaseConnection.getConnection();
            
            // UNION SQL: Mengambil data film dan data series secara bersamaan
            String sql = "SELECT f.id, f.judul, f.poster, 'film' AS tipe FROM favorite fav " +
                         "JOIN film f ON fav.film_id = f.id WHERE fav.profile_id = ? " +
                         "UNION " +
                         "SELECT s.id, s.judul, s.poster, 'series' AS tipe FROM favorite fav " +
                         "JOIN series s ON fav.series_id = s.id WHERE fav.profile_id = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setInt(1, profileId);
            ps.setInt(2, profileId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> item = new HashMap<>();
                item.put("id", rs.getString("id"));
                item.put("judul", rs.getString("judul"));
                item.put("poster", rs.getString("poster"));
                item.put("tipe", rs.getString("tipe"));
                favoriteItems.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (ps != null) try { ps.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Favorites</title>
    <style>
        *{ margin:0; padding:0; box-sizing:border-box; font-family:'Poppins',sans-serif; }
        body{ background:#040816; color:white; }
        .navbar{ width:100%; height:85px; padding:0 60px; display:flex; align-items:center; position:fixed; top:0; z-index:1000; background:rgba(0,0,0,0.35); backdrop-filter:blur(14px); }
        .logo{ font-size:32px; font-weight:700; color:#ff9b9b; }
        .nav-links{ display:flex; gap:35px; position:absolute; left:50%; transform:translateX(-50%); }
        .nav-links a{ color:#ddd; text-decoration:none; font-size:14px; transition:0.3s; }
        .nav-links a:hover{ color:#ff9b9b; }
        .right-nav{ display:flex; align-items:center; gap:20px; margin-left:auto; }
        .profile{ width:42px; height:42px; border-radius:50%; background-size:cover; background-position:center; border:2px solid #ff9b9b; }
        .profile-wrapper-nav{ display:flex; align-items:center; gap:12px; text-decoration:none; }
        .profile-wrapper-nav:hover .profile-name-nav { color: #ff9b9b; }
        .profile-name-nav{ color:white; font-size:14px; font-weight:500; transition: 0.3s; }
        .container{ width:90%; margin:auto; padding-top:120px; }
        h1{ margin-top:20px; font-size:58px; }
        .subtitle{ margin-top:10px; color:#cfcfcf; margin-bottom:35px; }
        .movie-grid{ display:grid; grid-template-columns:repeat(4, 1fr); gap:20px; margin-top:30px; margin-bottom:50px; }
        .movie{ position:relative; overflow:hidden; border-radius:15px; cursor:pointer; background: #111; }
        .movie img{ width:100%; height:350px; object-fit:cover; display: block; }
        .movie-info{ position:absolute; bottom:0; left:0; width:100%; padding:15px; background: linear-gradient(transparent, rgba(0,0,0,0.9)); }
        .movie-title{ font-size:18px; font-weight:700; }
        .badge { display: inline-block; background: #ff9b9b; color: #040816; font-size: 10px; font-weight: bold; padding: 3px 8px; border-radius: 5px; margin-top: 5px; text-transform: uppercase; }
        .movie-link{ text-decoration:none; color:white; display:block; }
        .movie-link:hover { transform:scale(1.03); transition:0.3s; }
        .empty-state { text-align: center; padding: 80px 20px; background: rgba(255, 255, 255, 0.03); border-radius: 20px; border: 2px dashed rgba(255, 255, 255, 0.1); margin: 40px 0; }
        .empty-state h3 { font-size: 24px; color: #ff9b9b; margin-bottom: 10px; }
        .empty-state p { color: #aaa; font-size: 14px; margin-bottom: 20px; }
        .explore-btn { display: inline-block; padding: 10px 25px; background: #ff9b9b; color: #040816; text-decoration: none; font-weight: 600; border-radius: 25px; transition: 0.3s; }
        .explore-btn:hover { background: #ff8fa3; transform: translateY(-2px); }
    </style>
</head>
<body>

<div class="navbar">
    <div class="logo">CineStream</div>
    <div class="nav-links">
        <a href="/CineStream/Frontend/Dashboard.jsp">HOME</a>
        <a href="/CineStream/movies">MOVIES</a>
        <a href="/CineStream/series">SERIES</a>
        <a href="/CineStream/Frontend/Favorites.jsp">FAVORITES</a>
        <a href="/CineStream/Frontend/MyList.jsp">MY LIST</a>
    </div>
    <div class="right-nav">
        <a href="/CineStream/Frontend/Profile.jsp" class="profile-wrapper-nav">
            <span class="profile-name-nav"><%= dashboardUser %></span>
            <div class="profile" style="background-image:url('<%= dashboardImgSrc %>');"></div>
        </a>
    </div>
</div>

<div class="container">
    <h1>Your Favorites</h1>
    <p class="subtitle">Kelola film favorit dan serial pilihanmu disini.</p>

    <% if (favoriteItems.isEmpty()) { %>
        <div class="empty-state">
            <h3>Belum ada film atau series favorit</h3>
            <p>Kamu belum menambahkan apa pun ke daftar favorit di profil ini.</p>
            <a href="/CineStream/Frontend/Dashboard.jsp" class="explore-btn">Jelajahi Beranda</a>
        </div>
    <% } else { %>
        <div class="movie-grid">
            <% for (Map<String, String> item : favoriteItems) { 
                String posterImg = item.get("poster");
                
                if(posterImg == null || posterImg.trim().isEmpty()) {
                    posterImg = request.getContextPath() + "/Assets/posters/default.jpg"; 
                } else if (posterImg.toLowerCase().startsWith("http://") || posterImg.toLowerCase().startsWith("https://")) {
                    // Biarkan jika link luar
                } else {
                    posterImg = request.getContextPath() + "/Assets/posters/" + posterImg;
                }
                
                // DISESUAIKAN: Menggunakan k kecil sesuai dengan nama file Anda (kontenSeries.jsp)
                String detailUrl = "series".equals(item.get("tipe")) ? "/CineStream/Frontend/kontenSeries.jsp" : "/CineStream/Frontend/Konten.jsp";
            %>
                <div class="movie">
                    <a href="<%= detailUrl %>?id=<%= item.get("id") %>" class="movie-link">
                        <img src="<%= posterImg %>" alt="<%= item.get("judul") %>" loading="lazy">
                        <div class="movie-info">
                            <div class="movie-title"><%= item.get("judul") %></div>
                            <span class="badge"><%= item.get("tipe") %></span>
                        </div>
                    </a>
                </div>
            <% } %>
        </div>
    <% } %>
</div>
</body>
</html>