<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="kategori.Series"%>

<%
    List<Series> seriesList = (List<Series>) request.getAttribute("series");

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
        }

        .navbar {
            width: 100%;
            height: 85px;
            padding: 0 60px;
            display: flex;
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

        .nav-links {
            display: flex;
            gap: 35px;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .nav-links a {
            color: #ddd;
            text-decoration: none;
            font-size: 14px;
        }

        .nav-links a:hover {
            color: #ff9b9b;
        }

        .navbar-search {
            display: flex;
            align-items: center;
            margin-left: auto;
            margin-right: 20px;
        }

        .navbar-search-input {
            height: 40px;
            width: 200px;
            border-radius: 20px 0 0 20px;
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-right: none;
            padding: 0 18px;
            color: white;
            font-size: 13px;
            outline: none;
            transition: width 0.3s ease;
        }

        .navbar-search-input:focus {
            width: 260px;
            border-color: #ff9b9b;
        }

        .navbar-search-input::placeholder {
            color: #777;
        }

        .navbar-search-btn {
            height: 40px;
            padding: 0 18px;
            border: none;
            border-radius: 0 20px 20px 0;
            background: linear-gradient(90deg, #ff9b9b, #ff6b81);
            color: #111;
            font-weight: 700;
            cursor: pointer;
        }

        .right-nav {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .profile {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background-size: cover;
            background-position: center;
            border: 2px solid #ff9b9b;
        }

        .profile-wrapper-nav {
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
        }

        .profile-name-nav {
            color: white;
            font-size: 14px;
            font-weight: 500;
        }

        .container {
            width: 90%;
            margin: auto;
            padding-top: 120px;
            padding-bottom: 50px;
        }

        h1 {
            font-size: 58px;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #ccc;
            margin-bottom: 35px;
        }

        .series-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .series-link {
            text-decoration: none;
            color: white;
        }

        .series-card {
            position: relative;
            overflow: hidden;
            border-radius: 15px;
            transition: 0.3s;
            background: #111;
        }

        .series-card:hover {
            transform: scale(1.03); 
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
            padding: 15px;
            background: linear-gradient(
            transparent,
            rgba(0, 0, 0, 0.9)
            );
        }

        .series-genre {
            color: #ff9b9b;
            font-size: 13px;
            margin-bottom: 5px;
        }

        .series-title {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 3px;
        }

        .series-detail {
            font-size: 13px;
            color: #ccc;
        }
        .empty {
            color: #ccc;
            font-size: 18px;
            grid-column: 1 / -1;
        }
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

    <form action="/CineStream/search" method="get" class="navbar-search">
        <input type="text" name="keyword" class="navbar-search-input" placeholder="🔍 Search...">
        <button type="submit" class="navbar-search-btn">Search</button>
    </form>

    <div class="right-nav">
        <a href="/CineStream/Frontend/Profile.jsp" class="profile-wrapper-nav">
            <span class="profile-name-nav">
                <%= dashboardUser %>
            </span>
            <div class="profile" style="background-image:url('<%= dashboardImgSrc %>');"></div>
        </a>
    </div>
</div>

<div class="container">
    <h1>Series</h1>
    <p class="subtitle">
        Temukan serial terbaik yang tersedia di CineStream.
    </p>

    <div class="series-grid">
    <%
    if (seriesList != null && !seriesList.isEmpty()) {
        for (Series s : seriesList) {
    %>

    <a href="<%= request.getContextPath() %>/Frontend/kontenSeries.jsp?id=<%= s.getIdSeries() %>"
       class="series-link">

        <div class="series-card">

            <img src="<%= s.getPoster() %>"
                 alt="<%= s.getJudul() %>">

            <div class="series-info">

                <div class="series-genre">
                    <%= s.getGenre() %>
                </div>

                <div class="series-title">
                    <%= s.getJudul() %>
                </div>

                <div class="series-detail">
                    <%= s.getTotalEpisode() %> Episodes
                </div>

            </div>

        </div>

    </a>

        <%
        }
    } else {
    %>

    <p class="empty">
        Belum ada series di database.
    </p>

    <%
    }
    %>

    </div>
</div>

</body>
</html>