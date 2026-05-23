<%-- 
    Document   : Favorites
    Created on : 23 May 2026, 10.39.59
    Author     : White
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Favorites</title>

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

    /* NAVBAR */

    .navbar{
        width:100%;
        height:85px;
        padding:0 60px;

        display:flex;
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

        position:absolute;
        left:50%;
        transform:translateX(-50%);
    }

    .nav-links a{
        color:#ddd;
        text-decoration:none;
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

        margin-left:auto;
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

    /* MAIN CONTENT */

    .container{
        width:90%;
        margin:auto;
        padding-top:120px;
    }

    h1{
        margin-top:20px;
        font-size:58px;
    }

    .subtitle{
        margin-top:10px;
        color:#cfcfcf;
        margin-bottom:35px;
    }

    /* HERO */

    .hero{
        display:flex;
        gap:20px;
        margin-bottom:40px;
    }

    .big-card{
        flex:2;
        height:320px;
        overflow:hidden;
        border-radius:20px;
        position:relative;
    }

    .big-card img{
        width:100%;
        height:100%;
        object-fit:cover;
        object-position:center 20%;
    }

    .overlay{
        position:absolute;
        bottom:0;
        width:100%;
        padding:30px;

        background:
        linear-gradient(
        transparent,
        rgba(0,0,0,.85)
        );
    }

    .overlay h2{
        font-size:45px;
    }

    .watch-btn{
        margin-top:15px;
        padding:12px 25px;

        border:none;
        border-radius:30px;

        background:#ff8fa3;
        color:black;

        font-weight:700;
        cursor:pointer;
    }

    .side-movies{
        flex:1;
    }

    .side-movies img{
        width:100%;
        height:320px;
        border-radius:20px;
        object-fit:cover;
    }

    /* MOVIES */

    .movie-grid{
        display:grid;
        grid-template-columns:repeat(4,1fr);
        gap:20px;
        margin-top:30px;
    }

    .movie{
        position:relative;
        overflow:hidden;
        border-radius:15px;
        cursor:pointer;
    }

    .movie img{
        width:100%;
        height:300px;
        object-fit:cover;
    }

    .movie-info{
        position:absolute;
        bottom:0;
        left:0;

        width:100%;
        padding:15px;

        background:
        linear-gradient(
        transparent,
        rgba(0,0,0,0.9)
        );
    }

    .movie-title{
        font-size:18px;
        font-weight:700;
    }

    .movie-rating{
        font-size:13px;
        color:#ff8fa3;
        margin-bottom:5px;
    }

    .movie-link{
        text-decoration:none;
        color:white;
        display:block;
    }

    .movie-link:hover{
        transform:scale(1.03);
        transition:0.3s;
    }

    /* RECOMMENDATION */

    .mini-grid{
        display:flex;
        gap:20px;
        overflow-x:auto;
        margin-top:20px;
    }

    .mini-grid::-webkit-scrollbar{
        display:none;
    }

    .mini-card{
        flex-shrink:0;
    }

    .mini-card img{
        width:110px;
        height:150px;
        border-radius:20px;
        object-fit:cover;
    }
    
    .recommend{
        margin-top:80px;
    }

    .recommend h3{
        margin-bottom:25px;
        font-size:20px;
    }

    .movie-grid{
        display:grid;
        grid-template-columns:repeat(4,1fr);
        gap:20px;
        margin-top:30px;
        margin-bottom:50px;
    }

</style>
</head>

<body>

<div class="navbar">

    <div class="logo">
        CineStream
    </div>

    <div class="nav-links">
        <a href="/CineStream/Frontend/Dashboard.jsp">HOME</a>
        <a href="#">MOVIES</a>
        <a href="#">SERIES</a>
        <a href="/CineStream/Frontend/Favorites.jsp">FAVORITES</a>
        <a href="/CineStream/Frontend/MyList.jsp">MY LIST</a>
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


<div class="container">

<h1>Your Favorites</h1>

<p class="subtitle">
Kelola film favorit dan serial pilihanmu disini.
</p>

<div class="hero">

<div class="big-card">

<img src="https://image.tmdb.org/t/p/w780/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg">

<div class="overlay">

<h2>INTERSTELLAR</h2>

<p>Through wormholes and distant galaxies</p>

<button class="watch-btn">
WATCH NOW
</button>

</div>

</div>

<div class="side-movies">

<img src="https://image.tmdb.org/t/p/w500/ykUEbfpkf8d0w49pHh0AD2KrT52.jpg">

</div>

</div>


<h2>Movies</h2>

<div class="movie-grid">

<a href="Konten.jsp?movie=Mulan" class="movie-link">

<div class="movie">

<img src="https://image.tmdb.org/t/p/w500/5TYgKxYhnhRNNwqnRAKHkgfqi2G.jpg">

<div class="movie-info">
<div class="movie-rating">⭐ 9.0</div>
<div class="movie-title">Mulan</div>
</div>

</div>

</a>



<a href="Konten.jsp?movie=Ash" class="movie-link">

<div class="movie">

<img src="https://image.tmdb.org/t/p/w500/p5ozvmdgsmbWe0H8Xk7Rc8SCwAB.jpg">

<div class="movie-info">
<div class="movie-rating">⭐ 7.8</div>
<div class="movie-title">Ash</div>
</div>

</div>

</a>



<a href="Konten.jsp?movie=Coco" class="movie-link">

<div class="movie">

<img src="https://image.tmdb.org/t/p/w500/8QVDXDiOGHRcAD4oM6MXjE0osSj.jpg">

<div class="movie-info">
<div class="movie-rating">⭐ 8.2</div>
<div class="movie-title">Coco</div>
</div>

</div>

</a>



<a href="Konten.jsp?movie=Zootopia" class="movie-link">

<div class="movie">

<img src="https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg">

<div class="movie-info">
<div class="movie-rating">⭐ 8.9</div>
<div class="movie-title">Zootopia</div>
</div>

</div>

</a>

</div>

<div class="recommend">

<h3>Because you liked "Interstellar"</h3>

<div class="mini-grid">

<div class="mini-card">

<img src="https://image.tmdb.org/t/p/w300/5BHuvQ6p9kfc091Z8RiFNhCwL4b.jpg">

<div class="mini-info">
<div class="mini-title">The Martian</div>
<div class="mini-detail">2015 • Movie</div>
</div>

</div>



<div class="mini-card">

<img src="https://image.tmdb.org/t/p/w300/9dKCd55IuTT5QRs989m9Qlb7d2B.jpg">

<div class="mini-info">
<div class="mini-title">Jungle Cruise</div>
<div class="mini-detail">2021 • Movie</div>
</div>

</div>



<div class="mini-card">

<img src="https://image.tmdb.org/t/p/w300/vH8YOW1Mh7ADyimwh4JPBf3FVrh.jpg">

<div class="mini-info">
<div class="mini-title">Wonder Woman</div>
<div class="mini-detail">2020 • Movie</div>
</div>

</div>



<div class="mini-card">

<img src="https://image.tmdb.org/t/p/w300/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg">

<div class="mini-info">
<div class="mini-title">Avatar</div>
<div class="mini-detail">2022 • Movie</div>
</div>

</div>

</div>

</div>

</div>

</body>
</html>