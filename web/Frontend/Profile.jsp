<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>CineStream Profile</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial, Helvetica, sans-serif;
        }

        body{
            min-height:100vh;

            background:
            linear-gradient(rgba(0,0,0,0.78), rgba(0,0,0,0.88)),
            url('https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=2070&auto=format&fit=crop');

            background-size:cover;
            background-position:center;

            color:white;
        }

        /* NAVBAR */

        .navbar{
            width:100%;
            height:80px;

            display:flex;
            justify-content:space-between;
            align-items:center;

            padding:0 60px;

            background:rgba(0,0,0,0.35);
            backdrop-filter:blur(12px);

            position:fixed;
            top:0;
            z-index:100;
        }

        .logo{
            font-size:32px;
            font-weight:bold;
            color:#ff9c9c;
        }

        .nav-links{
            display:flex;
            gap:25px;
            align-items:center;
        }

        .nav-links a{
            color:#d8d8d8;
            text-decoration:none;
            transition:0.3s;
            font-size:16px;
        }

        .nav-links a:hover{
            color:#ff9c9c;
        }

        /* PROFILE */

        .profile-wrapper{
            width:100%;
            min-height:100vh;

            display:flex;
            justify-content:center;
            align-items:center;

            padding-top:100px;
        }

        .profile-container{
            width:430px;

            background:rgba(20,20,35,0.90);
            backdrop-filter:blur(15px);

            border-radius:35px;

            padding:40px;

            box-shadow:0 0 40px rgba(255,120,120,0.2);

            text-align:center;
        }

        .profile-image{
            width:130px;
            height:130px;

            border-radius:50%;
            object-fit:cover;

            border:4px solid #ff8c8c;

            margin-bottom:25px;
        }

        .username{
            font-size:32px;
            font-weight:bold;
            margin-bottom:10px;
        }

        .email{
            color:#bcbcbc;
            margin-bottom:35px;
        }

        .info-box{
            background:rgba(255,255,255,0.05);

            padding:18px;
            border-radius:18px;

            margin-bottom:18px;

            text-align:left;
        }

        .info-box h4{
            color:#ff9c9c;
            margin-bottom:8px;
            font-size:14px;
        }

        .info-box p{
            font-size:16px;
        }

        /* BUTTON */

        .button-group{
            display:flex;
            gap:15px;
            margin-top:30px;
        }

        .btn{
            flex:1;

            padding:15px;

            border:none;
            border-radius:35px;

            text-decoration:none;

            display:flex;
            justify-content:center;
            align-items:center;

            font-weight:bold;

            transition:0.3s;
        }

        .dashboard-btn{
            background:linear-gradient(90deg,#ff8c8c,#ff5f6d);
            color:black;
        }

        .password-btn{
            background:#262d4d;
            color:white;
            border:1px solid rgba(255,255,255,0.08);
        }

        .logout-btn{
            background:#1b1f34;
            color:white;
            border:1px solid rgba(255,255,255,0.08);
        }

        .btn:hover{
            transform:translateY(-3px);
        }

        .footer{
            margin-top:30px;
            font-size:12px;
            color:#8e8e8e;
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
            <a href="Dasboard.jsp">Home</a>
            <a href="#">Movies</a>
            <a href="#">Series</a>
            <a href="#">Favorites</a>
            <a href="Profile.jsp">Profile</a>
        </div>

    </div>

    <!-- PROFILE -->

    <div class="profile-wrapper">

        <div class="profile-container">

            <img
                class="profile-image"
                src="https://randomuser.me/api/portraits/men/32.jpg"
                alt="Profile"
            >

            <div class="username">
                Viozkyyy
            </div>

            <div class="email">
                viozkyyy@gmail.com
            </div>

            <div class="info-box">
                <h4>Favorite Genre</h4>
                <p>Action • Horror • Sci-Fi</p>
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

                <a href="Dasboard.jsp"
                   class="btn dashboard-btn">

                    Dashboard

                </a>

                <a href="ChangePassword.jsp"
                   class="btn password-btn">

                    Change Password

                </a>

            </div>

            <div class="button-group">

                <a href="Logout.jsp"
                   class="btn logout-btn">

                    Logout

                </a>

            </div>

            <div class="footer">
                © 2026 CineStream • Kelompok 8
            </div>

        </div>

    </div>

</body>
</html>