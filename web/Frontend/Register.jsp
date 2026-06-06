<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>CineStream Register</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial, sans-serif;
        }

        body{
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;

            background:
            linear-gradient(rgba(0,0,0,0.55), rgba(0,0,0,0.55)),
            url('../Assets/BagroundLogin.jpg');

            background-size:cover;
            background-position:center;
            overflow:hidden;
        }

        .glow-left,
        .glow-right{
            position:absolute;
            width:450px;
            height:450px;
            border-radius:50%;
            filter:blur(25px);
            opacity:0.9;
        }

        .glow-left{
            left:-180px;
            background:radial-gradient(circle,#ffb3b3,#ffffff00 70%);
        }

        .glow-right{
            right:-180px;
            background:radial-gradient(circle,#9fc7ff,#ffffff00 70%);
        }

        .container{
            width:480px;
            padding:50px;
            border-radius:35px;

            background:rgba(20,24,45,0.72);
            backdrop-filter:blur(14px);

            box-shadow:0 0 40px rgba(0,0,0,0.45);

            color:white;
            position:relative;
            z-index:2;
        }

        .logo{
            text-align:center;
            margin-bottom:35px;
        }

        .logo h1{
            font-size:48px;
            color:#ff9d9d;
        }

        .logo p{
            letter-spacing:5px;
            font-size:11px;
            margin-top:10px;
            color:#cccccc;
        }

        .title{
            margin-bottom:35px;
        }

        .title h2{
            font-size:42px;
            margin-bottom:12px;
        }

        .title p{
            color:#cccccc;
            line-height:1.6;
        }

        .input-group{
            margin-bottom:28px;
        }

        .input-group label{
            display:block;
            margin-bottom:12px;
            color:#9fc7ff;
            font-size:13px;
            font-weight:bold;
            letter-spacing:1px;
        }

        .input-box{
            width:100%;
            height:60px;

            background:#171b31;

            border:none;
            border-radius:16px;

            padding:0 18px;

            color:white;
            font-size:16px;

            outline:none;
        }

        .register-btn{
            width:100%;
            height:62px;

            border:none;
            border-radius:35px;

            background:linear-gradient(to right,#ff9a9e,#ff5f6d);

            color:black;
            font-size:20px;
            font-weight:bold;

            cursor:pointer;

            margin-top:10px;
            margin-bottom:35px;

            transition:0.3s;
        }

        .register-btn:hover{
            transform:scale(1.02);
            opacity:0.95;
        }

        .login-link{
            text-align:center;
            color:#d7d7d7;
        }

        .login-link a{
            color:#9ec8ff;
            text-decoration:none;
            font-weight:bold;
        }

        .footer{
            text-align:center;
            margin-top:40px;
            color:#777;
            font-size:12px;
            letter-spacing:2px;
        }

    </style>

</head>

<body>

    <div class="glow-left"></div>
    <div class="glow-right"></div>

    <div class="container">

        <div class="logo">
            <h1>CineStream</h1>
        </div>

        <div class="title">
            <h2>Create account</h2>

            <p>
                Join our community of film enthusiasts
                and start your cinematic journey.
            </p>
        </div>

        <form action="Verification.jsp" method="get">

            <div class="input-group">
                <label>USERNAME</label>

                <input 
                    type="text"
                    class="input-box"
                    placeholder="Enter your username"
                    required
                >
            </div>

            <div class="input-group">
                <label>EMAIL ADDRESS</label>

                <input 
                    type="email"
                    class="input-box"
                    placeholder="Enter your email"
                    required
                >
            </div>

            <div class="input-group">
                <label>PASSWORD</label>

                <input 
                    type="password"
                    class="input-box"
                    placeholder="Enter your password"
                    required
                >
            </div>

            <button type="submit" class="register-btn">
                REGISTER
            </button>

        </form>

        <div class="login-link">
            Already have an account?
            <a href="Login.jsp">Login</a>
        </div>

        <div class="footer">
            © 2026 CINESTREAM KELOMPOK 8
        </div>

    </div>

</body>
</html>