<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CineStream Dashboard</title>

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
            height:100vh;
            background:
                linear-gradient(to right, rgba(5,8,22,0.96) 30%, rgba(5,8,22,0.2)),
                url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070&auto=format&fit=crop');

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
            font-size:90px;
            line-height:95px;
            margin-bottom:25px;
            font-weight:700;
        }

        .hero p{
            color:#d2d2d2;
            line-height:32px;
            max-width:600px;
            margin-bottom:35px;
        }

        .hero-buttons{
            display:flex;
            gap:20px;
        }

        .watch-btn{
            padding:18px 35px;
            border:none;
            border-radius:40px;
            background:linear-gradient(90deg,#ff9b9b,#ff6b81);
            color:black;
            font-weight:700;
            cursor:pointer;
            box-shadow:0 0 20px rgba(255,107,129,0.5);
        }

        .fav-btn{
            padding:18px 35px;
            border:none;
            border-radius:40px;
            background:rgba(255,255,255,0.08);
            color:white;
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

        /* CONTINUE WATCHING */

        .continue-grid{
            display:grid;
            grid-template-columns:repeat(3,1fr);
            gap:25px;
        }

        .continue-card{
            background:#0b1024;
            border-radius:20px;
            padding:20px;
            display:flex;
            align-items:center;
            gap:18px;
        }

        .continue-card img{
            width:90px;
            height:60px;
            border-radius:12px;
            object-fit:cover;
        }

        .continue-info h4{
            margin-bottom:5px;
        }

        .continue-info p{
            color:#888;
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
                FEATURED PREMIERE
            </div>

            <h1>
                AVANGERS<br>
                DOOMSDAY
            </h1>

            <p>
                When the greatest threat rises from the shadows,
                the Avengers must reunite to face the ultimate destruction.
                In a battle filled with sacrifice, courage, and destiny,
                the fate of humanity hangs in the balance.
            </p>

            <div class="hero-buttons">
                <button class="watch-btn">WATCH NOW</button>
                <button class="fav-btn">ADD TO FAVORITES</button>
            </div>

        </div>

    </div>

    <!-- TRENDING -->

    <div class="section">

        <h2 class="section-title">Trending Now</h2>
        <p class="section-subtitle">GLOBAL FAVORITES THIS WEEK</p>

        <div class="movie-row">

            <div class="movie-card">
                <img src="https://upload.wikimedia.org/wikipedia/id/3/3e/Pengabdi_Setan_2_Poster.jpg">
                <div class="movie-info">
                    <h3>Pengabdi Setan</h3>
                    <p>Horror • 2h 14m</p>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/8/87/The_Lord_of_the_Rings_-_The_Two_Towers.jpg">
                <div class="movie-info">
                    <h3>Lord Of The Rings</h3>
                    <p>Fantasy • 3h 45m</p>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/WandaVision_poster.jpg">
                <div class="movie-info">
                    <h3>Wanda Vision</h3>
                    <p>Adventure • 2h 30m</p>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/0/05/Frozen_%282013_film%29_poster.jpg">
                <div class="movie-info">
                    <h3>Frozen</h3>
                    <p>Fantasy • 1h 52m</p>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/b/bd/Doctor_Strange_in_the_Multiverse_of_Madness_poster.jpg">
                <div class="movie-info">
                    <h3>Doctor Strange</h3>
                    <p>Action • 2h 05m</p>
                </div>
            </div>

        </div>

    </div>

    <!-- CONTINUE WATCHING -->

    <div class="section">

        <h2 class="section-title">Continue Watching</h2>
        <p class="section-subtitle">PICK UP WHERE YOU LEFT OFF</p>

        <div class="continue-grid">

            <div class="continue-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/f/f7/Stranger_Things_season_4.jpg">
                <div class="continue-info">
                    <h4>Stranger Things</h4>
                    <p>S1:E4 • 42m remaining</p>
                </div>
            </div>

            <div class="continue-card">
                <img src="https://upload.wikimedia.org/wikipedia/id/3/3e/Pengabdi_Setan_2_Poster.jpg">
                <div class="continue-info">
                    <h4>Pengabdi Setan</h4>
                    <p>15m remaining</p>
                </div>
            </div>

            <div class="continue-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/9/9d/Loki_season_2_poster.jpg">
                <div class="continue-info">
                    <h4>Loki</h4>
                    <p>S2:E2 • 5m remaining</p>
                </div>
            </div>

        </div>

    </div>

</body>
</html>