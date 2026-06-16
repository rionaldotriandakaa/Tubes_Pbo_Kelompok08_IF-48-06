<%-- 
    Document   : Search
    Created on : May 20, 2026, 9:08:37 PM
    Author     : ASUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
    String dashboardUser   = (String) session.getAttribute("activeProfileName");
    String dashboardAvatar = (String) session.getAttribute("activeProfileAvatar");

    if (dashboardUser == null) dashboardUser = "No Profile";

    String dashboardImgSrc;
    if (dashboardAvatar != null && !dashboardAvatar.trim().isEmpty()) {
        dashboardImgSrc = request.getContextPath() + "/Assets/avatars/" + dashboardAvatar;
    } else {
        dashboardImgSrc = request.getContextPath() + "/Assets/avatars/avatar1.png";
    }

    @SuppressWarnings("unchecked")
    List<Map<String, String>> searchResults =
        (List<Map<String, String>>) request.getAttribute("hasil");
    @SuppressWarnings("unchecked")
    List<String> daftarGenre =
        (List<String>) request.getAttribute("daftarGenre");

    String keyword = (String) request.getAttribute("keyword");
    String genre   = (String) request.getAttribute("genre");
    String sort    = (String) request.getAttribute("sort");

    // Fallback jika JSP diakses langsung tanpa melalui servlet
    if (searchResults == null) searchResults = new ArrayList<>();
    if (daftarGenre == null)   daftarGenre   = new ArrayList<>();
    if (keyword == null) keyword = "";
    if (genre == null)   genre   = "";
    if (sort == null)    sort    = "terbaru";
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

        .navbar{ 
            width:100%; height:85px; padding:0 60px; display:flex; justify-content:space-between; align-items:center; 
            position:fixed; top:0; z-index:1000; background:rgba(0,0,0,0.35); backdrop-filter:blur(14px); 
        }
        .logo{ font-size:32px; font-weight:700; color:#ff9b9b; }
        .nav-container-center { display:flex; align-items:center; position:absolute; left:50%; transform:translateX(-50%); }
        .nav-links{ display:flex; gap:35px; }
        .nav-links a{ color:#ddd; transition:0.3s; font-size:14px; font-weight:500; }
        .nav-links a:hover{ color:#ff9b9b; }
        .right-nav{ display:flex; align-items:center; gap:25px; margin-left:auto; }
        .profile-wrapper-nav { display:flex; align-items:center; gap:12px; text-decoration:none; }
        .profile-name-nav { font-size:14px; font-weight:500; color:white; }
        .profile{ width:42px; height:42px; border-radius:50%; background-size:cover; background-position:center; border:2px solid #ff9b9b; }

        .search-hero{
            padding-top:140px; padding-bottom:60px;
            background: linear-gradient(to bottom, rgba(5,8,22,0.7), #040816), url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070');
            background-size:cover; background-position:center; text-align:center;
        }
        .search-hero h1{ font-size:48px; font-weight:700; margin-bottom:10px; }
        .search-hero p{ color:#aaa; letter-spacing:2px; margin-bottom:30px; font-size:14px; }

        /* Form action mengarah ke /search (servlet), bukan langsung ke JSP */
        .search-bar{ width:100%; max-width:700px; margin:auto; display:flex; }
        .search-input{ 
            flex:1; height:54px; border:none; border-radius:25px 0 0 25px; 
            background:rgba(255,255,255,0.08); padding:0 25px; color:white; font-size:15px; outline:none; 
        }
        .search-btn{ 
            padding:0 30px; border:none; border-radius:0 25px 25px 0; 
            background:linear-gradient(90deg,#ff9b9b,#ff6b81); color:#040816; font-weight:700; cursor:pointer; transition:0.3s; 
        }
        .search-btn:hover{ opacity:0.9; }

        .filter-section{ padding:25px 80px; display:flex; gap:20px; align-items:center; flex-wrap:wrap; border-bottom:1px solid rgba(255,255,255,0.05); }
        .filter-label{ color:#6b7280; font-size:12px; letter-spacing:1px; font-weight:600; }
        .filter-select{ height:40px; padding:0 15px; border:none; border-radius:10px; background:#0b1024; color:white; outline:none; font-size:13px; cursor:pointer; }
        .filter-btn{ height:40px; padding:0 20px; border:none; border-radius:10px; background:linear-gradient(90deg,#ff9b9b,#ff6b81); color:#040816; font-weight:700; cursor:pointer; font-size:13px; }
        .result-count{ margin-left:auto; color:#6b7280; font-size:13px; }
        .result-count span{ color:#ff9b9b; font-weight:700; }

        .results-section{ padding:40px 80px 80px; }
        .results-grid{ display:grid; grid-template-columns:repeat(auto-fill,minmax(240px,1fr)); gap:30px; }
        .movie-card{ background:#0b1024; border-radius:24px; overflow:hidden; transition:0.3s; }
        .movie-card:hover{ transform:translateY(-8px); box-shadow:0 10px 25px rgba(0,0,0,0.5); }
        .card-poster{ position:relative; }
        .card-poster img{ width:100%; height:340px; object-fit:cover; display:block; }
        .card-badge{ 
            position:absolute; top:15px; left:14px; padding:4px 10px; border-radius:8px; 
            background:linear-gradient(90deg,#ff9b9b,#ff6b81); color:#040816; font-size:10px; font-weight:800; text-transform:uppercase; 
        }
        .play-overlay{ position:absolute; inset:0; background:rgba(0,0,0,0.5); display:flex; justify-content:center; align-items:center; opacity:0; transition:0.3s; }
        .movie-card:hover .play-overlay{ opacity:1; }
        .play-icon{ width:55px; height:55px; border-radius:50%; background:#ff9b9b; display:flex; justify-content:center; align-items:center; color:#040816; font-size:20px; }
        .card-info{ padding:20px; }
        .card-info h3{ font-size:18px; font-weight:700; margin-bottom:8px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }
        .card-meta{ display:flex; justify-content:space-between; margin-bottom:5px; }
        .card-genre{ color:#8c8c8c; font-size:13px; }
        .card-duration{ color:#6b7280; font-size:12px; }
        .empty-state{ grid-column:1/-1; text-align:center; padding:60px 20px; color:#6b7280; font-size:15px; }
        .footer{ padding:40px; text-align:center; color:#6b7280; border-top:1px solid rgba(255,255,255,0.05); font-size:13px; }
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
            <a href="<%= request.getContextPath() %>/Frontend/Profile.jsp" class="profile-wrapper-nav">
                <span class="profile-name-nav"><%= dashboardUser %></span>
                <div class="profile" style="background-image: url('<%= dashboardImgSrc %>');"></div>
            </a>
        </div>
    </div>

    <div class="search-hero">
        <h1>Find Your Next Watch</h1>
        <p>SEARCH FROM OUR COLLECTION</p>
        <%-- Form action ke /search (servlet) agar logika ada di SearchServlet, bukan di JSP --%>
        <form action="<%= request.getContextPath() %>/search" method="get" class="search-bar">
            <input type="text" name="keyword" class="search-input" value="<%= keyword %>" placeholder="Search movies, series...">
            <button type="submit" class="search-btn">🔍 SEARCH</button>
        </form>
    </div>

    <%-- Filter genre + sort — dikirim ke SearchServlet via GET --%>
    <form action="<%= request.getContextPath() %>/search" method="get">
        <div class="filter-section">
            <span class="filter-label">FILTER BY</span>

            <%-- Pertahankan keyword saat filter berubah --%>
            <input type="hidden" name="keyword" value="<%= keyword %>">

            <%-- Dropdown genre dinamis dari DB --%>
            <select name="genre" class="filter-select">
                <option value="">All Genres</option>
                <% for (String g : daftarGenre) { %>
                    <option value="<%= g %>" <%= g.equals(genre) ? "selected" : "" %>><%= g %></option>
                <% } %>
            </select>

            <%-- Dropdown sort --%>
            <select name="sort" class="filter-select">
                <option value="terbaru" <%= "terbaru".equals(sort) ? "selected" : "" %>>Terbaru</option>
                <option value="terlama" <%= "terlama".equals(sort) ? "selected" : "" %>>Terlama</option>
                <option value="az"      <%= "az".equals(sort)      ? "selected" : "" %>>A – Z</option>
                <option value="za"      <%= "za".equals(sort)      ? "selected" : "" %>>Z – A</option>
            </select>

            <button type="submit" class="filter-btn">Terapkan</button>

            <div class="result-count">
                Showing <span><%= searchResults.size() %></span> results
                <% if (!keyword.isEmpty()) { %> for "<%= keyword %>"<% } %>
            </div>
        </div>
    </form>

    <div class="results-section">
        <div class="results-grid">
            <% if (searchResults.isEmpty()) { %>
                <p class="empty-state">Tidak ditemukan hasil yang cocok. Coba kata kunci lain atau ubah filter.</p>
            <% } else { 
                for (Map<String, String> item : searchResults) { 
                    String currentPoster = item.get("poster");
                    if (currentPoster == null || currentPoster.trim().isEmpty()) {
                        currentPoster = request.getContextPath() + "/Assets/posters/default.jpg";
                    } else if (!currentPoster.toLowerCase().startsWith("http://") && !currentPoster.toLowerCase().startsWith("https://")) {
                        currentPoster = request.getContextPath() + "/Assets/posters/" + currentPoster;
                    }
                    String targetDetailUrl =
                        "series".equalsIgnoreCase(item.get("tipe"))
                        ? request.getContextPath() + "/Frontend/kontenSeries.jsp"
                        : request.getContextPath() + "/Frontend/Konten.jsp";
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
                                <span class="card-genre"><%= item.get("genre") %></span>
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
