<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>CineStream - My List</title>

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

        /* HEADER */

        .header{
            padding-top:140px;
            padding-left:80px;
            padding-right:80px;
            margin-bottom:40px;
        }

        .header h1{
            font-size:50px;
            margin-bottom:10px;
        }

        .header p{
            color:#9ca3af;
        }

        /* MOVIE GRID */

        .movie-grid{
            padding:0 80px 60px;

            display:grid;
            grid-template-columns:repeat(auto-fill,minmax(240px,1fr));
            gap:30px;
        }

        .movie-card{
            background:#0b1024;
            border-radius:24px;
            overflow:hidden;
            transition:0.3s;
        }

        .movie-card:hover{
            transform:translateY(-8px);
        }

        .movie-card img{
            width:100%;
            height:340px;
            object-fit:cover;
        }

        .movie-info{
            padding:20px;
        }

        .movie-info h3{
            margin-bottom:10px;
            font-size:22px;
        }

        .movie-info p{
            color:#8d8d8d;
            font-size:14px;
            margin-bottom:20px;
            line-height:24px;
        }

        .btn-group{
            display:flex;
            gap:12px;
        }

        .watch-btn{
            flex:1;

            padding:14px;

            border:none;
            border-radius:14px;

            background:linear-gradient(90deg,#ff9b9b,#ff6b81);

            color:black;
            font-weight:700;

            cursor:pointer;
        }

        .remove-btn{
            flex:1;

            padding:14px;

            border:none;
            border-radius:14px;

            background:#1f2937;

            color:white;

            cursor:pointer;
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

            <a href="/CineStream/Frontend/Dashboard.jsp">
                HOME
            </a>

            <a href="/CineStream/Frontend/Search.jsp">
                MOVIES
            </a>

            <a href="/CineStream/Frontend/Player.jsp">
                SERIES
            </a>

            <a href="/CineStream/Frontend/recommendation.jsp">
                FAVORITES
            </a>

            <a href="/CineStream/Frontend/MyList.jsp">
                MY LIST
            </a>

        </div>

        <div class="right-nav">

            <div class="icon">
                🔍
            </div>

            <div class="icon">
                🔔
            </div>

            <a href="/CineStream/Frontend/Profile.jsp">

                <div class="profile"></div>

            </a>

        </div>

    </div>

    <!-- HEADER -->

    <div class="header">

        <h1>
            My List
        </h1>

        <p>
            Your saved movies and series collection.
        </p>

    </div>

    <!-- MOVIES -->

    <div class="movie-grid">

        <!-- MOVIE 1 -->

        <div class="movie-card">

            <img src="https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg">

            <div class="movie-info">

                <h3>
                    Avengers Endgame
                </h3>

                <p>
                    The Avengers assemble once more to restore balance to the universe.
                </p>

                <div class="btn-group">

                    <button class="watch-btn">
                        ▶ WATCH
                    </button>

                    <button class="remove-btn">
                        REMOVE
                    </button>

                </div>

            </div>

        </div>

        <!-- MOVIE 2 -->

        <div class="movie-card">

            <img src="https://upload.wikimedia.org/wikipedia/en/f/f9/TheBatmanPoster2022.jpg">

            <div class="movie-info">

                <h3>
                    The Batman
                </h3>

                <p>
                    Batman uncovers corruption in Gotham while chasing the Riddler.
                </p>

                <div class="btn-group">

                    <button class="watch-btn">
                        ▶ WATCH
                    </button>

                    <button class="remove-btn">
                        REMOVE
                    </button>

                </div>

            </div>

        </div>

        <!-- MOVIE 3 -->

        <div class="movie-card">

            <img src="https://upload.wikimedia.org/wikipedia/en/8/8a/Stranger_Things_season_3.jpg">

            <div class="movie-info">

                <h3>
                    Stranger Things
                </h3>

                <p>
                    A group of kids face supernatural dangers in Hawkins.
                </p>

                <div class="btn-group">

                    <button class="watch-btn">
                        ▶ WATCH
                    </button>

                    <button class="remove-btn">
                        REMOVE
                    </button>

                </div>

            </div>

        </div>

    </div>

</body>
</html>