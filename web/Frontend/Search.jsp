<%-- 
    Document   : Search
    Created on : May 20, 2026, 9:08:37 PM
    Author     : ASUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="config.DatabaseConnection"%>
<%
    // ================= SINKRONISASI SESSION PROFILE =================
    String dashboardUser = (String) session.getAttribute("activeProfileName");
    String dashboardAvatar = (String) session.getAttribute("activeProfileAvatar");
    Integer profileId = (Integer) session.getAttribute("activeProfileId");

    if (dashboardUser == null) {
        dashboardUser = "No Profile";
    }

    String dashboardImgSrc;
    if (dashboardAvatar != null && !dashboardAvatar.trim().isEmpty()) {
        dashboardImgSrc = request.getContextPath() + "/Assets/avatars/" + dashboardAvatar;
    } else {
        dashboardImgSrc = request.getContextPath() + "/Assets/avatars/avatar1.png";
    }

    // ================= LOGIKA PENCARIAN DATABASE =================
    String keyword = request.getParameter("keyword");
    if (keyword == null) {
        keyword = "";
    }
    
    List<Map<String, String>> searchResults = new ArrayList<>();
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        conn = DatabaseConnection.getConnection();
        
        String sql = "SELECT id, judul, poster, genre, durasi AS info_tambahan, 'film' AS tipe FROM film " +
                     "WHERE judul LIKE ? OR genre LIKE ? " +
                     "UNION " +
                     "SELECT id, judul, poster, genre, CONCAT(total_episode, ' Episodes') AS info_tambahan, 'series' AS tipe FROM series " +
                     "WHERE judul LIKE ? OR genre LIKE ?";
        
        ps = conn.prepareStatement(sql);
        String queryParam = "%" + keyword + "%";
        ps.setString(1, queryParam);
        ps.setString(2, queryParam);
        ps.setString(3, queryParam);
        ps.setString(4, queryParam);
        
        rs = ps.executeQuery();
        while (rs.next()) {
            Map<String, String> item = new HashMap<>();
            item.put("id", rs.getString("id"));
            item.put("judul", rs.getString("judul"));
            item.put("poster", rs.getString("poster"));
            item.put("genre", rs.getString("genre"));
            item.put("info", rs.getString("info_tambahan"));
            item.put("tipe", rs.getString("tipe"));
            searchResults.add(item);
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
    <title>CineStream - Search Results</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        *{ margin:0; padding:0; box-sizing:border-box; font-family:'Poppins',sans-serif; }
        body{ background:#040816; color:white; overflow-x:hidden; min-height:100vh; }
        a{ text-decoration:none; color:white; }

        /* NAVBAR STYLING */
        .navbar{ 
            width:100%; height:85px; padding:0 60px; display:flex; justify-content:space-between; align-items:center; 
            position:fixed; top:0; z-index:1000; background:rgba(0,0,0,0.35); backdrop-filter:blur(14px); 
        }
        .logo{ font-size:32px; font-weight:700; color:#ff9b9b; }
        
        /* Posisi Menu Utama Tetap Presisi di Tengah */
        .nav-container-center { 
            display: flex; 
            align-items: center; 
            position: absolute; 
            left: 50%; 
            transform: translateX(-50%); 
        }
        .nav-links{ display:flex; gap:35px; }
        .nav-links a{ color:#ddd; transition:0.3s; font-size:14px; font-weight: 500; }
        .nav-links a:hover{ color:#ff9b9b; }
        
        .right-nav{ display:flex; align-items:center; gap:25px; margin-left: auto; }
        .bell-icon { width: 22px; height: 22px; fill: #ddd; cursor: pointer; transition: 0.3s; }
        .bell-icon:hover { fill: #ff9b9b; }
        .profile-wrapper-nav { display: flex; align-items: center; gap: 12px; text-decoration: none; }
        .profile-name-nav { font-size: 14px; font-weight: 500; color: white; }
        .profile{ width:42px; height:42px; border-radius:50%; background-size:cover; background-position:center; border:2px solid #ff9b9b; }

        /* SEARCH HERO STYLING */
        .search-hero{
            padding-top:140px; padding-bottom:60px;
            background: linear-gradient(to bottom, rgba(5,8,22,0.7), #040816), url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070');
            background-size:cover; background-position:center; text-align:center;
        }
        .search-hero h1{ font-size:48px; font-weight: 700; margin-bottom:10px; }
        .search-hero p{ color:#aaa; letter-spacing:2px; margin-bottom:30px; font-size: 14px; }

        /* BIG SEARCH BAR */
        .search-bar{ width:100%; max-width:700px; margin:auto; display:flex; }
        .search-input{ 
            flex:1; height:54px; border:none; border-radius:25px 0 0 25px; 
            background:rgba(255,255,255,0.08); padding:0 25px; color:white; font-size:15px; outline:none; 
        }
        .search-btn{ 
            padding:0 30px; border:none; border-radius:0 25px 25px 0; 
            background:linear-gradient(90deg,#ff9b9b,#ff6b81); color:#040816; font-weight:700; cursor:pointer; transition:0.3s; 
        }
        .search-btn:hover{ opacity: 0.9; }

        /* FILTER LAYOUT */
        .filter-section{ padding:25px 80px; display:flex; gap:20px; align-items:center; border-bottom:1px solid rgba(255,255,255,0.05); }
        .filter-label{ color:#6b7280; font-size:12px; letter-spacing:1px; font-weight: 600; }
        .filter-select{ height:40px; padding:0 15px; border:none; border-radius:10px; background:#0b1024; color:white; outline:none; font-size: 13px; }
        .result-count{ margin-left:auto; color:#6b7280; font-size:13px; }
        .result-count span{ color:#ff9b9b; font-weight:700; }

        /* RESULTS GRID SYSTEM */
        .results-section{ padding:40px 80px 80px; }
        .results-grid{ display:grid; grid-template-columns: repeat(auto-fill,minmax(240px,1fr)); gap:30px; }
        .movie-card{ background:#0b1024; border-radius:24px; overflow:hidden; transition:0.3s; }
        .movie-card:hover{ transform:translateY(-8px); box-shadow: 0 10px 25px rgba(0,0,0,0.5); }
        .card-poster{ position:relative; }
        .card-poster img{ width:100%; height:340px; object-fit:cover; display: block; }
        .card-badge{ 
            position:absolute; top:15px; left:14px; padding:4px 10px; border-radius:8px; 
            background:linear-gradient(90deg,#ff9b9b,#ff6b81); color:#040816; font-size:10px; font-weight:800; text-transform: uppercase; 
        }
        .play-overlay{ 
            position:absolute; inset:0; background:rgba(0,0,0,0.5); display:flex; justify-content:center; align-items:center; opacity:0; transition:0.3s; 
        }
        .movie-card:hover .play-overlay{ opacity:1; }
        .play-icon{ width:55px; height:55px; border-radius:50%; background:#ff9b9b; display:flex; justify-content:center; align-items:center; color:#040816; font-size:20px; }
        .card-info{ padding:20px; }
        .card-info h3{ font-size: 18px; font-weight: 700; margin-bottom:8px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
        .card-meta{ display:flex; justify-content:space-between; margin-bottom:5px; align-items: center; }
        .card-genre覆{ color:#8c8c8c; font-size:13px; }
        .card-duration{ color:#6b7280; font-size:12px; }
        
        .empty-state { grid-column: 1 / -1; text-align: center; padding: 60px 20px; color: #6b7280; font-size: 15px; }
        .footer{ padding:40px; text-align:center; color:#6b7280; border-top: 1px solid rgba(255,255,255,0.05); font-size: 13px; }
    </style>
</head>
<body>

    <div class="navbar">
        <a href="<%= request.getContextPath() %>/Frontend/Dashboard.jsp" class="logo">CineStream</a>
        
        <div class="nav-container-center">
            <div class="nav-links">
                <a href="<%= request.getContextPath() %>/Frontend/Dashboard.jsp">HOME</a>
                <a href="<%= request.getContextPath() %>/movies">MOVIES</a>
                <a href="<%= request.getContextPath() %>/series">SERIES</a>
                <a href="<%= request.getContextPath() %>/Frontend/Favorites.jsp">FAVORITES</a>
                <a href="<%= request.getContextPath() %>/Frontend/MyList.jsp">MY LIST</a>
            </div>
        </div>
        
        <div class="right-nav">
            <svg class="bell-icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 22c1.1 0 2-.9 2-2h-4c0 1.1.89 2 2 2zm6-6v-5c0-3.07-1.64-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.63 5.36 6 7.92 6 11v5l-2 2v1h16v-1l-2-2z"/>
            </svg>
            <a href="<%= request.getContextPath() %>/Frontend/Profile.jsp" class="profile-wrapper-nav">
                <span class="profile-name-nav"><%= dashboardUser %></span>
                <div class="profile" style="background-image: url('<%= dashboardImgSrc %>');"></div>
            </a>
        </div>
    </div>

    <div class="search-hero">
        <h1>Find Your Next Watch</h1>
        <p>SEARCH FROM OUR COLLECTION</p>
        <form action="<%= request.getContextPath() %>/Frontend/Search.jsp" method="get" class="search-bar">
            <input type="text" name="keyword" class="search-input" value="<%= keyword %>" placeholder="Search movies, series...">
            <button type="submit" class="search-btn">🔍 SEARCH</button>
        </form>
    </div>

    <div class="filter-section">
        <span class="filter-label">FILTER BY</span>
        <select class="filter-select"><option>All Genres</option></select>
        <select class="filter-select"><option>Sort A-Z</option></select>
        <div class="result-count">
            Showing <span><%= searchResults.size() %></span> results for "<%= keyword %>"
        </div>
    </div>

    <div class="results-section">
        <div class="results-grid">
            <% if (searchResults.isEmpty()) { %>
                <p class="empty-state">Tidak ditemukan hasil film atau series yang cocok dengan kata kunci Anda.</p>
            <% } else { 
                for (Map<String, String> item : searchResults) { 
                    String currentPoster = item.get("poster");
                    if (currentPoster == null || currentPoster.trim().isEmpty()) {
                        currentPoster = request.getContextPath() + "/Assets/posters/default.jpg";
                    } else if (!currentPoster.toLowerCase().startsWith("http://") && !currentPoster.toLowerCase().startsWith("https://")) {
                        currentPoster = request.getContextPath() + "/Assets/posters/" + currentPoster;
                    }
                    String targetDetailUrl = "series".equalsIgnoreCase(item.get("tipe")) ? "kontenSeries.jsp" : "Konten.jsp";
            %>
                    <div class="movie-card">
                        <a href="<%= targetDetailUrl %>?id=<%= item.get("id") %>">
                            <div class="card-poster">
                                <img src="<%= currentPoster %>" alt="<%= item.get("judul") %>" loading="lazy">
                                <div class="card-badge"><%= item.get("tipe") %></div>
                                <div class="play-overlay">
                                    <div class="play-icon">▶</div>
                                </div>
                            </div>
                            <div class="card-info">
                                <h3><%= item.get("judul") %></h3>
                                <div class="card-meta">
                                    <span class="card-genre覆"><%= item.get("genre") %></span>
                                </div>
                                <div class="card-duration"><%= item.get("info") %></div>
                            </div>
                        </a>
                    </div>
            <% 
                } 
            } 
            %>
        </div>
    </div>

    <footer class="footer">
        © 2026 CineStream • Kelompok 8 • IF-48-06
    </footer>

</body>
</html>