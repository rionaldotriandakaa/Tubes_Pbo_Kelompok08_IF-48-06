<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CineStream Dashboard</title>

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

        <style>

            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
                font-family:'Poppins',sans-serif;
            }

            body{
                background:#040816;
                color:white;
                overflow-x:hidden;
            }

            a{
                text-decoration:none;
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
                gap:35px;
            }

            .nav-links a{
                color:#ddd;
                font-size:14px;
                transition:0.3s;
            }

            .nav-links a:hover{
                color:#ff9b9b;
            }

            .right-nav{
                display:flex;
                align-items:center;
                gap:20px;
            }

            .icon{
                font-size:20px;
                cursor:pointer;
            }

            .profile{
                width:42px;
                height:42px;

                border-radius:50%;

                background-image:url('https://i.pravatar.cc/150?img=12');

                background-size:cover;
                background-position:center;

                border:2px solid #ff9b9b;
            }

            /* HERO */

            .hero{
                height:100vh;

                background:
                    linear-gradient(to right,
                    rgba(4,8,22,0.96) 25%,
                    rgba(4,8,22,0.4)),
                    url('https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=1974');

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
                display:inline-block;

                padding:8px 18px;

                background:#ff9b9b;

                color:black;
                font-size:12px;
                font-weight:700;

                border-radius:20px;

                margin-bottom:25px;
            }

            .hero h1{
                font-size:90px;
                line-height:92px;
                margin-bottom:25px;
                font-weight:800;
            }

            .hero p{
                color:#d2d2d2;
                line-height:32px;
                margin-bottom:35px;
                max-width:550px;
            }

            .hero-buttons{
                display:flex;
                gap:20px;
            }

            .watch-btn{
                padding:18px 38px;

                border:none;
                border-radius:40px;

                background:linear-gradient(90deg,#ff9b9b,#ff6b81);

                color:black;
                font-weight:700;

                cursor:pointer;

                box-shadow:0 0 20px rgba(255,107,129,0.5);
            }

            .fav-btn{
                padding:18px 38px;

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
                font-size:40px;
                margin-bottom:10px;
            }

            .section-subtitle{
                color:#7b8190;
                margin-bottom:35px;
                letter-spacing:2px;
                font-size:13px;
            }

            /* MOVIES */
            .movie-row a{
                text-decoration:none;
                color:white;
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
                min-width:230px;

                background:#0b1024;

                border-radius:24px;

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
                color:#8c8c8c;
                font-size:13px;
            }

            /* CONTINUE WATCHING */

            .continue-grid a{
                text-decoration:none;
                color:white;
            }

            .continue-grid{
                display:grid;
                grid-template-columns:repeat(3,1fr);
                gap:25px;
            }

            .continue-card{
                background:#0b1024;
                border-radius:22px;
                padding:20px;

                display:flex;
                align-items:center;
                gap:18px;
            }

            .continue-card img{
                width:100px;
                height:70px;

                border-radius:12px;
                object-fit:cover;
            }

            .continue-info h4{
                margin-bottom:8px;
            }

            .continue-info p{
                color:#8d8d8d;
                font-size:13px;
            }

            /* NAVBAR SEARCH */
            .navbar-search {
                display: flex;
                align-items: center;
            }

            .navbar-search-input {
                height: 40px;
                width: 200px;
                border-radius: 20px 0 0 20px;
                background: rgba(255,255,255,0.08);
                border: 1px solid rgba(255,255,255,0.1);
                border-right: none;
                padding: 0 18px;
                color: white;
                font-size: 13px;
                font-family: 'Poppins', sans-serif;
                outline: none;
                transition: 0.3s;
            }

            .navbar-search-input:focus {
                background: rgba(255,255,255,0.12);
                border-color: #ff9b9b;
                width: 260px;
            }

            .navbar-search-input::placeholder {
                color: #777;
            }

            .navbar-search-btn {
                height: 40px;
                padding: 0 18px;
                border-radius: 0 20px 20px 0;
                background: linear-gradient(90deg, #ff9b9b, #ff6b81);
                border: none;
                color: #111;
                font-size: 13px;
                font-weight: 700;
                font-family: 'Poppins', sans-serif;
                cursor: pointer;
                transition: 0.3s;
            }

            .navbar-search-btn:hover {
                box-shadow: 0 0 15px rgba(255,107,129,0.6);
            }
        </style>
    </head>

    <body>

        <!-- NAVBAR -->
        <div class="navbar">
            <div class="logo">CineStream</div>
            <div class="nav-links">
                <a href="/CineStream/Frontend/Dashboard.jsp">HOME</a>
                <a href="#">MOVIES</a>
                <a href="#">SERIES</a>
                <a href="/CineStream/Frontend/recommendation.jsp">FAVORITES</a>
                <a href="/CineStream/Frontend/MyList.jsp">MY LIST</a>
            </div>

            <!-- SEARCH BAR -->
            <form action="/CineStream/search" method="get" class="navbar-search">
                <input
                    type="text"
                    name="keyword"
                    class="navbar-search-input"
                    placeholder="🔍  Search movies...">
                <button type="submit" class="navbar-search-btn">Search</button>
            </form>

            <div class="right-nav">
                <div class="icon">🔔</div>
                <a href="/CineStream/Frontend/Profile.jsp">
                    <div class="profile"></div>
                </a>
            </div>
        </div>

        <!-- HERO -->

        <div class="hero">

            <div class="hero-content">

                <div class="tag">
                    FEATURED PREMIERE
                </div>

                <h1>
                    AVENGERS<br>
                    DOOMSDAY
                </h1>

                <p>
                    When the greatest threat rises from the shadows,
                    the Avengers must reunite to face the ultimate destruction.
                    In a battle filled with sacrifice, courage, and destiny,
                    the fate of humanity hangs in the balance.
                </p>

                <div class="hero-buttons">

                    <button class="watch-btn">
                        ▶ WATCH NOW
                    </button>

                    <button class="fav-btn">
                        + ADD TO FAVORITES
                    </button>

                </div>

            </div>

        </div>

        <!-- TRENDING -->

        <div class="section">

            <h2 class="section-title">
                Trending Now
            </h2>

            <p class="section-subtitle">
                GLOBAL FAVORITES THIS WEEK
            </p>

            <div class="movie-row">

                <a href="Konten.jsp">

                    <div class="movie-card">

                        <img src="https://upload.wikimedia.org/wikipedia/id/3/3e/Pengabdi_Setan_2_Poster.jpg">

                        <div class="movie-info">

                            <h3>Pengabdi Setan</h3>

                            <p>
                                Horror • 2h 14m
                            </p>

                        </div>

                    </div>

                </a>

                <a href="Konten.jsp">

                    <div class="movie-card">

                        <img src="https://upload.wikimedia.org/wikipedia/en/8/81/The_Lord_of_the_Rings%2C_TFOTR_%282001%29.jpg">

                        <div class="movie-info">

                            <h3>Lord Of The Rings</h3>

                            <p>
                                Fantasy • 3h 10m
                            </p>

                        </div>

                    </div>

                </a>

                <a href="Konten.jsp">

                    <div class="movie-card">

                        <img src="https://upload.wikimedia.org/wikipedia/en/9/90/WandaVision_poster.jpg">

                        <div class="movie-info">

                            <h3>WandaVision</h3>

                            <p>
                                Adventure • 2h 30m
                            </p>

                        </div>

                    </div>

                </a>

                <a href="Konten.jsp">

                    <div class="movie-card">

                        <img src="https://upload.wikimedia.org/wikipedia/en/9/90/WandaVision_poster.jpg">

                        <div class="movie-info">

                            <h3>Frozen</h3>

                            <p>
                                Fantasy • 1h 52m
                            </p>

                        </div>

                    </div>

                </a>

            </div>

        </div>

        <!-- CONTINUE WATCHING -->

        <div class="section">

            <h2 class="section-title">
                Continue Watching
            </h2>

            <p class="section-subtitle">
                PICK UP WHERE YOU LEFT OFF
            </p>

            <div class="continue-grid">

                <a href="Konten.jsp">

                    <div class="continue-card">

                        <img src="https://upload.wikimedia.org/wikipedia/en/f/f7/Stranger_Things_season_4.jpg">

                        <div class="continue-info">
                            <h4>Stranger Things</h4>
                            <p>S1:E4 • 42m remaining</p>
                        </div>

                    </div>

                </a>

                <a href="Konten.jsp">

                    <div class="continue-card">

                        <img src="https://upload.wikimedia.org/wikipedia/id/3/3e/Pengabdi_Setan_2_Poster.jpg">

                        <div class="continue-info">
                            <h4>Pengabdi Setan</h4>
                            <p>15m remaining</p>
                        </div>

                    </div>

                </a>

                <a href="Konten.jsp">

                    <div class="continue-card">

                        <img src="https://upload.wikimedia.org/wikipedia/en/4/44/Loki_season_2_poster.jpeg">

                        <div class="continue-info">
                            <h4>Loki</h4>
                            <p>S2:E2 • 15m remaining</p>
                        </div>

                    </div>

                </a>

            </div>

        </div>

        <!-- RECOMMENDED -->

        <div class="section">

            <h2 class="section-title">
                Recommended For You
            </h2>

            <p class="section-subtitle">
                BASED ON YOUR VIEWING HISTORY
            </p>

            <div class="movie-row">

                <a href="Konten.jsp">

                    <div class="movie-card">

                        <img src="https://upload.wikimedia.org/wikipedia/en/6/6b/Final_Destination_Bloodlines.jpg">

                        <div class="movie-info">

                            <h3>Final Destination</h3>

                            <p>
                                Horror • 98% Match
                            </p>

                        </div>

                    </div>

                </a>

                <a href="Konten.jsp">

                    <div class="movie-card">

                        <img src="https://upload.wikimedia.org/wikipedia/en/0/0b/Barbie_2023_poster.jpg">

                        <div class="movie-info">

                            <h3>Barbie</h3>

                            <p>
                                Comedy • 96% Match
                            </p>

                        </div>

                    </div>

                </a>

                <a href="Konten.jsp">

                    <div class="movie-card">

                        <img src="https://upload.wikimedia.org/wikipedia/en/3/3c/Insidious_the_red_door.png">

                        <div class="movie-info">

                            <h3>Insidious</h3>

                            <p>
                                Horror • 92% Match
                            </p>

                        </div>

                    </div>

                </a>

            </div>

        </div>

    </body>
</html><%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CineStream Dashboard</title>

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

        <style>

            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
                font-family:'Poppins',sans-serif;
            }

            body{
                background:#040816;
                color:white;
                overflow-x:hidden;
            }

            a{
                text-decoration:none;
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
                gap:35px;
            }

            .nav-links a{
                color:#ddd;
                font-size:14px;
                transition:0.3s;
            }

            .nav-links a:hover{
                color:#ff9b9b;
            }

            .right-nav{
                display:flex;
                align-items:center;
                gap:20px;
            }

            .icon{
                font-size:20px;
                cursor:pointer;
            }

            .profile{
                width:42px;
                height:42px;

                border-radius:50%;

                background-image:url('https://i.pravatar.cc/150?img=12');

                background-size:cover;
                background-position:center;

                border:2px solid #ff9b9b;
            }

            /* HERO */

            .hero{
                height:100vh;

                background:
                    linear-gradient(to right,
                    rgba(4,8,22,0.96) 25%,
                    rgba(4,8,22,0.4)),
                    url('https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=1974');

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
                display:inline-block;

                padding:8px 18px;

                background:#ff9b9b;

                color:black;
                font-size:12px;
                font-weight:700;

                border-radius:20px;

                margin-bottom:25px;
            }

            .hero h1{
                font-size:90px;
                line-height:92px;
                margin-bottom:25px;
                font-weight:800;
            }

            .hero p{
                color:#d2d2d2;
                line-height:32px;
                margin-bottom:35px;
                max-width:550px;
            }

            .hero-buttons{
                display:flex;
                gap:20px;
            }

            .watch-btn{
                padding:18px 38px;

                border:none;
                border-radius:40px;

                background:linear-gradient(90deg,#ff9b9b,#ff6b81);

                color:black;
                font-weight:700;

                cursor:pointer;

                box-shadow:0 0 20px rgba(255,107,129,0.5);
            }

            .fav-btn{
                padding:18px 38px;

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
                font-size:40px;
                margin-bottom:10px;
            }

            .section-subtitle{
                color:#7b8190;
                margin-bottom:35px;
                letter-spacing:2px;
                font-size:13px;
            }

            /* MOVIES */
            .movie-row a{
                text-decoration:none;
                color:white;
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
                min-width:230px;

                background:#0b1024;

                border-radius:24px;

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
                color:#8c8c8c;
                font-size:13px;
            }

            /* CONTINUE WATCHING */

            .continue-grid a{
                text-decoration:none;
                color:white;
            }

            .continue-grid{
                display:grid;
                grid-template-columns:repeat(3,1fr);
                gap:25px;
            }

            .continue-card{
                background:#0b1024;
                border-radius:22px;
                padding:20px;

                display:flex;
                align-items:center;
                gap:18px;
            }

            .continue-card img{
                width:100px;
                height:70px;

                border-radius:12px;
                object-fit:cover;
            }

            .continue-info h4{
                margin-bottom:8px;
            }

            .continue-info p{
                color:#8d8d8d;
                font-size:13px;
            }

            /* NAVBAR SEARCH */
            .navbar-search {
                display: flex;
                align-items: center;
            }

            .navbar-search-input {
                height: 40px;
                width: 200px;
                border-radius: 20px 0 0 20px;
                background: rgba(255,255,255,0.08);
                border: 1px solid rgba(255,255,255,0.1);
                border-right: none;
                padding: 0 18px;
                color: white;
                font-size: 13px;
                font-family: 'Poppins', sans-serif;
                outline: none;
                transition: 0.3s;
            }

            .navbar-search-input:focus {
                background: rgba(255,255,255,0.12);
                border-color: #ff9b9b;
                width: 260px;
            }

            .navbar-search-input::placeholder {
                color: #777;
            }

            .navbar-search-btn {
                height: 40px;
                padding: 0 18px;
                border-radius: 0 20px 20px 0;
                background: linear-gradient(90deg, #ff9b9b, #ff6b81);
                border: none;
                color: #111;
                font-size: 13px;
                font-weight: 700;
                font-family: 'Poppins', sans-serif;
                cursor: pointer;
                transition: 0.3s;
            }

            .navbar-search-btn:hover {
                box-shadow: 0 0 15px rgba(255,107,129,0.6);
            }
        </style>
    </head>

    <body>

        <!-- NAVBAR -->
        <div class="navbar">
            <div class="logo">CineStream</div>
            <div class="nav-links">
                <a href="/CineStream/Frontend/Dashboard.jsp">HOME</a>
                <a href="#">MOVIES</a>
                <a href="#">SERIES</a>
                <a href="/CineStream/Frontend/recommendation.jsp">FAVORITES</a>
                <a href="/CineStream/Frontend/MyList.jsp">MY LIST</a>
            </div>

            <!-- SEARCH BAR -->
            <form action="/CineStream/search" method="get" class="navbar-search">
                <input
                    type="text"
                    name="keyword"
                    class="navbar-search-input"
                    placeholder="🔍  Search movies...">
                <button type="submit" class="navbar-search-btn">Search</button>
            </form>

            <div class="right-nav">
                <div class="icon">🔔</div>
                <a href="/CineStream/Frontend/Profile.jsp">
                    <div class="profile"></div>
                </a>
            </div>
        </div>

        <!-- HERO -->

        <div class="hero">
            <div class="hero-content">
                <div class="tag">
                    FEATURED PREMIERE
                </div>
                <h1>
                    AVENGERS<br>
                    DOOMSDAY
                </h1>
                <p>
                    When the greatest threat rises from the shadows,
                    the Avengers must reunite to face the ultimate destruction.
                    In a battle filled with sacrifice, courage, and destiny,
                    the fate of humanity hangs in the balance.
                </p>
                <div class="hero-buttons">
                    <button class="watch-btn">
                        ▶ WATCH NOW
                    </button>
                    <button class="fav-btn">
                        + ADD TO FAVORITES
                    </button>
                </div>
            </div>
        </div>

        <!-- TRENDING -->

        <div class="section">
            <h2 class="section-title">
                Trending Now
            </h2>
            <p class="section-subtitle">
                GLOBAL FAVORITES THIS WEEK
            </p>
            <div class="movie-row">
                <a href="Konten.jsp">
                    <div class="movie-card">
                        <img src="https://upload.wikimedia.org/wikipedia/id/3/3e/Pengabdi_Setan_2_Poster.jpg">
                        <div class="movie-info">
                            <h3>Pengabdi Setan</h3>
                            <p>
                                Horror • 2h 14m
                            </p>
                        </div>
                    </div>
                </a>
                <a href="Konten.jsp">
                    <div class="movie-card">
                        <img src="https://upload.wikimedia.org/wikipedia/en/8/81/The_Lord_of_the_Rings%2C_TFOTR_%282001%29.jpg">
                        <div class="movie-info">
                            <h3>Lord Of The Rings</h3>
                            <p>
                                Fantasy • 3h 10m
                            </p>
                        </div>
                    </div>
                </a>
                <a href="Konten.jsp">
                    <div class="movie-card">
                        <img src="https://upload.wikimedia.org/wikipedia/en/9/90/WandaVision_poster.jpg">
                        <div class="movie-info">
                            <h3>WandaVision</h3>
                            <p>
                                Adventure • 2h 30m
                            </p>
                        </div>
                    </div>
                </a>
                <a href="Konten.jsp">
                    <div class="movie-card">
                        <img src="https://upload.wikimedia.org/wikipedia/en/9/90/WandaVision_poster.jpg">
                        <div class="movie-info">
                            <h3>Frozen</h3>
                            <p>
                                Fantasy • 1h 52m
                            </p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <!-- CONTINUE WATCHING -->

        <div class="section">
            <h2 class="section-title">
                Continue Watching
            </h2>
            <p class="section-subtitle">
                PICK UP WHERE YOU LEFT OFF
            </p>
            <div class="continue-grid">
                <a href="Konten.jsp">
                    <div class="continue-card">
                        <img src="https://upload.wikimedia.org/wikipedia/en/f/f7/Stranger_Things_season_4.jpg">
                        <div class="continue-info">
                            <h4>Stranger Things</h4>
                            <p>S1:E4 • 42m remaining</p>
                        </div>
                    </div>
                </a>
                <a href="Konten.jsp">
                    <div class="continue-card">
                        <img src="https://upload.wikimedia.org/wikipedia/id/3/3e/Pengabdi_Setan_2_Poster.jpg">
                        <div class="continue-info">
                            <h4>Pengabdi Setan</h4>
                            <p>15m remaining</p>
                        </div>
                    </div>
                </a>
                <a href="Konten.jsp">
                    <div class="continue-card">
                        <img src="https://upload.wikimedia.org/wikipedia/en/4/44/Loki_season_2_poster.jpeg">
                        <div class="continue-info">
                            <h4>Loki</h4>
                            <p>S2:E2 • 15m remaining</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <!-- RECOMMENDED -->

        <div class="section">
            <h2 class="section-title">
                Recommended For You
            </h2>
            <p class="section-subtitle">
                BASED ON YOUR VIEWING HISTORY
            </p>
            <div class="movie-row">
                <a href="Konten.jsp">
                    <div class="movie-card">
                        <img src="https://upload.wikimedia.org/wikipedia/en/6/6b/Final_Destination_Bloodlines.jpg">
                        <div class="movie-info">
                            <h3>Final Destination</h3>
                            <p>
                                Horror • 98% Match
                            </p>
                        </div>
                    </div>
                </a>
                <a href="Konten.jsp">
                    <div class="movie-card">
                        <img src="https://upload.wikimedia.org/wikipedia/en/0/0b/Barbie_2023_poster.jpg">
                        <div class="movie-info">
                            <h3>Barbie</h3>
                            <p>
                                Comedy • 96% Match
                            </p>
                        </div>
                    </div>
                </a>
                <a href="Konten.jsp">
                    <div class="movie-card">
                        <img src="https://upload.wikimedia.org/wikipedia/en/3/3c/Insidious_the_red_door.png">
                        <div class="movie-info">
                            <h3>Insidious</h3>
                            <p>
                                Horror • 92% Match
                            </p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </body>
</html>