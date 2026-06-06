<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="kategori.Movies"%>

<%
List<Movies> films =
(List<Movies>) request.getAttribute("films");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Movies - CineStream</title>

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

.movie-grid{
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(250px,1fr));
    gap:20px;
}

.movie-link{
    text-decoration:none;
    color:white;
}

.movie{
    position:relative;
    overflow:hidden;
    border-radius:15px;
    transition:0.3s;
}

.movie:hover{
    transform:scale(1.03);
}

.movie img{
    width:100%;
    height:350px;
    object-fit:cover;
}

.movie-info{
    position:absolute;
    bottom:0;
    left:0;
    width:100%;
    padding:15px;
    background:linear-gradient(
        transparent,
        rgba(0,0,0,0.9)
    );
}

.movie-rating{
    font-size:13px;
    color:#ff8fa3;
    margin-bottom:5px;
}

.movie-title{
    font-size:18px;
    font-weight:700;
}

.empty{
    color:#ccc;
    font-size:18px;
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
        <a href="/CineStream/movies">MOVIES</a>
        <a href="/CineStream/series">SERIES</a>
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

<h1>Movies</h1>

<p class="subtitle">
    Temukan film terbaik yang tersedia di CineStream.
</p>

<div class="movie-grid">

<%
if(films != null && !films.isEmpty()){

    for(Movies film : films){
%>

    <a href="Konten.jsp?id=<%= film.getIdFilm() %>"
       class="movie-link">

        <div class="movie">

            <img src="<%= film.getThumbnail() %>"
                alt="<%= film.getJudul() %>">

            <div class="movie-info">

                <div class="movie-rating">
                    <%= film.getGenre() %>
                </div>

                <div class="movie-title">
                    <%= film.getJudul() %>
                </div>

                <div>
                    <%= film.getDurasi() %> menit
                </div>

            </div>

        </div>

        <%
            }
        } else {
        %>

        <p class="empty">
            Belum ada film di database.
        </p>

        <%
        }
        %>

</body>
</html>
