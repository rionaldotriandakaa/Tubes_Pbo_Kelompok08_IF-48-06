<%-- 
    Document   : Search
    Created on : May 20, 2026, 9:08:37 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>CineStream - Search</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins',sans-serif;
        }

        body{
            background:#050816;
            color:white;
            overflow-x:hidden;
            min-height:100vh;
        }

        a{
            text-decoration:none;
            color:white;
        }

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

        .logo{
            font-size:32px;
            font-weight:700;
            color:#ff9b9b;
        }

        .nav-links{
            display:flex;
            gap:25px;
        }

        .nav-links a{
            color:#ddd;
            transition:0.3s;
            font-size:14px;
        }

        .nav-links a:hover{
            color:#ff9b9b;
        }

        .profile{
            width:42px;
            height:42px;

            border-radius:50%;

            background-image:url('https://i.pravatar.cc/150?img=12');
            background-size:cover;

            border:2px solid #ff9b9b;
        }

        /* SEARCH HERO */

        .search-hero{

            padding-top:130px;
            padding-bottom:60px;

            background:
            linear-gradient(to bottom,
            rgba(5,8,22,0.7),
            #050816),

            url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070');

            background-size:cover;
            background-position:center;

            text-align:center;
        }

        .search-hero h1{
            font-size:58px;
            margin-bottom:15px;
        }

        .search-hero p{
            color:#aaa;
            letter-spacing:3px;
            margin-bottom:35px;
        }

        /* SEARCH BAR */

        .search-bar{

            width:100%;
            max-width:850px;

            margin:auto;

            display:flex;
            gap:18px;

            padding:0 40px;
        }

        .search-input{
            flex:1;

            height:60px;

            border:none;
            border-radius:20px;

            background:rgba(255,255,255,0.08);

            padding:0 25px;

            color:white;
            font-size:15px;

            outline:none;
        }

        .search-input::placeholder{
            color:#777;
        }

        .search-btn{

            padding:0 35px;

            border:none;
            border-radius:20px;

            background:linear-gradient(90deg,#ff9b9b,#ff6b81);

            color:black;
            font-weight:700;

            cursor:pointer;

            transition:0.3s;
        }

        .search-btn:hover{
            transform:translateY(-3px);
        }

        /* FILTER */

        .filter-section{

            padding:35px 80px;

            display:flex;
            gap:20px;
            flex-wrap:wrap;
            align-items:center;

            border-bottom:1px solid rgba(255,255,255,0.05);
        }

        .filter-label{
            color:#888;
            font-size:13px;
            letter-spacing:2px;
        }

        .filter-select{

            height:48px;

            padding:0 20px;

            border:none;
            border-radius:15px;

            background:#0b1024;
            color:white;

            outline:none;
        }

        .result-count{
            margin-left:auto;
            color:#777;
            font-size:13px;
        }

        .result-count span{
            color:#ff9b9b;
            font-weight:700;
        }

        /* RESULTS */

        .results-section{
            padding:60px 80px 80px;
        }

        .results-grid{

            display:grid;

            grid-template-columns:
            repeat(auto-fill,minmax(220px,1fr));

            gap:30px;
        }

        /* MOVIE CARD */

        .movie-card{

            background:#0b1024;

            border-radius:24px;

            overflow:hidden;

            transition:0.3s;
        }

        .movie-card:hover{
            transform:translateY(-10px);
        }

        .card-poster{
            position:relative;
        }

        .card-poster img{
            width:100%;
            height:320px;
            object-fit:cover;
        }

        .card-badge{

            position:absolute;
            top:14px;
            left:14px;

            padding:6px 12px;

            border-radius:10px;

            background:linear-gradient(90deg,#ff9b9b,#ff6b81);

            color:black;
            font-size:11px;
            font-weight:700;
        }

        .play-overlay{

            position:absolute;
            inset:0;

            background:rgba(0,0,0,0.5);

            display:flex;
            justify-content:center;
            align-items:center;

            opacity:0;
            transition:0.3s;
        }

        .movie-card:hover .play-overlay{
            opacity:1;
        }

        .play-icon{

            width:65px;
            height:65px;

            border-radius:50%;

            background:#ff9b9b;

            display:flex;
            justify-content:center;
            align-items:center;

            color:black;
            font-size:24px;
        }

        .card-info{
            padding:18px;
        }

        .card-info h3{
            margin-bottom:10px;
        }

        .card-meta{
            display:flex;
            justify-content:space-between;
            margin-bottom:8px;
        }

        .card-genre{
            color:#888;
            font-size:13px;
        }

        .card-rating{
            color:#ff9b9b;
            font-size:13px;
            font-weight:700;
        }

        .card-duration{
            color:#666;
            font-size:12px;
        }

        /* FOOTER */

        .footer{

            padding:40px;

            text-align:center;

            color:#777;

            border-top:
            1px solid rgba(255,255,255,0.05);
        }

    </style>

</head>

<body>

    <!-- NAVBAR -->

    <div class="navbar">

        <div class="logo">
            CineStream
        </div>

        <div class="nav-links">

            <a href="Dashboard.jsp">HOME</a>
            <a href="Search.jsp">MOVIES</a>
            <a href="Player.jsp">SERIES</a>
            <a href="recommendation.jsp">FAVORITES</a>
            <a href="MyList.jsp">MY LIST</a>

        </div>

        <a href="Profile.jsp">

            <div class="profile"></div>

        </a>

    </div>

    <!-- SEARCH HERO -->

    <div class="search-hero">

        <h1>
            Find Your Next Watch
        </h1>

        <p>
            SEARCH FROM OUR COLLECTION
        </p>

        <form class="search-bar">

            <input
                type="text"
                class="search-input"
                placeholder="Search movies, series..."
            >

            <button class="search-btn">
                🔍 SEARCH
            </button>

        </form>

    </div>

    <!-- FILTER -->

    <div class="filter-section">

        <span class="filter-label">
            FILTER BY
        </span>

        <select class="filter-select">

            <option>All Genres</option>
            <option>Action</option>
            <option>Horror</option>
            <option>Sci-Fi</option>
            <option>Comedy</option>

        </select>

        <select class="filter-select">

            <option>Sort A-Z</option>
            <option>Top Rated</option>
            <option>Newest</option>

        </select>

        <div class="result-count">

            Showing <span>8</span> results

        </div>

    </div>

    <!-- RESULTS -->

    <div class="results-section">

        <div class="results-grid">

            <!-- CARD 1 -->

            <a href="Konten.jsp">

                <div class="movie-card">

                    <div class="card-poster">

                        <img src="https://upload.wikimedia.org/wikipedia/en/e/e1/Interstellar_film_poster.jpg">

                        <div class="card-badge">
                            FILM
                        </div>

                        <div class="play-overlay">

                            <div class="play-icon">
                                ▶
                            </div>

                        </div>

                    </div>

                    <div class="card-info">

                        <h3>Interstellar</h3>

                        <div class="card-meta">

                            <span class="card-genre">
                                Sci-Fi
                            </span>

                            <span class="card-rating">
                                ⭐ 9.0
                            </span>

                        </div>

                        <div class="card-duration">
                            2h 49m
                        </div>

                    </div>

                </div>

            </a>

            <!-- CARD 2 -->

            <a href="Konten.jsp">

                <div class="movie-card">

                    <div class="card-poster">

                        <img src="https://upload.wikimedia.org/wikipedia/en/d/db/Dune_Part_Two_poster.jpeg">

                        <div class="card-badge">
                            FILM
                        </div>

                        <div class="play-overlay">

                            <div class="play-icon">
                                ▶
                            </div>

                        </div>

                    </div>

                    <div class="card-info">

                        <h3>Dune Part Two</h3>

                        <div class="card-meta">

                            <span class="card-genre">
                                Adventure
                            </span>

                            <span class="card-rating">
                                ⭐ 8.9
                            </span>

                        </div>

                        <div class="card-duration">
                            2h 46m
                        </div>

                    </div>

                </div>

            </a>

            <!-- CARD 3 -->

            <a href="Konten.jsp">

                <div class="movie-card">

                    <div class="card-poster">

                        <img src="https://upload.wikimedia.org/wikipedia/en/9/90/WandaVision_poster.jpg">

                        <div class="card-badge">
                            SERIES
                        </div>

                        <div class="play-overlay">

                            <div class="play-icon">
                                ▶
                            </div>

                        </div>

                    </div>

                    <div class="card-info">

                        <h3>WandaVision</h3>

                        <div class="card-meta">

                            <span class="card-genre">
                                Fantasy
                            </span>

                            <span class="card-rating">
                                ⭐ 8.7
                            </span>

                        </div>

                        <div class="card-duration">
                            9 Episodes
                        </div>

                    </div>

                </div>

            </a>

            <!-- CARD 4 -->

            <a href="Konten.jsp">

                <div class="movie-card">

                    <div class="card-poster">

                        <img src="https://upload.wikimedia.org/wikipedia/en/f/f7/Stranger_Things_season_4.jpg">

                        <div class="card-badge">
                            SERIES
                        </div>

                        <div class="play-overlay">

                            <div class="play-icon">
                                ▶
                            </div>

                        </div>

                    </div>

                    <div class="card-info">

                        <h3>Stranger Things</h3>

                        <div class="card-meta">

                            <span class="card-genre">
                                Horror
                            </span>

                            <span class="card-rating">
                                ⭐ 9.1
                            </span>

                        </div>

                        <div class="card-duration">
                            4 Seasons
                        </div>

                    </div>

                </div>

            </a>

        </div>

    </div>

    <!-- FOOTER -->

    <footer class="footer">

        © 2026 CineStream • Kelompok 8

    </footer>

</body>
</html>