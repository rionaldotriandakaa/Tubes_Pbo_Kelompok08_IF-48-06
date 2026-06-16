<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="config.DatabaseConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String dashboardUser = (String) session.getAttribute("activeProfileName");
    String dashboardAvatar = (String) session.getAttribute("activeProfileAvatar");
    Integer profileId = (Integer) session.getAttribute("activeProfileId");

    if (profileId == null) {
        response.sendRedirect(request.getContextPath() + "/Frontend/Profile.jsp");
        return;
    }

    if (dashboardUser == null) {
        dashboardUser = "No Profile";
    }

    String dashboardImgSrc;
    if (dashboardAvatar != null && !dashboardAvatar.trim().isEmpty()) {
        dashboardImgSrc = request.getContextPath() + "/Assets/avatars/" + dashboardAvatar;
    } else {
        dashboardImgSrc = request.getContextPath() + "/Assets/avatars/avatar1.png";
    }

    List<Map<String, String>> myListItems = new ArrayList<>();
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        conn = DatabaseConnection.getConnection();
        
        // SINKRONISASI QUERY: Menggunakan nama tabel watchlist dan kolom user_id
        String sql = "SELECT f.id, f.judul, f.poster, f.deskripsi, 'film' AS tipe FROM watchlist w " +
                     "JOIN film f ON w.film_id = f.id WHERE w.user_id = ? " +
                     "UNION " +
                     "SELECT s.id, s.judul, s.poster, s.deskripsi, 'series' AS tipe FROM watchlist w " +
                     "JOIN series s ON w.series_id = s.id WHERE w.user_id = ?";
        
        ps = conn.prepareStatement(sql);
        ps.setInt(1, profileId);
        ps.setInt(2, profileId);
        rs = ps.executeQuery();

        while (rs.next()) {
            Map<String, String> item = new HashMap<>();
            item.put("id", rs.getString("id"));
            item.put("judul", rs.getString("judul"));
            item.put("poster", rs.getString("poster"));
            item.put("deskripsi", rs.getString("deskripsi"));
            item.put("tipe", rs.getString("tipe"));
            myListItems.add(item);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (ps != null) try { ps.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CineStream - My List</title>
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
        
        /* Pembungkus Tengah agar Search Bar dan Links Sejajar */
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
        .header{ padding-top:140px; padding-left:80px; padding-right:80px; margin-bottom:40px; }
        .header h1{ font-size:48px; font-weight: 700; margin-bottom:5px; }
        .header p{ color:#9ca3af; font-size: 14px; }
        
        .movie-grid{ padding:0 80px 60px; display:grid; grid-template-columns:repeat(auto-fill,minmax(260px,1fr)); gap:30px; }
        .movie-card{ background:#0b1024; border-radius:24px; overflow:hidden; transition:0.3s; display: flex; flex-direction: column; height: 100%; }
        .movie-card:hover{ transform:translateY(-8px); box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5); }
        .movie-card img{ width:100%; height:340px; object-fit:cover; display: block; }
        
        .movie-info{ padding:20px; flex-grow: 1; display: flex; flex-direction: column; justify-content: space-between; }
        .movie-info h3{ margin-bottom:10px; font-size:22px; color: white; }
        .movie-info p{ color:#8d8d8d; font-size:14px; margin-bottom:20px; line-height:24px; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden; }
        
        .btn-group{ display:flex; gap:12px; margin-top: auto; }
        .watch-btn{ flex:1; padding:14px; border:none; border-radius:14px; background:linear-gradient(90deg,#ff9b9b,#ff6b81); color:black; font-weight:700; cursor:pointer; text-align: center; }
        .remove-btn{ flex:1; padding:14px; border:none; border-radius:14px; background:#1f2937; color:white; font-weight: 600; cursor:pointer; }
        
        .empty-state { grid-column: 1 / -1; text-align: center; padding: 80px 20px; background: rgba(255, 255, 255, 0.02); border-radius: 24px; border: 2px dashed rgba(255, 255, 255, 0.08); }
        .empty-state h3 { font-size: 24px; color: #ff9b9b; margin-bottom: 10px; }
        .empty-state p { color: #aaa; font-size: 14px; margin-bottom: 25px; }
        .explore-btn { display: inline-block; padding: 14px 30px; background: #ff9b9b; color: #040816; text-decoration: none; font-weight: 700; border-radius: 14px; }
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
                <a href="/CineStream/Frontend/Favorites.jsp">FAVORITES</a>
                <a href="/CineStream/Frontend/MyList.jsp" class="active">MY LIST</a>
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

    <div class="header">
        <h1>My List</h1>
        <p>Your saved movies and series collection.</p>
    </div>

    <div class="movie-grid">
        <% if (myListItems.isEmpty()) { %>
            <div class="empty-state">
                <h3>Daftar tontonanmu masih kosong</h3>
                <p>Simpan film dan series favoritmu agar muncul di sini.</p>
                <a href="/CineStream/Frontend/Dashboard.jsp" class="explore-btn">Jelajahi Beranda</a>
            </div>
        <% } else { 
            for (Map<String, String> item : myListItems) { 
                String posterImg = item.get("poster");
                String desc = item.get("deskripsi");
                if (desc == null) desc = "No description available.";
                
                if (posterImg == null || posterImg.trim().isEmpty()) {
                    posterImg = request.getContextPath() + "/Assets/posters/default.jpg"; 
                } else if (!posterImg.toLowerCase().startsWith("http://") && !posterImg.toLowerCase().startsWith("https://")) {
                    posterImg = request.getContextPath() + "/Assets/posters/" + posterImg;
                }
                String detailUrl = "series".equals(item.get("tipe")) ? "kontenSeries.jsp" : "Konten.jsp";
        %>
                <div class="movie-card">
                    <img src="<%= posterImg %>" alt="<%= item.get("judul") %>" loading="lazy">
                    <div class="movie-info">
                        <div>
                            <h3><%= item.get("judul") %></h3>
                            <p><%= desc %></p>
                        </div>
                        <div class="btn-group">
                            <a href="<%= detailUrl %>?id=<%= item.get("id") %>" class="watch-btn">▶ WATCH</a>
                            <form action="/CineStream/WatchlistServlet" method="post" style="flex: 1; display: flex;">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="itemId" value="<%= item.get("id") %>">
                                <input type="hidden" name="tipe" value="<%= item.get("tipe") %>">
                                <button type="submit" class="remove-btn">REMOVE</button>
                            </form>
                        </div>
                    </div>
                </div>
        <% 
            } 
        } 
        %>
    </div>
</body>
</html>