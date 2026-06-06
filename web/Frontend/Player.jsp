<%-- 
    Document   : Player
    Created on : May 20, 2026, 9:08:50 PM
    Author     : ASUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>CineStream - Player</title>

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

        /* HERO */

        .player-hero{

            min-height:100vh;

            padding-top:100px;

            position:relative;

            background:
            linear-gradient(to right,
            rgba(5,8,22,0.97),
            rgba(5,8,22,0.7)),

            url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070');

            background-size:cover;
            background-position:center;
        }

        .player-content{

            display:grid;

            grid-template-columns:1fr 420px;

            gap:60px;

            padding:60px 80px;
        }

        /* LEFT CONTENT */

        .badge{

            display:inline-block;

            padding:8px 18px;

            border-radius:30px;

            background:linear-gradient(90deg,#ff9b9b,#ff6b81);

            color:black;

            font-size:11px;
            font-weight:700;

            margin-bottom:25px;
        }

        .movie-left h1{
            font-size:70px;
            line-height:78px;
            margin-bottom:20px;
        }

        .movie-meta{
            display:flex;
            gap:20px;
            flex-wrap:wrap;

            margin-bottom:25px;

            color:#aaa;
        }

        .movie-desc{
            line-height:32px;
            color:#c4c4c4;

            max-width:650px;

            margin-bottom:35px;
        }

        /* EPISODE */

        .episode-selector{
            margin-bottom:35px;
        }

        .episode-selector h3{
            margin-bottom:15px;
            color:#888;
            letter-spacing:2px;
            font-size:13px;
        }

        .episode-tabs{
            display:flex;
            gap:12px;
            flex-wrap:wrap;
        }

        .ep-btn{

            padding:10px 18px;

            border:none;
            border-radius:14px;

            background:#0b1024;

            color:white;

            cursor:pointer;

            transition:0.3s;
        }

        .ep-btn:hover,
        .ep-btn.active{

            background:
            linear-gradient(90deg,#ff9b9b,#ff6b81);

            color:black;
            font-weight:700;
        }

        /* BUTTONS */

        .action-buttons{
            display:flex;
            gap:18px;
            flex-wrap:wrap;
        }

        .watch-btn,
        .fav-btn{

            padding:18px 35px;

            border:none;
            border-radius:40px;

            cursor:pointer;

            font-weight:700;
            font-size:15px;

            transition:0.3s;
        }

        .watch-btn{

            background:
            linear-gradient(90deg,#ff9b9b,#ff6b81);

            color:black;

            box-shadow:
            0 0 20px rgba(255,107,129,0.4);
        }

        .watch-btn:hover{
            transform:translateY(-3px);
        }

        .fav-btn{
            background:rgba(255,255,255,0.08);
            color:white;
        }

        .fav-btn:hover{
            background:rgba(255,255,255,0.14);
        }

        /* PLAYER */

        .video-box{

            background:rgba(255,255,255,0.05);

            border-radius:28px;

            padding:20px;

            backdrop-filter:blur(10px);

            border:1px solid rgba(255,255,255,0.06);
        }

        .video-screen{

            width:100%;
            height:240px;

            border-radius:20px;

            overflow:hidden;

            position:relative;

            margin-bottom:20px;
        }

        .video-screen img{
            width:100%;
            height:100%;
            object-fit:cover;

            opacity:0.6;
        }

        .play-center{

            position:absolute;
            inset:0;

            display:flex;
            justify-content:center;
            align-items:center;
        }

        .play-btn{

            width:80px;
            height:80px;

            border-radius:50%;

            background:rgba(255,155,155,0.9);

            display:flex;
            justify-content:center;
            align-items:center;

            color:black;
            font-size:30px;

            cursor:pointer;

            box-shadow:
            0 0 25px rgba(255,107,129,0.5);
        }

        /* PROGRESS */

        .progress-wrapper{
            margin-bottom:20px;
        }

        .time-display{
            display:flex;
            justify-content:space-between;

            color:#888;
            font-size:12px;

            margin-bottom:10px;
        }

        .progress-track{

            width:100%;
            height:8px;

            border-radius:10px;

            background:#1f2937;

            overflow:hidden;
        }

        .progress-fill{

            width:45%;
            height:100%;

            background:
            linear-gradient(90deg,#ff9b9b,#ff6b81);
        }

        /* CONTROLS */

        .controls{
            display:flex;
            justify-content:center;
            gap:20px;
        }

        .ctrl-btn{

            width:52px;
            height:52px;

            border:none;
            border-radius:50%;

            background:#0b1024;

            color:white;

            font-size:18px;

            cursor:pointer;
        }

        .ctrl-btn.main{

            width:65px;
            height:65px;

            background:
            linear-gradient(90deg,#ff9b9b,#ff6b81);

            color:black;
        }

        .status-bar{

            text-align:center;

            margin-top:18px;

            color:#777;

            font-size:12px;
            letter-spacing:2px;
        }

        /* RECOMMENDATION */

        .recommend-section{
            padding:70px 80px;
        }

        .section-title{
            font-size:38px;
            margin-bottom:10px;
        }

        .section-subtitle{
            color:#777;
            letter-spacing:2px;
            font-size:13px;
            margin-bottom:35px;
        }

        .movie-row{
            display:flex;
            gap:25px;
            overflow-x:auto;
        }

        .movie-row::-webkit-scrollbar{
            display:none;
        }

        .rec-card{
            min-width:200px;

            border-radius:22px;

            overflow:hidden;

            transition:0.3s;
        }

        .rec-card:hover{
            transform:translateY(-10px);
        }

        .rec-card img{
            width:100%;
            height:280px;
            object-fit:cover;
        }

        .rec-card-info{
            background:#0b1024;
            padding:16px;
        }

        .rec-card-info h4{
            margin-bottom:6px;
        }

        .rec-card-info p{
            color:#888;
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

        <a href="Dashboard.jsp" class="logo">
            CineStream
        </a>

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

    <!-- PLAYER HERO -->

    <div class="player-hero">

        <div class="player-content">

            <!-- LEFT -->

            <div class="movie-left">

                <div class="badge">
                    SERIES
                </div>

                <h1>
                    Stranger <br>
                    Things
                </h1>

                <div class="movie-meta">

                    <span>⭐ 9.1/10</span>
                    <span>Horror • Fantasy</span>
                    <span>4 Seasons</span>

                </div>

                <p class="movie-desc">

                    When supernatural forces emerge in a small town,
                    a group of friends uncover dark secrets,
                    dangerous experiments, and terrifying alternate realities.

                </p>

                <!-- EPISODES -->

                <div class="episode-selector">

                    <h3>
                        SELECT EPISODE
                    </h3>

                    <div class="episode-tabs">

                        <button class="ep-btn active">
                            EP 1
                        </button>

                        <button class="ep-btn">
                            EP 2
                        </button>

                        <button class="ep-btn">
                            EP 3
                        </button>

                        <button class="ep-btn">
                            EP 4
                        </button>

                    </div>

                </div>

                <!-- BUTTONS -->

                <div class="action-buttons">

                    <button class="watch-btn">
                        ▶ WATCH NOW
                    </button>

                    <button class="fav-btn">
                        ♡ ADD FAVORITE
                    </button>

                </div>

            </div>

            <!-- RIGHT PLAYER -->

            <div class="movie-right">

                <div class="video-box">

                    <div class="video-screen">

                        <img src="https://upload.wikimedia.org/wikipedia/en/f/f7/Stranger_Things_season_4.jpg">

                        <div class="play-center">

                            <div class="play-btn">
                                ▶
                            </div>

                        </div>

                    </div>

                    <!-- PROGRESS -->

                    <div class="progress-wrapper">

                        <div class="time-display">

                            <span>
                                24:15
                            </span>

                            <span>
                                52:00
                            </span>

                        </div>

                        <div class="progress-track">

                            <div class="progress-fill"></div>

                        </div>

                    </div>

                    <!-- CONTROLS -->

                    <div class="controls">

                        <button class="ctrl-btn">
                            ⏪
                        </button>

                        <button class="ctrl-btn main">
                            ▶
                        </button>

                        <button class="ctrl-btn">
                            ⏩
                        </button>

                    </div>

                    <div class="status-bar">
                        NOW PLAYING
                    </div>

                </div>

            </div>

        </div>

    </div>

    <!-- RECOMMENDATION -->

    <div class="recommend-section">

        <h2 class="section-title">
            You Might Also Like
        </h2>

        <p class="section-subtitle">
            BASED ON WHAT YOU'RE WATCHING
        </p>

        <div class="movie-row">

            <a href="Konten.jsp" class="rec-card">

                <img src="https://upload.wikimedia.org/wikipedia/en/e/e1/Interstellar_film_poster.jpg">

                <div class="rec-card-info">

                    <h4>Interstellar</h4>
                    <p>Sci-Fi • Film</p>

                </div>

            </a>

            <a href="Konten.jsp" class="rec-card">

                <img src="https://upload.wikimedia.org/wikipedia/en/9/90/WandaVision_poster.jpg">

                <div class="rec-card-info">

                    <h4>WandaVision</h4>
                    <p>Fantasy • Series</p>

                </div>

            </a>

            <a href="Konten.jsp" class="rec-card">

                <img src="https://upload.wikimedia.org/wikipedia/en/d/db/Dune_Part_Two_poster.jpeg">

                <div class="rec-card-info">

                    <h4>Dune Part Two</h4>
                    <p>Adventure • Film</p>

                </div>

            </a>

            <a href="Konten.jsp" class="rec-card">

                <img src="https://upload.wikimedia.org/wikipedia/en/0/05/Frozen_%282013_film%29_poster.jpg">

                <div class="rec-card-info">

                    <h4>Frozen</h4>
                    <p>Fantasy • Film</p>

                </div>

            </a>

        </div>

    </div>

</body>
</html>