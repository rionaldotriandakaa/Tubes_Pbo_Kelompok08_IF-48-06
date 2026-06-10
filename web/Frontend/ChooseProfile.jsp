<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="auth.ProfileDAO, auth.ProfileModel, java.util.List"%>
<%
    // Ambil ID User utama dari session login
    Integer userId = (Integer) session.getAttribute("user_id"); 
    if (userId == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    // Panggil DAO untuk mengambil daftar sub-profil dari database
    ProfileDAO pDAO = new ProfileDAO();
    List<ProfileModel> profiles = pDAO.getProfilesByUserId(userId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Who's Watching? - CineStream</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            background: #040816; color: white;
            height: 100vh; display: flex; justify-content: center; align-items: center;
            overflow: hidden;
        }
        .profile-container {
            text-align: center;
            max-width: 800px;
        }
        .profile-container h1 {
            font-size: 44px; font-weight: 600; letter-spacing: 1px; margin-bottom: 40px;
        }
        .profile-list {
            display: flex; gap: 35px; justify-content: center; align-items: flex-start; flex-wrap: wrap;
        }
        .profile-card {
            text-align: center; cursor: pointer; text-decoration: none; color: white; display: block;
        }
        .avatar-box {
            width: 130px; height: 130px; border-radius: 16px; object-fit: cover;
            border: 3px solid transparent; transition: 0.3s;
            background-color: #111827;
        }
        .profile-card:hover .avatar-box {
            border-color: #ff6f6f; transform: scale(1.08);
            box-shadow: 0 0 25px rgba(255, 111, 111, 0.5);
        }
        .profile-name {
            margin-top: 15px; font-size: 16px; color: #cfcfcf; transition: 0.3s;
        }
        .profile-card:hover .profile-name {
            color: white; font-weight: 500;
        }
        .add-btn-wrapper {
            text-align: center; text-decoration: none; display: block;
        }
        .add-btn {
            width: 130px; height: 130px; border-radius: 16px;
            background: rgba(255, 255, 255, 0.04); border: 2px dashed #444;
            display: flex; justify-content: center; align-items: center;
            font-size: 45px; color: #666; transition: 0.3s; cursor: pointer;
        }
        .add-btn-wrapper:hover .add-btn {
            border-color: #ff8c8c; color: white; background: rgba(255, 255, 255, 0.08);
        }
        .add-btn-wrapper:hover .profile-name {
            color: white;
        }
    </style>
</head>
<body>

    <div class="profile-container">
        <h1>Who's Watching?</h1>
        
        <div class="profile-list">
            <%-- 1. Looping list profil dari database --%>
            <% 
                if (profiles != null) {
                    for(ProfileModel p : profiles) { 
            %>
                        <a href="../SelectProfileServlet?id=<%= p.getProfileId() %>" class="profile-card">
                            <img src="../Assets/avatars/<%= p.getProfileAvatar() %>" class="avatar-box">
                            <div class="profile-name">
                                <%= p.getProfileName() %>
                                <% if(p.isKids()) { %>
                                    <span style="color:#ff6f6f; font-size:12px; display:block;">(Kids)</span>
                                <% } %>
                            </div>
                        </a>
            <% 
                    }
                } 
            %>

            <%-- 2. Tombol tambah profil baru, otomatis hilang jika kuota sudah pas 4 --%>
            <% if (profiles != null && profiles.size() < 4) { %>
                <a href="AddProfile.jsp" class="add-btn-wrapper">
                    <div class="add-btn">+</div>
                    <div class="profile-name" style="color: #666;">Add Profile</div>
                </a>
            <% } %>
        </div>
    </div>

</body>
</html>