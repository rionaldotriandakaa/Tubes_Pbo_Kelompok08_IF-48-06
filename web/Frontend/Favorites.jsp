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
    <title>Favorites - CineStream</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        *{ margin:0; padding:0; box-sizing:border-box; font-family:'Poppins',sans-serif; }
        body{ background:#040816; color:white; overflow-x: hidden; }
        a{ text-decoration:none; }
        
        /* NAVBAR */
        .navbar{ 
            width:100%; 
            height:85px; 
            padding:0 60px; 
            display:flex; 
            justify-content:space-between; 
            align-items:center; 
            position:fixed; 
            top:0; 
            z-index:1000; 
            background:rgba(0,0,0,0.35); 
            backdrop-filter:blur(14px); 
        }
        
        .logo{ font-size:32px; font-weight:700; color:#ff9b9b; }
        
        /* PERBAIKAN: Pembungkus Tengah agar Search Bar dan Links Sejajar */
        .nav-container-center { 
            display: flex; 
            align-items: center; 
            gap: 40px; 
            position: absolute; 
            left: 50%; 
            transform: translateX(-50%); 
        }
        
        .nav-links{ display:flex; gap:25px; }
        .nav-links a{ color:#ddd; font-size:14px; transition:0.3s; font-weight: 500; }
        .nav-links a:hover, .nav-links a.active{ color:#ff9b9b; }
        
        /* NAVBAR SEARCH */
        .navbar-search { display: flex; align-items: center; }
        .navbar-search-input { 
            height: 38px; 
            width: 180px; 
            border-radius: 20px 0 0 20px; 
            background: rgba(255,255,255,0.06); 
            border: 1px solid rgba(255,255,255,0.1); 
            border-right: none; 
            padding: 0 16px; 
            color: white; 
            font-size: 13px; 
            outline: none; 
            transition: 0.3s; 
        }
        .navbar-search-input:focus { background: rgba(255,255,255,0.1); border-color: #ff9b9b; width: 230px; }
        .navbar-search-btn { 
            height: 38px; 
            padding: 0 16px; 
            border-radius: 0 20px 20px 0; 
            background: linear-gradient(90deg, #ff9b9b, #ff6b81); 
            border: none; 
            color: #040816; 
            font-size: 13px; 
            font-weight: 700; 
            cursor: pointer; 
            transition: 0.3s; 
        }
        
        .right-nav{ display:flex; align-items:center; gap:25px; margin-left: auto; }
        .bell-icon { width: 22px; height: 22px; fill: #ddd; cursor: pointer; transition: 0.3s; }
        .bell-icon:hover { fill: #ff9b9b; }
        
        .profile-wrapper-nav{ display:flex; align-items:center; gap:12px; text-decoration:none; }
        .profile-name-nav{ color:white; font-size:14px; font-weight:500; transition: 0.3s; }
        .profile-wrapper-nav:hover .profile-name-nav { color: #ff9b9b; }
        .profile{ width:42px; height:42px; border-radius:50%; background-size:cover; background-position:center; border:2px solid #ff9b9b; }
        
        /* CONTAINER CONTENT */
        .container{ width:90%; margin:auto; padding-top:140px; }
        h1{ font-size:48px; font-weight: 700; margin-bottom: 5px; }
        .subtitle{ color:#cfcfcf; margin-bottom:35px; font-size: 14px; }
        
        .movie-grid{ display:grid; grid-template-columns:repeat(auto-fill, minmax(240px, 1fr)); gap:25px; margin-bottom:50px; }
        .movie{ position:relative; overflow:hidden; border-radius:20px; background: #0b1024; transition: 0.3s; }
        .movie:hover { transform: translateY(-8px); box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5); }
        .movie img{ width:100%; height:350px; object-fit:cover; display: block; }
        
        .movie-info{ position:absolute; bottom:0; left:0; width:100%; padding:20px; background: linear-gradient(transparent, rgba(4, 8, 22, 0.95) 80%); }
        .movie-title{ font-size:18px; font-weight:700; margin-bottom: 5px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
        .badge { display: inline-block; background: rgba(255, 155, 155, 0.2); color: #ff9b9b; font-size: 10px; font-weight: bold; padding: 4px 10px; border-radius: 6px; text-transform: uppercase; letter-spacing: 0.5px; }
        .movie-link{ text-decoration:none; color:white; display:block; }
        
        .empty-state { text-align: center; padding: 80px 20px; background: rgba(255, 255, 255, 0.02); border-radius: 24px; border: 2px dashed rgba(255, 255, 255, 0.08); margin: 40px 0; }
        .empty-state h3 { font-size: 24px; color: #ff9b9b; margin-bottom: 10px; }
        .empty-state p { color: #aaa; font-size: 14px; margin-bottom: 25px; }
        .explore-btn { display: inline-block; padding: 14px 30px; background: #ff9b9b; color: #040816; text-decoration: none; font-weight: 700; border-radius: 14px; transition: 0.3s; }
        .explore-btn:hover { background: #ff8fa3; transform: translateY(-2px); }
    </style>
</head>
<body>

    <div class="navbar">
        <a href="/CineStream/Frontend/Dashboard.jsp" class="logo">CineStream</a>

        <div class="nav-container-center">
            <div class="nav-links">
                <a href="/CineStream/Frontend/Dashboard.jsp">HOME</a>
                <a href="/CineStream/movies">MOVIES</a>
                <a href="/CineStream/series">SERIES</a>
                <a href="/CineStream/Frontend/Favorites.jsp" class="active">FAVORITES</a>
                <a href="/CineStream/Frontend/MyList.jsp">MY LIST</a>
            </div>

            <form action="/CineStream/search" method="get" class="navbar-search">
                <input type="text" name="keyword" class="navbar-search-input" placeholder="Search movies...">
                <button type="submit" class="navbar-search-btn">Search</button>
            </form>
        </div>

        <div class="right-nav">
            <svg class="bell-icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 22c1.1 0 2-.9 2-2h-4c0 1.1.89 2 2 2zm6-6v-5c0-3.07-1.64-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.63 5.36 6 7.92 6 11v5l-2 2v1h16v-1l-2-2z"/>
            </svg>

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
                        // Tetap gunakan tautan jika berasal dari URL luar
                    } else {
                        posterImg = request.getContextPath() + "/Assets/posters/" + posterImg;
                    }
                    
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