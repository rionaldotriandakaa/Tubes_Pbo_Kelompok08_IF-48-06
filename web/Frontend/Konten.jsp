<%-- 
    Document   : Konten
    Created on : 22 May 2026, 14.22.07
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>CineStream - Konten</title>

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
        }

        a{
            text-decoration:none;
            color:white;
        }

        /* navigasi */

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
            gap:35px;
        }

        .nav-links a{
            color:#ddd;
            transition:0.3s;
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
        }

        /* poster */

        .hero{
            min-height:100vh;

            padding:140px 80px 80px;

            display:flex;
            gap:60px;
            align-items:center;

            background:
            linear-gradient(to right,
            rgba(5,8,22,0.95),
            rgba(5,8,22,0.65)),

            url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070');

            background-size:cover;
            background-position:center;
        }

        .poster img{
            width:340px;
            border-radius:28px;

            box-shadow:0 0 35px rgba(255,107,129,0.35);
        }

        .hero-content{
            max-width:700px;
        }

        .tag{
            display:inline-block;

            padding:8px 18px;

            border-radius:30px;

            background:#ff9b9b;
            color:black;

            font-size:12px;
            font-weight:700;

            margin-bottom:20px;
        }

        .hero-content h1{
            font-size:72px;
            line-height:80px;
            margin-bottom:20px;
        }

        .meta{
            display:flex;
            gap:20px;
            flex-wrap:wrap;

            margin-bottom:25px;

            color:#d1d1d1;
        }

        .description{
            line-height:32px;
            color:#bcbcbc;

            margin-bottom:35px;
        }

        .buttons{
            display:flex;
            gap:18px;
            flex-wrap:wrap;
        }

        .watch-btn,
        .list-btn{

            padding:18px 34px;

            border:none;
            border-radius:40px;

            cursor:pointer;

            font-weight:700;
            font-size:15px;

            transition:0.3s;
        }

        .watch-btn{
            background:linear-gradient(90deg,#ff9b9b,#ff6b81);
            color:black;

            box-shadow:0 0 25px rgba(255,107,129,0.5);
        }

        .watch-btn:hover{
            transform:translateY(-3px);
        }

        .list-btn{
            background:rgba(255,255,255,0.08);
            color:white;
        }

        .list-btn:hover{
            background:rgba(255,255,255,0.15);
        }

        /* SECTION */

        .section{
            padding:70px 80px;
        }

        .section-title{
            font-size:38px;
            margin-bottom:12px;
        }

        .section-subtitle{
            color:#777;
            letter-spacing:2px;
            margin-bottom:35px;
            font-size:13px;
        }

        /* CONTINUE WATCHING */

        .continue-card{

            background:#0b1024;

            border-radius:24px;

            padding:30px;
        }

        .continue-top{
            display:flex;
            justify-content:space-between;
            margin-bottom:18px;
        }

        .progress-bar{
            width:100%;
            height:10px;

            border-radius:10px;

            background:#1f2937;

            overflow:hidden;
        }

        .progress-fill{
            width:45%;
            height:100%;

            background:linear-gradient(90deg,#ff9b9b,#ff6b81);
        }

        /* EPISODES */

        .episode-header{
            display:flex;
            justify-content:space-between;
            align-items:center;

            margin-bottom:30px;
        }

        .season-select{

            padding:14px 20px;

            border:none;
            border-radius:14px;

            background:#0b1024;
            color:white;
        }

        .episode-grid{
            display:grid;
            grid-template-columns:repeat(auto-fill,minmax(250px,1fr));
            gap:25px;
        }

        .episode-card{

            background:#0b1024;

            padding:25px;

            border-radius:22px;

            transition:0.3s;
        }

        .episode-card:hover{
            transform:translateY(-8px);
        }

        .episode-card h3{
            margin-bottom:12px;
        }

        .episode-card p{
            color:#8d8d8d;
            line-height:24px;
        }

        /* RECOMMENDATION */

        .movie-row{
            display:flex;
            gap:25px;
            overflow-x:auto;
        }

        .movie-row::-webkit-scrollbar{
            display:none;
        }

        .movie-card{
            min-width:220px;

            background:#0b1024;

            border-radius:24px;

            overflow:hidden;

            transition:0.3s;
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
            color:#8d8d8d;
            font-size:13px;
        }

        /* COMMENTS */

        .rating-header{

            display:flex;
            align-items:center;
            gap:20px;

            margin-bottom:35px;
        }

        .rating-number{
            font-size:55px;
            font-weight:700;
            color:#ff9b9b;
        }

        .comment-grid{
            display:grid;
            gap:25px;
        }

        .comment-card{

            background:#0b1024;

            padding:28px;

            border-radius:24px;
        }

        .comment-user{
            font-weight:700;
            margin-bottom:12px;
        }

        .stars{
            color:#ffd43b;
            margin-bottom:15px;
        }

        .comment-text{
            color:#bcbcbc;
            line-height:28px;
        }

        /* FOOTER */

        .footer{

            padding:40px;

            text-align:center;

            color:#777;

            border-top:1px solid rgba(255,255,255,0.06);
        }

    </style>
</head>
<body>

    <!-- NAVBAR -->
    <div class="navbar">
        <div class="logo">CineStream</div>
        <div class="nav-links">
            <a href="Dashboard.jsp">HOME</a>
            <a href="Search.jsp">MOVIES</a>
            <a href="Player.jsp">SERIES</a>
            <a href="MyList.jsp">MY LIST</a>
            <a href="Profile.jsp">PROFILE</a>
        </div>
        <div class="profile"></div>
    </div>

    <!-- HERO -->

    <section class="hero">
        <div class="poster">
            <img src="https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg">
        </div>
        <div class="hero-content">
            <div class="tag">FEATURED SERIES</div>
            <h1>Avengers <br>Doomsday</h1>
            <div class="meta">
                <span>⭐ 9.2/10</span>
                <span>Action • Sci-Fi</span>
                <span>8 Episodes</span>
            </div>
            <p class="description">
                Earth's mightiest heroes reunite once again to face
                a multiversal catastrophe that threatens all realities.
                A battle beyond time begins.
            </p>
            <div class="buttons">
                <button class="watch-btn">▶ WATCH NOW</button>
                <button class="list-btn">+ WATCHLIST</button>
                <button class="list-btn">♡ FAVORITE</button>
            </div>
        </div>
    </section>

    <!-- CONTINUE WATCHING -->

    <section class="section">
        <h2 class="section-title">Continue Watching</h2>
        <p class="section-subtitle">RESUME YOUR LAST SESSION</p>
        <div class="continue-card">
            <div class="continue-top">
                <h3>Episode 4 • The Last Portal</h3>
                <span>45% Completed</span>
            </div>
            <div class="progress-bar">
                <div class="progress-fill"></div>
            </div>
        </div>
    </section>

    <!-- EPISODES -->

    <section class="section">
        <div class="episode-header">
            <div>
                <h2 class="section-title">Episodes</h2>
                <p class="section-subtitle">SEASON COLLECTION</p>
            </div>
            <select class="season-select">
                <option>Season 1</option>
                <option>Season 2</option>
            </select>
        </div>
        <div class="episode-grid">
            <div class="episode-card">
                <h3>Episode 1</h3>
                <p>The Avengers discover the beginning of the multiverse collapse.</p>
            </div>
            <div class="episode-card">
                <h3>Episode 2</h3>
                <p>Strange realities collide as heroes search for answers.</p>
            </div>
            <div class="episode-card">
                <h3>Episode 3</h3>
                <p>An unexpected villain rises from another universe.</p>
            </div>
            <div class="episode-card">
                <h3>Episode 4</h3>
                <p>The final portal opens and chaos begins.</p>
            </div>
        </div>
    </section>

    <!-- RECOMMENDATIONS -->
    <section class="section">
        <h2 class="section-title">Recommended For You</h2>
        <p class="section-subtitle">BASED ON YOUR WATCH HISTORY</p>
        <div class="movie-row">
            <a href="Konten.jsp">
                <div class="movie-card">
                    <img src="https://upload.wikimedia.org/wikipedia/en/e/e1/Interstellar_film_poster.jpg">
                    <div class="movie-info">
                        <h3>Interstellar</h3>
                        <p>Sci-Fi • 2h 49m</p>
                    </div>
                </div>
            </a>
            <div class="movie-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/d/db/Dune_Part_Two_poster.jpeg">
                <div class="movie-info">
                    <h3>Dune Part Two</h3>
                    <p>Adventure • 2h 46m</p>
                </div>
            </div>
            <div class="movie-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/8/8a/Guardians_of_the_Galaxy_Vol._3_poster.jpg">
                <div class="movie-info">
                    <h3>Guardians Vol.3</h3>
                    <p>Action • 2h 30m</p>
                </div>
            </div>
        </div>
    </section>

    <!-- COMMENTS -->

    <section class="section">
        <div class="rating-header">
            <div class="rating-number">4.8</div>
            <div>
                <div class="stars">⭐⭐⭐⭐⭐</div>
                <p>Based on 2.4k reviews</p>
            </div>
        </div>
        <div class="comment-grid">
            <div class="comment-card">
                <div class="comment-user">Viozkyyy</div>
                <div class="stars">⭐⭐⭐⭐⭐</div>
                <div class="comment-text">
                    One of the best Marvel stories ever created.
                    The visuals and action sequences are incredible.
                </div>
            </div>
            <div class="comment-card">
                <div class="comment-user">CineLover</div>
                <div class="stars">⭐⭐⭐⭐☆</div>
                <div class="comment-text">
                    Amazing multiverse concept and emotional ending.
                    Definitely worth watching.
                </div>
            </div>
        </div>
    </section>

    <!-- FOOTER -->

    <footer class="footer">
        © 2026 CineStream • Kelompok 8
    </footer>
</body>
</html>