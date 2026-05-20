<%-- 
    Document   : Search
    Created on : May 20, 2026, 9:08:37 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Backend.model.Konten"%>
<%@page import="Backend.model.Film"%>
<%@page import="Backend.model.Series"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CineStream - Search</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: #050816;
            color: white;
            overflow-x: hidden;
            min-height: 100vh;
        }

        /* ── NAVBAR (sama persis dengan Dashboard) ── */

        .navbar {
            width: 100%;
            height: 80px;
            padding: 0 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            z-index: 100;
            background: rgba(0,0,0,0.25);
            backdrop-filter: blur(12px);
        }

        .logo {
            font-size: 32px;
            font-weight: 700;
            color: #ff9b9b;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 35px;
        }

        .nav-links a {
            text-decoration: none;
            color: #ddd;
            font-size: 14px;
            transition: 0.3s;
        }

        .nav-links a:hover,
        .nav-links a.active {
            color: #ff9b9b;
        }

        .profile {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: #ff9b9b;
        }

        /* ── HERO SEARCH SECTION ── */

        .search-hero {
            padding-top: 80px;
            min-height: 280px;
            background:
                linear-gradient(to bottom, rgba(5,8,22,0.6), #050816),
                url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070&auto=format&fit=crop');
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding-left: 60px;
            padding-right: 60px;
        }

        .search-hero h1 {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 10px;
            text-align: center;
        }

        .search-hero p {
            color: #aaa;
            font-size: 14px;
            letter-spacing: 3px;
            margin-bottom: 35px;
        }

        /* ── SEARCH BAR ── */

        .search-bar-wrapper {
            display: flex;
            gap: 15px;
            width: 100%;
            max-width: 800px;
        }

        .search-input {
            flex: 1;
            height: 58px;
            border-radius: 18px;
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(255,255,255,0.08);
            padding: 0 25px;
            color: white;
            font-size: 15px;
            font-family: 'Poppins', sans-serif;
            outline: none;
            transition: 0.3s;
        }

        .search-input:focus {
            border: 1px solid #ff9b9b;
            box-shadow: 0 0 20px rgba(255,155,155,0.3);
        }

        .search-input::placeholder {
            color: #666;
        }

        .search-btn {
            height: 58px;
            padding: 0 35px;
            border: none;
            border-radius: 18px;
            background: linear-gradient(90deg, #ff9b9b, #ff6b81);
            color: #111;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
            transition: 0.3s;
            box-shadow: 0 0 20px rgba(255,107,129,0.4);
        }

        .search-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 0 30px rgba(255,107,129,0.7);
        }

        /* ── FILTER BAR ── */

        .filter-section {
            padding: 30px 80px;
            display: flex;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
            border-bottom: 1px solid rgba(255,255,255,0.05);
        }

        .filter-label {
            color: #888;
            font-size: 13px;
            letter-spacing: 1px;
        }

        .filter-select {
            height: 46px;
            padding: 0 20px;
            border-radius: 14px;
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.08);
            color: white;
            font-size: 13px;
            font-family: 'Poppins', sans-serif;
            outline: none;
            cursor: pointer;
            transition: 0.3s;
        }

        .filter-select:focus,
        .filter-select:hover {
            border-color: #ff9b9b;
        }

        .filter-select option {
            background: #0b1024;
            color: white;
        }

        .result-count {
            margin-left: auto;
            color: #666;
            font-size: 13px;
        }

        .result-count span {
            color: #ff9b9b;
            font-weight: 600;
        }

        /* ── HASIL PENCARIAN ── */

        .results-section {
            padding: 40px 80px 80px;
        }

        .results-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 28px;
        }

        /* ── MOVIE CARD ── */

        .movie-card {
            background: #0b1024;
            border-radius: 22px;
            overflow: hidden;
            transition: 0.3s;
            cursor: pointer;
            border: 1px solid rgba(255,255,255,0.04);
            text-decoration: none;
            color: white;
            display: block;
        }

        .movie-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.5);
            border-color: rgba(255,155,155,0.2);
        }

        .card-poster {
            position: relative;
            overflow: hidden;
        }

        .card-poster img {
            width: 100%;
            height: 320px;
            object-fit: cover;
            transition: 0.4s;
        }

        .movie-card:hover .card-poster img {
            transform: scale(1.06);
        }

        .card-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: linear-gradient(90deg, #ff9b9b, #ff6b81);
            color: #111;
            font-size: 10px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 8px;
            letter-spacing: 1px;
        }

        .card-play-overlay {
            position: absolute;
            inset: 0;
            background: rgba(0,0,0,0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: 0.3s;
        }

        .movie-card:hover .card-play-overlay {
            opacity: 1;
        }

        .play-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: rgba(255,155,155,0.9);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            color: #111;
        }

        .card-info {
            padding: 18px;
        }

        .card-info h3 {
            font-size: 15px;
            margin-bottom: 8px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .card-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-genre {
            color: #888;
            font-size: 12px;
        }

        .card-rating {
            color: #ff9b9b;
            font-size: 12px;
            font-weight: 600;
        }

        .card-duration {
            color: #666;
            font-size: 11px;
            margin-top: 5px;
        }

        /* ── EMPTY STATE ── */

        .empty-state {
            text-align: center;
            padding: 80px 20px;
            color: #444;
        }

        .empty-state .empty-icon {
            font-size: 64px;
            margin-bottom: 20px;
        }

        .empty-state h3 {
            font-size: 22px;
            color: #666;
            margin-bottom: 10px;
        }

        .empty-state p {
            font-size: 14px;
            color: #444;
        }

    </style>
</head>

<body>

    <!-- NAVBAR -->
    <div class="navbar">
        <a href="Dashboard.jsp" class="logo">CineStream</a>
        <div class="nav-links">
            <a href="Dashboard.jsp">Home</a>
            <a href="#">Movies</a>
            <a href="#">Series</a>
            <a href="#">Favorites</a>
            <a href="#">My List</a>
            <a href="recommendation.jsp">Recommendations</a>
        </div>
        <div class="profile"></div>
    </div>

    <!-- HERO SEARCH -->
    <div class="search-hero">
        <h1>Find Your Next Watch</h1>
        <p>SEARCH FROM OUR COLLECTION</p>

        <form action="${pageContext.request.contextPath}/search"
              method="get"
              class="search-bar-wrapper">
            <input
                type="text"
                name="keyword"
                class="search-input"
                placeholder="Search movies, series..."
                value="${keyword}">
            <input type="hidden" name="genre"
                   value="${genre}">
            <input type="hidden" name="sort"
                   value="${sort}">
            <button type="submit" class="search-btn">
                🔍 Search
            </button>
        </form>
    </div>

    <!-- FILTER BAR -->
    <form action="${pageContext.request.contextPath}/search"
          method="get"
          id="filterForm">

        <input type="hidden" name="keyword"
               value="${keyword}">

        <div class="filter-section">
            <span class="filter-label">FILTER BY</span>

            <!-- Filter Genre -->
            <select name="genre"
                    class="filter-select"
                    onchange="document.getElementById('filterForm').submit()">
                <option value="Semua"
                    ${genre == 'Semua' || genre == null ? 'selected' : ''}>
                    All Genres
                </option>
                <%
                    List<String> genreList =
                        (List<String>) request.getAttribute("genreList");
                    String selectedGenre =
                        (String) request.getAttribute("genre");
                    if (genreList != null) {
                        for (String g : genreList) {
                %>
                <option value="<%= g %>"
                    <%= g.equals(selectedGenre) ? "selected" : "" %>>
                    <%= g %>
                </option>
                <%
                        }
                    }
                %>
            </select>

            <!-- Sort -->
            <select name="sort"
                    class="filter-select"
                    onchange="document.getElementById('filterForm').submit()">
                <option value="judul"
                    ${"judul".equals(sort) ? "selected" : ""}>
                    Sort: A - Z
                </option>
                <option value="rating"
                    ${"rating".equals(sort) ? "selected" : ""}>
                    Sort: Top Rated
                </option>
                <option value="tahun"
                    ${"tahun".equals(sort) ? "selected" : ""}>
                    Sort: Newest
                </option>
            </select>

            <%
                List<Konten> hasilSearch =
                    (List<Konten>) request.getAttribute("hasilSearch");
                int jumlah = (hasilSearch != null) ?
                    hasilSearch.size() : 0;
            %>
            <div class="result-count">
                Showing <span><%= jumlah %></span> results
            </div>
        </div>
    </form>

    <!-- HASIL PENCARIAN -->
    <div class="results-section">
        <%
            if (hasilSearch != null && !hasilSearch.isEmpty()) {
        %>
        <div class="results-grid">
            <%
                for (Konten k : hasilSearch) {
                    String badge = k instanceof Film ?
                        "FILM" : "SERIES";
                    String durasi = "";
                    if (k instanceof Film) {
                        int menit = k.getDurasi();
                        durasi = (menit / 60) + "h " +
                                 (menit % 60) + "m";
                    } else if (k instanceof Series) {
                        Series s = (Series) k;
                        durasi = s.getTotalEpisode() +
                                 " Episodes";
                    }
            %>
            <a href="${pageContext.request.contextPath}/player?id=<%= k.getId() %>"
               class="movie-card">
                <div class="card-poster">
                    <img src="images/<%= k.getPosterPath() %>"
                         alt="<%= k.getJudul() %>"
                         onerror="this.src='https://via.placeholder.com/220x320/0b1024/ff9b9b?text=No+Image'">
                    <div class="card-badge"><%= badge %></div>
                    <div class="card-play-overlay">
                        <div class="play-icon">▶</div>
                    </div>
                </div>
                <div class="card-info">
                    <h3><%= k.getJudul() %></h3>
                    <div class="card-meta">
                        <span class="card-genre">
                            <%= k.getGenre() %>
                        </span>
                    </div>
                    <div class="card-duration">
                        <%= durasi %>
                    </div>
                </div>
            </a>
            <%
                }
            %>
        </div>
        <%
            } else {
        %>
        <div class="empty-state">
            <div class="empty-icon">🎬</div>
            <h3>No results found</h3>
            <p>Try different keywords or remove filters</p>
        </div>
        <%
            }
        %>
    </div>

</body>
</html>
