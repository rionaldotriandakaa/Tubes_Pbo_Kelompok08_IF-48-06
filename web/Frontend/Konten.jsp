<%-- 
    Document   : Konten
    Created on : 22 May 2026, 14.22.07
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Backend.model.Konten"%>
<%@page import="Backend.model.Film"%>
<%@page import="Backend.model.Series"%>
<%@page import="Backend.model.Episode"%>

<%@page import="java.util.ArrayList"%>

<%
    Konten konten =
        (Konten) request.getAttribute("konten");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>CineStream - Konten</title>

    <!-- Bootstrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Google Font -->
    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">

    <!-- Bootstrap Icon -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins',sans-serif;
        }

        body{
            background:#0b0f1a;
            color:white;
            overflow-x:hidden;
        }

        a{
            text-decoration:none;
        }

        /* NAVBAR */

        .navbar-custom{
            background:rgba(0,0,0,0.45);
            backdrop-filter:blur(12px);
            border-bottom:1px solid rgba(255,255,255,0.08);
            padding:15px 0;
        }

        .logo{
            font-size:28px;
            font-weight:700;
            color:#ff0055;
        }

        .nav-link{
            color:white !important;
            margin-left:20px;
            transition:0.3s;
        }

        .nav-link:hover{
            color:#ff0055 !important;
        }

        /* HERO */

        .hero-section{
            min-height:100vh;
            padding-top:120px;
            padding-bottom:80px;

            background:
                linear-gradient(
                rgba(0,0,0,0.75),
                rgba(0,0,0,0.95)
                ),
                url("../images/bg.jpg");

            background-size:cover;
            background-position:center;
        }

        .poster-img{
            width:100%;
            border-radius:25px;
            box-shadow:0 0 35px rgba(255,0,90,0.25);
        }

        .content-title{
            font-size:64px;
            font-weight:700;
            margin-bottom:20px;
        }

        .content-info{
            display:flex;
            flex-wrap:wrap;
            gap:12px;
            margin-bottom:20px;
        }

        .badge-custom{
            background:rgba(255,255,255,0.08);
            border:1px solid rgba(255,255,255,0.08);
            padding:10px 18px;
            border-radius:30px;
            font-size:14px;
        }

        .content-desc{
            color:#c7c7c7;
            line-height:1.9;
            margin-bottom:35px;
        }

        /* BUTTON */

        .btn-play{

            background:#ff0055;
            color:white;
            border:none;

            padding:14px 35px;
            border-radius:50px;

            font-weight:600;
            margin-right:15px;

            transition:0.3s;
        }

        .btn-play:hover{
            background:#ff336f;
            transform:scale(1.05);
        }

        .btn-list{

            background:rgba(255,255,255,0.08);
            color:white;

            border:none;
            padding:14px 30px;

            border-radius:50px;

            font-weight:500;
            transition:0.3s;
        }

        .btn-list:hover{
            background:rgba(255,255,255,0.15);
        }

        /* EPISODE */

        .episode-section{
            padding:70px 0;
        }

        .section-title{
            font-size:32px;
            font-weight:700;
            margin-bottom:35px;
        }

        .episode-card{

            background:rgba(255,255,255,0.04);

            border-radius:20px;
            padding:20px;

            margin-bottom:20px;

            transition:0.3s;
            border:1px solid rgba(255,255,255,0.05);
        }

        .episode-card:hover{

            transform:translateY(-5px);

            background:rgba(255,255,255,0.07);
        }

        .episode-title{
            font-size:20px;
            font-weight:600;
        }

        .episode-duration{
            color:#aaaaaa;
            margin-top:5px;
        }

        /* RELATED */

        .related-section{
            padding-bottom:80px;
        }

        .related-card{

            background:#141b2d;

            border-radius:20px;
            overflow:hidden;

            transition:0.3s;
        }

        .related-card:hover{
            transform:scale(1.04);
        }

        .related-img{
            width:100%;
            height:300px;
            object-fit:cover;
        }

        .related-content{
            padding:18px;
        }

        .related-title{
            font-size:18px;
            font-weight:600;
        }

        .related-genre{
            color:#aaaaaa;
            font-size:14px;
        }

        /* COMMENT */

        .comment-section{
            padding-bottom:80px;
        }

        .comment-box{

            background:rgba(255,255,255,0.04);

            border-radius:20px;
            padding:25px;

            margin-bottom:20px;
        }

        .comment-user{
            font-weight:600;
            margin-bottom:10px;
        }

        .comment-rating{
            color:#ffd700;
            margin-bottom:10px;
        }

        .comment-text{
            color:#c7c7c7;
            line-height:1.8;
        }

        /* FOOTER */

        .footer{
            text-align:center;
            padding:30px;
            color:#888;
            border-top:1px solid rgba(255,255,255,0.08);
        }

    </style>

</head>

<body>

    <!-- NAVBAR -->

    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">

        <div class="container">

            <a class="navbar-brand logo"
               href="Dashboard.jsp">

                CineStream

            </a>

            <button class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarNav">

                <span class="navbar-toggler-icon"></span>

            </button>

            <div class="collapse navbar-collapse"
                 id="navbarNav">

                <ul class="navbar-nav ms-auto">

                    <li class="nav-item">
                        <a class="nav-link"
                           href="Dashboard.jsp">

                            Beranda

                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link"
                           href="Search.jsp">

                            Search

                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link"
                           href="MyList.jsp">

                            My List

                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link"
                           href="Profile.jsp">

                            Profile

                        </a>
                    </li>

                </ul>

            </div>

        </div>

    </nav>

</body>

</html>