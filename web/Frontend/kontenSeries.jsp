<%-- 
    Document   : kontenSeries
    Created on : 22 May 2026, 14.22.07
    Author     : ACER
--%>

<%@page import="java.sql.*"%>
<%@page import="config.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String title = "Series Tidak Ditemukan";
String poster = "";
String description = "Detail series tidak tersedia atau ID salah.";
String genre = "-";
String totalEpisode = "-";
String tahunRilis = "-";

String idParam = request.getParameter("id");

Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

if (idParam != null) {
    try {
        int idSeries = Integer.parseInt(idParam);
        conn = DatabaseConnection.getConnection();

        ps = conn.prepareStatement("SELECT * FROM series WHERE id = ?");
        ps.setInt(1, idSeries);
        rs = ps.executeQuery();

        if (rs.next()) {
            title = rs.getString("judul");
            poster = rs.getString("poster");
            description = rs.getString("deskripsi");
            genre = rs.getString("genre");
            totalEpisode = rs.getString("total_episode") + " Episodes";
            tahunRilis = rs.getString("tahun_rilis");
        }
    } catch (Exception e) {
        description = "Terjadi kesalahan sistem: " + e.getMessage();
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (ps != null) try { ps.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= title %> - CineStream</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
        body { background: #050816; color: white; overflow-x: hidden; }
        .hero { min-height: 100vh; display: flex; align-items: center; gap: 60px; padding: 120px 80px; background: linear-gradient(rgba(5,8,22,0.92), rgba(5,8,22,0.92)), url('/CineStream/Assets/Dasboard.jpg'); background-size: cover; background-position: center; }
        .back-btn{ display:inline-block; color:#bdbdbd; text-decoration:none; font-size:15px; font-weight:500; margin-bottom:20px; transition:.3s; }
        .back-btn:hover{ color:#ff9b9b; }
        .poster img { width: 340px; border-radius: 24px; box-shadow: 0 0 30px rgba(255, 155, 155, 0.2); object-fit: cover; }
        .poster-placeholder { width: 340px; height: 500px; background: #111424; border-radius: 24px; display: flex; align-items: center; justify-content: center; color: #555; font-weight: 500; }
        .hero-content { max-width: 700px; }
        .tag { display: inline-block; padding: 8px 18px; border-radius: 30px; background: #ff9b9b; color: black; font-weight: 700; margin-bottom: 20px; font-size: 12px; letter-spacing: 1px; }
        h1 { font-size: 64px; line-height: 74px; margin-bottom: 20px; }
        .meta { display: flex; gap: 20px; margin-bottom: 20px; color: #ddd; font-size: 15px; }
        .description { line-height: 32px; color: #cfcfcf; margin-bottom: 35px; font-size: 16px; }
        .btn { display: inline-block; padding: 16px 36px; border-radius: 35px; background: linear-gradient(90deg, #ff9b9b, #ff6b81); color: black; text-decoration: none; font-weight: 700; transition: 0.3s; box-shadow: 0 5px 20px rgba(255,107,129,0.3); }
        .btn:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(255,107,129,0.5); }
        .rating { display: flex; flex-direction: row-reverse; justify-content: flex-end; gap: 5px; margin-bottom: 25px; }
        .rating input { display: none; }
        .rating label { cursor: pointer; width: 24px; height: 24px; background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%23666" stroke-width="2"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>'); background-size: contain; background-repeat: no-repeat; transition: .2s; }
        .rating input:checked ~ label, .rating label:hover, .rating label:hover ~ label { background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%23ffd43b"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>'); }
        .comment-box { width: 100%; height: 110px; padding: 15px; border: none; border-radius: 15px; resize: none; margin-bottom: 15px; background: #111827; color: white; font-size: 14px; }
        .review-btn { padding: 14px 28px; border: none; border-radius: 30px; background: #ff9b9b; color: black; font-weight: 700; cursor: pointer; transition: .3s; }
        .favorite-btn { margin-top: 15px; padding: 14px 28px; border: none; border-radius: 30px; background: transparent; color: #ff9b9b; font-weight: 700; letter-spacing: 1px; border: 2px solid #ff9b9b; cursor: pointer; transition: .3s; display: inline-block; }
        .favorite-btn:hover { background: #ff9b9b; color: black; transform: translateY(-2px); }
        .review-section { padding: 60px 80px; }
        .review-title { font-size: 32px; margin-bottom: 25px; }
        .review-card { background: #111827; padding: 20px; border-radius: 15px; margin-bottom: 15px; }
        .review-user { color: #ff9b9b; font-weight: 600; margin-bottom: 10px; }
        .review-stars { color: #ffd43b; margin-bottom: 10px; }
        .review-text { color: #ddd; line-height: 28px; }
    </style>
</head>
<body>

    <section class="hero">
        <div class="poster">
            <% 
            if (poster != null && !poster.isEmpty()) { 
                String posterImg = poster;
                if (!posterImg.toLowerCase().startsWith("http://") && !posterImg.toLowerCase().startsWith("https://")) {
                    posterImg = request.getContextPath() + "/Assets/posters/" + posterImg;
                }
            %>
                <img src="<%= posterImg %>" alt="<%= title %>" loading="lazy">
            <% } else { %>
                <div class="poster-placeholder">No Poster</div>
            <% } %>
        </div>

        <div class="hero-content">
            <a href="<%= request.getContextPath() %>/series" class="back-btn">← Kembali</a>
            <div class="tag">SERIES</div>

            <h1><%= title %></h1>

            <div class="meta">
                <span><%= genre %></span>
                <span>•</span>
                <span><%= totalEpisode %></span>
                <span>•</span>
                <span><%= tahunRilis %></span>
            </div>

            <form action="/CineStream/rating" method="post">
                <input type="hidden" name="series_id" value="<%= idParam %>">
                <div class="rating">
                    <input type="radio" id="star5" name="nilai" value="5"><label for="star5"></label>
                    <input type="radio" id="star4" name="nilai" value="4"><label for="star4"></label>
                    <input type="radio" id="star3" name="nilai" value="3"><label for="star3"></label>
                    <input type="radio" id="star2" name="nilai" value="2"><label for="star2"></label>
                    <input type="radio" id="star1" name="nilai" value="1"><label for="star1"></label>
                </div>
                <textarea name="komentar" placeholder="Tulis komentarmu..." class="comment-box" required></textarea>
                <button type="submit" class="review-btn">Kirim Review</button>
            </form>

            <form action="/CineStream/FavoriteServlet" method="post" style="display: inline-block; margin-right: 10px;">
                <input type="hidden" name="seriesId" value="<%= idParam %>">
                <button type="submit" class="favorite-btn">ADD TO FAVORITES</button>
            </form>

            <form action="/CineStream/WatchlistServlet" method="post" style="display: inline-block;">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="itemId" value="<%= idParam %>">
                <input type="hidden" name="tipe" value="series">
                <button type="submit" class="favorite-btn">ADD TO WATCHLIST</button>
            </form>

            <p class="description" style="margin-top: 25px;"><%= description %></p>
            
            <a href="<%= request.getContextPath() %>/Frontend/Streaming.jsp?id=<%= idParam %>&tipe=series" class="btn">▶ WATCH NOW</a>
        </div>
    </section>

    <section class="review-section">
        <h2 class="review-title">Review Pengguna</h2>
        <%
        Connection connReview = null;
        PreparedStatement psReview = null;
        ResultSet rsReview = null;
        try {
            connReview = DatabaseConnection.getConnection();
            psReview = connReview.prepareStatement(
                "SELECT r.*, p.profile_name FROM rating r " +
                "JOIN profiles p ON r.profile_id = p.profile_id " +
                "WHERE r.series_id = ? ORDER BY r.id DESC"
            );
            psReview.setInt(1, Integer.parseInt(idParam));
            rsReview = psReview.executeQuery();
            boolean adaReview = false;

            while(rsReview.next()){
                adaReview = true;
                int nilaiReview = rsReview.getInt("nilai");
                String komentarReview = rsReview.getString("komentar");
        %>
            <div class="review-card">
                <div class="review-user"><%= rsReview.getString("profile_name") %></div>
                <div class="review-stars">
                    <% for(int i=1; i<=5; i++){ %>
                        <%= (i <= nilaiReview) ? "★" : "☆" %>
                    <% } %>
                </div>
                <div class="review-text"><%= komentarReview %></div>
            </div>
        <%
            }
            if(!adaReview){
        %>
            <div class="review-card"><div class="review-text">Belum ada review.</div></div>
        <%
            }
        } catch(Exception e){
            out.println(e.getMessage());
        } finally {
            if(rsReview != null) try { rsReview.close(); } catch (Exception e) {}
            if(psReview != null) try { psReview.close(); } catch (Exception e) {}
            if(connReview != null) try { connReview.close(); } catch (Exception e) {}
        }
        %>
    </section>
</body>
</html>