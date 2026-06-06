<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="kategori.Series"%>

<%
List<Series> seriesList =
(List<Series>) request.getAttribute("series");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Series - CineStream</title>

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
}

.nav-links a:hover{
    color:#ff9b9b;
}

.right-nav{
    display:flex;
    gap:20px;
    margin-left:auto;
}

.profile{
    width:42px;
    height:42px;
    border-radius:50%;
    background-image:url('https://i.pravatar.cc/150?img=12');
    background-size:cover;
    border:2px solid #ff9b9b;
}

.container{
    width:90%;
    margin:auto;
    padding-top:120px;
}

h1{
    font-size:58px;
    margin-bottom:10px;
}

.subtitle{
    color:#ccc;
    margin-bottom:35px;
}

.series-grid{
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(250px,1fr));
    gap:20px;
}

.series-card{
    position:relative;
    overflow:hidden;
    border-radius:15px;
    transition:0.3s;
}

.series-card:hover{
    transform:scale(1.03);
}

.series-card img{
    width:100%;
    height:350px;
    object-fit:cover;
}

.series-info{
    position:absolute;
    bottom:0;
    width:100%;
    padding:15px;
    background:linear-gradient(
        transparent,
        rgba(0,0,0,0.9)
    );
}

.series-title{
    font-size:18px;
    font-weight:700;
}

.series-genre{
    color:#ff9b9b;
    margin-bottom:5px;
}

</style>

</head>

<body>

<div class="navbar">

<div class="logo">CineStream</div>

<div class="nav-links">
    <a href="/CineStream/Frontend/Dashboard.jsp">HOME</a>
    <a href="/CineStream/movies">MOVIES</a>
    <a href="/CineStream/series">SERIES</a>
    <a href="/CineStream/Frontend/Favorites.jsp">FAVORITES</a>
    <a href="/CineStream/Frontend/MyList.jsp">MY LIST</a>
</div>

<div class="right-nav">
    <a href="/CineStream/Frontend/Profile.jsp">
        <div class="profile"></div>
    </a>
</div>

</div>

<div class="container">

<h1>Series</h1>

<p class="subtitle">
Temukan serial terbaik yang tersedia di CineStream.
</p>

<div class="series-grid">

<%
if(seriesList != null && !seriesList.isEmpty()){

    for(Series s : seriesList){
%>

    <div class="series-card">

        <img src="<%= s.getPoster() %>"
             alt="<%= s.getJudul() %>">

        <div class="series-info">

            <div class="series-genre">
                <%= s.getGenre() %>
            </div>

            <div class="series-title">
                <%= s.getJudul() %>
            </div>

            <div class="series-detail">
                <%= s.getTotalEpisode() %> Episodes
            </div>

        </div>

    </div>

<%
    }

} else {
%>

    <p>Belum ada series di database.</p>

<%
}
%>

</div>
</div>

</body>
</html>
