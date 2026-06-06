<%-- 
    Document   : Movies
    Created on : 25 May 2026, 13.33.31
    Author     : ACER
--%>

<%@page import="java.util.List"%>
<%@page import="movie.Film"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <h1>Daftar Film</h1>
    <%
        List<Film> films =
            (List<Film>)request.getAttribute("films");
    %>

    <table border="1">

    <tr>
        <th>ID</th>
        <th>Judul</th>
        <th>Genre</th>
        <th>Durasi</th>
    </tr>

    <%
        if(films != null){

            for(Film film : films){
    %>

    <tr>
        <td><%= film.getIdFilm() %></td>
        <td><%= film.getJudul() %></td>
        <td><%= film.getGenre() %></td>
        <td><%= film.getDurasi() %> menit</td>
    </tr>

    <%
            }
        }
    %>

    </table>

    </body>
</html>
