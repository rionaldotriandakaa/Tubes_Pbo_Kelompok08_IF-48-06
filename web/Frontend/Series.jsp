<%-- 
    Document   : Series
    Created on : 22 May 2026, 14.22.07
    Author     : ACER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="kategori.Series"%>

<%
    // 1. Ambil data list series dari Servlet request
    List<Series> seriesList = (List<Series>) request.getAttribute("series");

    // ================= SINKRONISASI SESSION PROFILE =================
    String dashboardUser = (String) session.getAttribute("activeProfileName");
    String dashboardAvatar = (String) session.getAttribute("activeProfileAvatar");

    if (dashboardUser == null) {
        dashboardUser = "No Profile";
    }

    String dashboardImgSrc;
    if (dashboardAvatar != null && !dashboardAvatar.trim().isEmpty()) {
        dashboardImgSrc = request.getContextPath() + "/Assets/avatars/" + dashboardAvatar;
    } else {
        dashboardImgSrc = request.getContextPath() + "/Assets/avatars/avatar1.png";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Series - CineStream</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
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
            overflow-x: hidden;
        }

        a {
            text-decoration: none;
        }

        /* NAVBAR STYLING */
        .navbar {
            width: 100%;
            height: 85px;
            padding: 0 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            z-index: 1000;
            background: rgba(0, 0, 0, 0.35);
            backdrop-filter: blur(14px);
        }

        .logo {
            font-size: 32px;
            font-weight: 700;
            color: #ff9b9b;
        }

        .nav-container-center {
            display: flex;
            align-items: center;
            gap: 40px;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .nav-links {
            display: flex;
            gap: 35px;
        }

        .nav-links a {
            color: #ddd;
            font-size: 14px;
            font-weight: 500;
            transition: 0.3s;
        }

        .nav-links a:hover, .nav-links a.active {
            color: #ff9b9b;
        }

        /* NAVBAR SEARCH */
        .navbar-search {
            display: flex;
            align-items: center;
        }

        .navbar-search-input {
            height: 38px;
            width: 180px;
            border-radius: 20px 0 0 20px;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-right: none;
            padding: 0 16px;
            color: white;
            font-size: 13px;
            outline: none;
            transition: 0.3s;
        }

        .navbar-search-input:focus {
            width: 230px;
            border-color: #ff9b9b;
            background: rgba(255, 255, 255, 0.1);
        }

        .navbar-search-input::placeholder {
            color: #6b7280;
        }

        .navbar-search-btn {
            height: 38px;
            padding: 0 16px;
            border: none;
            border-radius: 0 20px 20px 0;
            background: linear-gradient(90deg, #ff9b9b, #ff6b81);
            color: #040816;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
            font-size: 13px;
        }

        .navbar-search-btn:hover {
            box-shadow: 0 0 15px rgba(255, 107, 129, 0.5);
        }

        .right-nav {
            display: flex;
            align-items: center;
            gap: 25px;
            margin-left: auto;
        }

        .bell-icon {
            width: 22px;
            height: 22px;
            fill: #ddd;
            cursor: pointer;
            transition: 0.3s;
        }

        .bell-icon:hover {
            fill: #ff9b9b;
        }

        .profile-wrapper-nav {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .profile-name-nav {
            color: white;
            font-size: 14px;
            font-weight: 500;
        }

        .profile {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background-size: cover;
            background-position: center;
            border: 2px solid #ff9b9b;
        }

        /* GRID CONTENT LAYOUT */
        .container {
            width: 90%;
            margin: auto;
            padding-top: 140px;
            padding-bottom: 50px;
        }

        h1 {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .subtitle {
            color: #ccc;
            margin-bottom: 35px;
            font-size: 14px;
        }

        .series-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 25px;
        }

        .series-link {
            color: white;
            display: block;
        }

        .series-card {
            position: relative;
            overflow: hidden;
            border-radius: 20px;
            background: #0b1024;
            transition: 0.3s;
        }

        .series-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
        }    

        .series-card img {
            width: 100%;
            height: 350px;
            object-fit: cover;
            display: block;
        }

        .series-info {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            padding: 20px;
            background: linear-gradient(transparent, rgba(4, 8, 22, 0.95) 80%);
        }

        .series-genre {
            color: #ff9b9b;
            font-size: 12px;
            margin-bottom: 5px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .series-title {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 5px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .series-detail {
            font-size: 13px;
            color: #9ca3af;
        }

        .empty {
            color: #6b7280;
            font-size: 16px;
            grid-column: 1 / -1;
            text-align: center;
            padding: 40px 0;
        }
    </style>
</head>
<body>

    <div class="navbar">
        <a href="/CineStream/Frontend/Dashboard.jsp" class="logo">CineStream</a>

        <div class="nav-container-center">
            <div class="nav-links">
                <a href="/CineStream/Frontend/Dashboard.jsp">HOME</a>
                <a href="/CineStream/movies">MOVIES</a>
                <a href="/CineStream/series" class="active">SERIES</a>
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
                <div class="profile" style="background-image:url('<%= dashboardImgSrc %>');"></div>
            </a>
        </div>
    </div>

    <div class="container">
        <h1>Series</h1>
        <p class="subtitle">Temukan serial terbaik yang tersedia di CineStream.</p>

        <div class="series-grid">
        <%
        if (seriesList != null && !seriesList.isEmpty()) {
            for (Series s : seriesList) {
                // Jalur render poster lokal maupun internet
                String currentPoster = s.getPoster();
                if (currentPoster == null || currentPoster.trim().isEmpty()) {
                    currentPoster = request.getContextPath() + "/Assets/posters/default.jpg";
                } else if (!currentPoster.toLowerCase().startsWith("http://") && !currentPoster.toLowerCase().startsWith("https://")) {
                    currentPoster = request.getContextPath() + "/Assets/posters/" + currentPoster;
                }
        %>
            <a href="<%= request.getContextPath() %>/Frontend/kontenSeries.jsp?id=<%= s.getIdSeries() %>" class="series-link">
                <div class="series-card">
                    <img src="<%= currentPoster %>" alt="<%= s.getJudul() %>" loading="lazy">
                    <div class="series-info">
                        <div class="series-genre"><%= s.getGenre() %></div>
                        <div class="series-title"><%= s.getJudul() %></div>
                        <div class="series-detail"><%= s.getTotalEpisode() %> Episodes</div>
                    </div>
                </div>
            </a>
        <%
            }
        } else {
        %>
            <p class="empty">Belum ada series di database.</p>
        <%
        }
        %>
        </div>
    </div>

</body>
</html>