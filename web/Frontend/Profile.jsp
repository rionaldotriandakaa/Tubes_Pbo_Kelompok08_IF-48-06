<%-- 
    Document   : Profile
    Created on : 22 May 2026, 14.22.07
    Author     : ACER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CineStream Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            background:
                linear-gradient(
                rgba(3,8,20,0.35),
                rgba(3,8,20,0.55)),
                url('../Assets/BagroundLogin.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
            overflow-x: hidden;
        }

        /* NAVBAR STYLING */
        .navbar {
            width: 100%;
            height: 85px;
            padding: 0 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            z-index: 1000;
            background: rgba(0,0,0,0.35);
            backdrop-filter: blur(14px);
        }

        .logo {
            font-size: 32px;
            font-weight: 700;
            color: #ff9b9b;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 35px;
        }

        .nav-links a {
            color: #ddd;
            font-size: 14px;
            text-decoration: none;
            transition: 0.3s;
            font-weight: 500;
        }

        .nav-links a:hover, .nav-links a.active {
            color: #ff9b9b;
        }

        /* PROFILE LAYOUT */
        .profile-wrapper {
            width: 100%;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 140px 20px 60px;
        }

        .profile-container {
            width: 100%;
            max-width: 450px;
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(20px);
            border-radius: 30px;
            padding: 40px;
            box-shadow: 0 8px 40px rgba(0,0,0,0.5);
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.08);
        }

        .profile-image {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #ff9b9b;
            margin-bottom: 25px;
            box-shadow: 0 0 25px rgba(255, 155, 155, 0.3);
        }

        .username {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 5px;
            color: white;
        }

        .email {
            color: #9ca3af;
            margin-bottom: 35px;
            font-size: 15px;
        }

        .info-box {
            background: rgba(0, 0, 0, 0.35);
            padding: 18px 22px;
            border-radius: 18px;
            margin-bottom: 15px;
            text-align: left;
            border: 1px solid rgba(255, 255, 255, 0.05);
        }

        .info-box h4 {
            color: #ff9b9b;
            margin-bottom: 6px;
            font-size: 13px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .info-box p {
            font-size: 16px;
            color: #e5e7eb;
            font-weight: 500;
        }

        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 15px;
        }

        .btn {
            parent-context: box;
            flex: 1;
            padding: 15px;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: 700;
            font-size: 14px;
            transition: 0.3s;
            cursor: pointer;
        }

        .dashboard-btn {
            background: linear-gradient(90deg, #ff8c8c, #ff6f6f);
            color: #1b1b1b;
            box-shadow: 0 0 25px rgba(255,111,111,0.5);
        }

        .password-btn {
            background: #1f2937;
            color: white;
        }

        .logout-btn {
            background: #111827;
            color: #ef4444;
            border: 1px solid rgba(239, 68, 68, 0.2);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 255, 255, 0.05);
        }
        
        .dashboard-btn:hover {
            box-shadow: 0 0 35px rgba(255,111,111,0.8);
        }

        .footer {
            margin-top: 35px;
            font-size: 12px;
            color: #6b7280;
            letter-spacing: 0.5px;
        }
    </style>
</head>
<body>

<%
    // 1. Mengambil data attribute profile dari objek session login aktif
    String profileName = (String) session.getAttribute("activeProfileName");
    String profileAvatar = (String) session.getAttribute("activeProfileAvatar");
    String email = (String) session.getAttribute("email");
    String genre = (String) session.getAttribute("genre");

    // Fallback handler jika data session null
    if (profileName == null) {
        profileName = "No Profile";
    }
    if (email == null) {
        email = "-";
    }
    if (genre == null) {
        genre = "-";
    }

    // 2. Sinkronisasi rute path gambar agar tidak broken link
    String imageSrc;
    if (profileAvatar != null && !profileAvatar.trim().isEmpty()) {
        imageSrc = request.getContextPath() + "/Assets/avatars/" + profileAvatar;
    } else {
        imageSrc = request.getContextPath() + "/Assets/avatars/avatar1.png";
    }
%>

    <div class="navbar">
        <a href="<%= request.getContextPath() %>/Frontend/Dashboard.jsp" class="logo">CineStream</a>
        <div class="nav-links">
            <a href="<%= request.getContextPath() %>/Frontend/Dashboard.jsp">HOME</a>
            <a href="<%= request.getContextPath() %>/movies">MOVIES</a>
            <a href="<%= request.getContextPath() %>/series">SERIES</a>
            <a href="<%= request.getContextPath() %>/Frontend/Favorites.jsp">FAVORITES</a>
            <a href="<%= request.getContextPath() %>/Frontend/MyList.jsp">MY LIST</a>
            <a href="<%= request.getContextPath() %>/Frontend/Profile.jsp" class="active">PROFILE</a>
        </div>
    </div>

    <div class="profile-wrapper">
        <div class="profile-container">
            <img src="<%= imageSrc %>" class="profile-image" alt="Profile Avatar">

            <div class="username"><%= profileName %></div>
            <div class="email"><%= email %></div>

            <div class="info-box">
                <h4>Favorite Genre</h4>
                <p><%= genre %></p>
            </div>

            <div class="info-box">
                <h4>Membership</h4>
                <p>Premium User</p>
            </div>

            <div class="info-box">
                <h4>Watching Since</h4>
                <p>2026</p>
            </div>

            <div class="button-group">
                <a href="<%= request.getContextPath() %>/Frontend/Dashboard.jsp" class="btn dashboard-btn">
                    Dashboard
                </a>
                <a href="<%= request.getContextPath() %>/Frontend/ChangePassword.jsp" class="btn password-btn">
                    Change Password
                </a>
            </div>

            <div class="button-group">
                <a href="<%= request.getContextPath() %>/Frontend/ChooseProfile.jsp" class="btn password-btn">
                    Switch Profile
                </a>
                <a href="<%= request.getContextPath() %>/LogoutServlet" class="btn logout-btn">
                    Logout
                </a>
            </div>

            <div class="footer">
                © 2026 CineStream • Kelompok 8 • IF-48-06
            </div>
        </div>
    </div>

</body>
</html>