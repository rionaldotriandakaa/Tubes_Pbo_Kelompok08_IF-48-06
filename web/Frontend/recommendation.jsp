<%-- 
    Document   : recommendation
    Created on : 20 May 2026, 17.51.10
    Author     : White
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CineStream Recommendations</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

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
        }

        /* NAVBAR */

        .navbar{
            width:100%;
            height:80px;
            padding:0 60px;
            display:flex;
            justify-content:space-between;
            align-items:center;
            position:fixed;
            top:0;
            z-index:100;
            background:rgba(0,0,0,0.25);
            backdrop-filter:blur(12px);
        }

        .logo{
            font-size:32px;
            font-weight:700;
            color:#ff9b9b;
        }

        .nav-links{
            display:flex;
            gap:35px;
        }

        .nav-links a{
            text-decoration:none;
            color:#ddd;
            font-size:14px;
            transition:0.3s;
        }

        .nav-links a:hover{
            color:#ff9b9b;
        }

        .profile{
            width:42px;
            height:42px;
            border-radius:50%;
            background:#ff9b9b;
        }

        /* HERO */

        .hero{
            height:70vh;
            background:
                linear-gradient(to right, rgba(5,8,22,0.95) 30%, rgba(5,8,22,0.3)),
                url('https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?q=80&w=2070&auto=format&fit=crop');

            background-size:cover;
            background-position:center;
            display:flex;
            align-items:center;
            padding:0 80px;
        }

        .hero-content{
            max-width:650px;
        }

        .tag{
            background:#ff9b9b;
            display:inline-block;
            padding:8px 18px;
            border-radius:20px;
            font-size:12px;
            color:black;
            font-weight:600;
            margin-bottom:25px;
        }

        .hero h1{
            font-size:70px;
            line-height:75px;
            margin-bottom:25px;
        }

        .hero p{
            color:#d2d2d2;
            line-height:30px;
            margin-bottom:35px;
        }

        .watch-btn{
            padding:18px 35px;
            border:none;
            border-radius:40px;
            background:linear-gradient(90deg,#ff9b9b,#ff6b81);
            color:black;
            font-weight:700;
            cursor:pointer;
        }

        /* SECTION */

        .section{
            padding:60px 80px;
        }

        .section-title{
            font-size:38px;
            margin-bottom:10px;
        }

        .section-subtitle{
            color:#777;
            margin-bottom:35px;
        }

        .movie-row{
            display:flex;
            gap:25px;
            overflow-x:auto;
            padding-bottom:10px;
        }

        .movie-row::-webkit-scrollbar{
            display:none;
        }

        .movie-card{
            min-width:220px;
            background:#0b1024;
            border-radius:22px;
            overflow:hidden;
            transition:0.3s;
            cursor:pointer;
        }

        .movie-card:hover{
            transform:translateY(-10px);
        }

        .movie-card img{
            width:100%;
            height:320px;
            object-fit:cover;
        }

        .movie-info{
            padding:18px;
        }

        .movie-info h3{
            margin-bottom:8px;
        }

        .movie-info p{
            color:#999;
            font-size:13px;
        }

    </style>
</head>

<body>

    <!-- NAVBAR -->

    <div class="navbar">

        <div class="logo">CineStream</div>

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

    <!-- HERO -->

    <div class="hero">

        <div class="hero-content">

            <div class="tag">
                PERSONALIZED PICKS
            </div>

            <h1>
                RECOMMENDED<br>
                FOR YOU
            </h1>

            <p>
                Discover movies and series specially selected based on
                your watch history, favorite genres, and personal ratings.
            </p>

            <button class="watch-btn">
                EXPLORE NOW
            </button>

        </div>

    </div>

    <!-- RECOMMENDED MOVIES -->

    <div class="section">

        <h2 class="section-title">Based On Your Favorites</h2>
        <p class="section-subtitle">MOVIES SELECTED JUST FOR YOU</p>

        <div class="movie-row">

            <div class="movie-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/e/e1/Interstellar_film_poster.jpg">

                <div class="movie-info">
                    <h3>Interstellar</h3>
                    <p>Sci-Fi • 2h 49m</p>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/d/db/Dune_Part_Two_poster.jpeg">

                <div class="movie-info">
                    <h3>Dune Part Two</h3>
                    <p>Sci-Fi • 2h 46m</p>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/7/7a/Everything_Everywhere_All_at_Once.jpg">

                <div class="movie-info">
                    <h3>Everything Everywhere</h3>
                    <p>Adventure • 2h 19m</p>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/8/8a/Guardians_of_the_Galaxy_Vol._3_poster.jpg">

                <div class="movie-info">
                    <h3>Guardians Vol. 3</h3>
                    <p>Action • 2h 30m</p>
                </div>
            </div>

        </div>

    </div>

</body>
</html>
