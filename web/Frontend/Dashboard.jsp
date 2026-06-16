<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@page import="config.DatabaseConnection"%>
<%@page import="kategori.Movies"%>
<%
    // 1. Ambil data film untuk row trending dari Servlet request
    List<Movies> films = (List<Movies>)request.getAttribute("films");

    // ================= SINKRONISASI SESSION PROFILE =================
    String dashboardUser = (String) session.getAttribute("activeProfileName");
    String dashboardAvatar = (String) session.getAttribute("activeProfileAvatar");
    Integer profileId = (Integer) session.getAttribute("activeProfileId");
    String userGenre = (String) session.getAttribute("genre");
    
    System.out.println("GENRE SESSION = " + userGenre);

    if (profileId == null) {
        response.sendRedirect(request.getContextPath() + "/Frontend/Profile.jsp");
        return;
    }

    if (dashboardUser == null) {
        dashboardUser = "No Profile";
    }
    if (userGenre == null || userGenre.trim().isEmpty()) {
        userGenre = "Action"; // Default fallback
    }

    // Avatar profil navbar
    String dashboardImgSrc;
    if (dashboardAvatar != null && !dashboardAvatar.trim().isEmpty()) {
        dashboardImgSrc = request.getContextPath() + "/Assets/avatars/" + dashboardAvatar;
    } else {
        dashboardImgSrc = request.getContextPath() + "/Assets/avatars/avatar1.png";
    }

    // ================= AMBIL DATA CONTINUE WATCHING (DINAMIS DB) =================
    List<Map<String, String>> continueList = new ArrayList<>();
    // ================= AMBIL DATA RECOMMENDED FOR YOU (DINAMIS DB) =================
    List<Map<String, String>> recList = new ArrayList<>();

    Connection conn = null;
    PreparedStatement psCont = null;
    PreparedStatement psRec = null;
    ResultSet rsCont = null;
    ResultSet rsRec = null;

    try {
        conn = DatabaseConnection.getConnection();

        // Query Continue Watching: Ambil konten yang baru saja direview/diulas oleh profil ini
        String sqlContinue = "SELECT f.id, f.judul, f.poster, 'film' AS tipe FROM rating r " +
                             "JOIN film f ON r.film_id = f.id WHERE r.profile_id = ? " +
                             "UNION " +
                             "SELECT s.id, s.judul, s.poster, 'series' AS tipe FROM rating r " +
                             "JOIN series s ON r.series_id = s.id WHERE r.profile_id = ? " +
                             "LIMIT 3";
        psCont = conn.prepareStatement(sqlContinue);
        psCont.setInt(1, profileId);
        psCont.setInt(2, profileId);
        rsCont = psCont.executeQuery();
        while(rsCont.next()) {
            Map<String, String> item = new HashMap<>();
            item.put("id", rsCont.getString("id"));
            item.put("judul", rsCont.getString("judul"));
            item.put("poster", rsCont.getString("poster"));
            item.put("tipe", rsCont.getString("tipe"));
            continueList.add(item);
        }

        // Query Recommended For You: Ambil konten berdasarkan kesamaan genre favorit user di session
        String sqlRec =
            "SELECT DISTINCT f2.id, f2.judul, f2.poster, f2.genre, 'film' AS tipe " +
            "FROM rating r " +
            "JOIN film f1 ON r.film_id = f1.id " +
            "JOIN film f2 ON f1.genre = f2.genre " +
            "WHERE r.profile_id = ? " +
            "AND r.nilai >= 4 " +
            "AND f2.id != f1.id " +
            "LIMIT 4";

        psRec = conn.prepareStatement(sqlRec);
        psRec.setInt(1, profileId);

        rsRec = psRec.executeQuery();
        while(rsRec.next()) {
            Map<String, String> item = new HashMap<>();
            item.put("id", rsRec.getString("id"));
            item.put("judul", rsRec.getString("judul"));
            item.put("poster", rsRec.getString("poster"));
            item.put("genre", rsRec.getString("genre"));
            item.put("tipe", rsRec.getString("tipe"));
            recList.add(item);
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rsCont != null) try { rsCont.close(); } catch (Exception e) {}
        if (psCont != null) try { psCont.close(); } catch (Exception e) {}
        if (rsRec != null) try { rsRec.close(); } catch (Exception e) {}
        if (psRec != null) try { psRec.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CineStream Dashboard</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
        <style>
            *{ margin:0; padding:0; box-sizing:border-box; font-family:'Poppins',sans-serif; }
            body{ background:#040816; color:white; overflow-x:hidden; }
            a{ text-decoration:none; }
            .navbar{ width:100%; height:85px; padding:0 60px; display:flex; justify-content:space-between; align-items:center; position:fixed; top:0; z-index:1000; background:rgba(0,0,0,0.35); backdrop-filter:blur(14px); }
            .logo{ font-size:32px; font-weight:700; color:#ff9b9b; }
            .nav-container-center { display: flex; align-items: center; gap: 40px; position: absolute; left: 50%; transform: translateX(-50%); }
            .nav-links{ display:flex; gap:25px; }
            .nav-links a{ color:#ddd; font-size:14px; transition:0.3s; font-weight: 500; }
            .nav-links a:hover, .nav-links a.active{ color:#ff9b9b; }
            .navbar-search { display: flex; align-items: center; }
            .navbar-search-input { height: 38px; width: 180px; border-radius: 20px 0 0 20px; background: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.1); border-right: none; padding: 0 16px; color: white; font-size: 13px; outline: none; transition: 0.3s; }
            .navbar-search-input:focus { background: rgba(255,255,255,0.1); border-color: #ff9b9b; width: 230px; }
            .navbar-search-btn { height: 38px; padding: 0 16px; border-radius: 0 20px 20px 0; background: linear-gradient(90deg, #ff9b9b, #ff6b81); border: none; color: #040816; font-size: 13px; font-weight: 700; cursor: pointer; transition: 0.3s; }
            .right-nav{ display:flex; align-items:center; gap:25px; }
            .bell-icon { width: 22px; height: 22px; fill: #ddd; cursor: pointer; transition: 0.3s; }
            .bell-icon:hover { fill: #ff9b9b; }
            .profile-wrapper-nav { display: flex; align-items: center; gap: 12px; text-decoration: none; }
            .profile-name-nav { font-size: 14px; font-weight: 500; color: white; }
            .profile{ width:42px; height:42px; border-radius:50%; background-size:cover; background-position:center; border:2px solid #ff9b9b; }
            .hero{ height:100vh; background: linear-gradient(to right, rgba(4,8,22,0.96) 25%, rgba(4,8,22,0.4)), url('../Assets/Dasboard.jpg'); background-size:cover; background-position:center; display:flex; align-items:center; padding:0 80px; }
            .hero-content{ max-width:650px; }
            .tag{ display:inline-block; padding:8px 18px; background:#ff9b9b; color:black; font-size:12px; font-weight:700; border-radius:20px; margin-bottom:25px; }
            .hero h1{ font-size:90px; line-height:92px; margin-bottom:25px; font-weight:800; }
            .hero p{ color:#d2d2d2; line-height:32px; margin-bottom:35px; }
            .hero-buttons{ display:flex; gap:20px; }
            .watch-btn{ padding:18px 38px; border:none; border-radius:40px; background:linear-gradient(90deg,#ff9b9b,#ff6b81); color:black; font-weight:700; cursor:pointer; }
            .fav-btn{ padding:18px 38px; border:none; border-radius:40px; background:rgba(255,255,255,0.08); color:white; font-weight: 600; }
            .section{ padding:40px 80px; }
            .section-title{ font-size:32px; margin-bottom:4px; font-weight: 700; }
            .section-subtitle{ color:#6b7280; margin-bottom:30px; letter-spacing:2px; font-size:12px; font-weight: 600; }
            .movie-row{ display:flex; gap:25px; overflow-x:auto; padding: 10px 0; }
            .movie-row::-webkit-scrollbar{ display:none; }
            .movie-card-link { display: block; color: white; }
            .movie-card{ min-width:240px; background:#0b1024; border-radius:24px; overflow:hidden; transition:0.3s; }
            .movie-card:hover{ transform:translateY(-10px); }
            .movie-card img{ width:100%; height:340px; object-fit:cover; display: block; }
            .movie-info{ padding:20px; }
            .movie-info h3{ font-size: 18px; font-weight: 700; margin-bottom:6px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
            .movie-info p{ color:#8c8c8c; font-size:13px; }
            .continue-grid{ display:grid; grid-template-columns:repeat(3,1fr); gap:25px; }
            .continue-card-link { display: block; color: white; }
            .continue-card{ background:#0b1024; border-radius:22px; padding:20px; display:flex; align-items:center; gap:18px; transition:0.3s; }
            .continue-card img{ width:110px; height:75px; border-radius:12px; object-fit:cover; }
            .continue-info h4{ font-size: 16px; font-weight: 600; margin-bottom:6px; }
            .continue-info p{ color:#8d8d8d; font-size:13px; }
            .continue-card:hover{ transform:translateY(-5px); background: #111736; }
            .badge-type { display:inline-block; font-size:10px; padding:2px 8px; background:rgba(255,155,155,0.2); color:#ff9b9b; border-radius:5px; margin-top:5px; text-transform:uppercase; font-weight:700; }
        </style>
    </head>
    <body>

        <div class="navbar">
            <a href="/CineStream/Frontend/Dashboard.jsp" class="logo">CineStream</a>
            <div class="nav-container-center">
                <div class="nav-links">
                    <a href="/CineStream/Frontend/Dashboard.jsp" class="active">HOME</a>
                    <a href="/CineStream/movies">MOVIES</a>
                    <a href="/CineStream/series">SERIES</a>
                    <a href="/CineStream/Frontend/Favorites.jsp">FAVORITES</a>
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
                    <div class="profile" style="background-image: url('<%= dashboardImgSrc %>');"></div>
                </a>
            </div>
        </div>

        <div class="hero">
            <div class="hero-content">
                <div class="tag">FEATURED PREMIERE</div>
                <h1>AVENGERS<br>DOOMSDAY</h1>
                <p>When the greatest threat rises from the shadows, the Avengers must reunite to face the ultimate destruction.</p>
                <div class="hero-buttons">
                    <a href="<%= request.getContextPath() %>/Frontend/Konten.jsp?id=1">
                        <button class="watch-btn">▶ WATCH NOW</button>
                    </a>
                    <a href="Favorites.jsp"><button class="fav-btn">+ ADD TO FAVORITES</button></a>
                </div>
            </div>
        </div>

        <div class="section">
            <h2 class="section-title">Trending Now</h2>
            <p class="section-subtitle">GLOBAL FAVORITES THIS WEEK</p>
            <div class="movie-row">
            <%
            if(films != null){
                for(Movies film : films){
                    String currentPoster = film.getThumbnail();
                    if (currentPoster == null || currentPoster.trim().isEmpty()) {
                        currentPoster = request.getContextPath() + "/Assets/posters/default.jpg";
                    } else if (!currentPoster.toLowerCase().startsWith("http://") && !currentPoster.toLowerCase().startsWith("https://")) {
                        currentPoster = request.getContextPath() + "/Assets/posters/" + currentPoster;
                    }
            %>
                    <div class="movie-card">
                       <a href="<%= request.getContextPath() %>/Frontend/Konten.jsp?id=<%= film.getIdFilm() %>" class="movie-card-link">
                            <img src="<%= currentPoster %>" alt="<%= film.getJudul() %>" loading="lazy">
                            <div class="movie-info">
                                <h3><%= film.getJudul() %></h3>
                                <p><%= film.getGenre() %> • film</p>
                            </div>
                        </a>
                    </div>
            <%
                }
            }
            %>
            </div>
        </div>

        <div class="section">
            <h2 class="section-title">Continue Watching</h2>
            <p class="section-subtitle">PICK UP WHERE YOU LEFT OFF</p>
            <div class="continue-grid">
            <%
            if(continueList.isEmpty()) {
            %>
                <p style="color: #6b7280; grid-column: 1/-1;">Belum ada riwayat tontonan baru-baru ini.</p>
            <%
            } else {
                for(Map<String, String> item : continueList) {
                    String pImg = item.get("poster");
                    if (pImg == null || pImg.trim().isEmpty()) {
                        pImg = request.getContextPath() + "/Assets/posters/default.jpg";
                    } else if (!pImg.toLowerCase().startsWith("http://") && !pImg.toLowerCase().startsWith("https://")) {
                        pImg = request.getContextPath() + "/Assets/posters/" + pImg;
                    }
                    String targetUrl =
                        "series".equals(item.get("tipe"))
                        ? request.getContextPath() + "/Frontend/kontenSeries.jsp"
                        : request.getContextPath() + "/Frontend/Konten.jsp";
            %>
                <a href="<%= targetUrl %>?id=<%= item.get("id") %>" class="continue-card-link">
                    <div class="continue-card">
                        <img src="<%= pImg %>" alt="<%= item.get("judul") %>" loading="lazy">
                        <div class="continue-info">
                            <h4><%= item.get("judul") %></h4>
                            <span class="badge-type"><%= item.get("tipe") %></span>
                        </div>
                    </div>
                </a>
            <%
                }
            }
            %>
            </div>
        </div>

        <div class="section">
            <h2 class="section-title">Recommended For You</h2>
            <p class="section-subtitle">BASED ON YOUR HIGHEST RATED MOVIES (<%= userGenre.toUpperCase() %>)</p>
            <div class="movie-row">
            <%
            if(recList.isEmpty()) {
            %>
                <p style="color: #6b7280;">Belum ada rekomendasi yang cocok.</p>
            <%
            } else {
                for(Map<String, String> item : recList) {
                    String pImg = item.get("poster");
                    if (pImg == null || pImg.trim().isEmpty()) {
                        pImg = request.getContextPath() + "/Assets/posters/default.jpg";
                    } else if (!pImg.toLowerCase().startsWith("http://") && !pImg.toLowerCase().startsWith("https://")) {
                        pImg = request.getContextPath() + "/Assets/posters/" + pImg;
                    }
                    String targetUrl =
                        "series".equals(item.get("tipe"))
                        ? request.getContextPath() + "/Frontend/kontenSeries.jsp"
                        : request.getContextPath() + "/Frontend/Konten.jsp";
            %>
                <div class="movie-card">
                    <a href="<%= targetUrl %>?id=<%= item.get("id") %>" class="movie-card-link">
                        <img src="<%= pImg %>" alt="<%= item.get("judul") %>" loading="lazy">
                        <div class="movie-info">
                            <h3><%= item.get("judul") %></h3>
                            <p><%= item.get("genre") %></p>
                            <span class="badge-type"><%= item.get("tipe") %></span>
                        </div>
                    </a>
                </div>
            <%
                }
            }
            %>
            </div>
        </div>

    </body>
</html>