<%-- 
    Document   : recommendation
    Created on : 20 May 2026, 17.51.10
    Author     : White
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Recommendation</title>

    <style>

        body{
            background-color:#0f1117;
            color:white;
            font-family:Arial;
            margin:0;
        }

        .navbar{
            display:flex;
            justify-content:space-between;
            padding:20px 40px;
            background:#151924;
        }

        .logo{
            font-size:24px;
            font-weight:bold;
            color:#00bfff;
        }

        .section{
            padding:30px 40px;
        }

        .movie-container{
            display:flex;
            gap:20px;
            flex-wrap:wrap;
        }

        .movie-card{
            width:180px;
            background:#1c2230;
            border-radius:10px;
            overflow:hidden;
        }

        .movie-card img{
            width:100%;
            height:250px;
            object-fit:cover;
        }

        .movie-info{
            padding:10px;
        }

        .movie-title{
            font-weight:bold;
        }

    </style>
</head>

<body>

    <div class="navbar">
        <div class="logo">CineStream</div>

        <div>
            Home |
            Movies |
            Series |
            Recommendation
        </div>
    </div>

    <div class="section">

        <h1>Recommended For You</h1>

        <div class="movie-container">

            <div class="movie-card">
                <img src="https://picsum.photos/200/300?1">

                <div class="movie-info">
                    <div class="movie-title">Avengers</div>
                    <div>Action</div>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://picsum.photos/200/300?2">

                <div class="movie-info">
                    <div class="movie-title">John Wick</div>
                    <div>Action</div>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://picsum.photos/200/300?3">

                <div class="movie-info">
                    <div class="movie-title">Frozen</div>
                    <div>Animation</div>
                </div>
            </div>

        </div>

    </div>

</body>
</html>
