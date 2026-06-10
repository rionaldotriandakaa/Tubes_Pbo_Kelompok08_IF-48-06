```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CineStream Login</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        .error-message{
        width:100%;
        padding:12px;
        margin-bottom:20px;
        background:rgba(255,0,0,0.15);
        border:1px solid rgba(255,100,100,0.4);
        color:#ffb3b3;
        border-radius:12px;
        text-align:center;
        font-size:14px;
        
        }   
        
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins',sans-serif;
        }

        body{
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;

            background:
            linear-gradient(
            rgba(3,8,20,0.35),
            rgba(3,8,20,0.55)),
            url('../Assets/BagroundLogin.jpg');

            background-size:cover;
            background-position:center;
            background-repeat:no-repeat;

            overflow:hidden;
            color:white;
        }

        .container{
            position:relative;
            width:450px;
            padding:45px;

            border-radius:30px;

            background:rgba(255,255,255,0.08);

            border:1px solid rgba(255,255,255,0.08);

            backdrop-filter:blur(20px);

            box-shadow:0 8px 40px rgba(0,0,0,0.5);

            z-index:2;
        }

        .logo{
            position:absolute;
            top:-70px;
            left:50%;
            transform:translateX(-50%);
            text-align:center;
        }

        .logo h1{
            font-size:40px;
            color:#ff6f6f;
            font-weight:700;
        }

        .title{
            margin-top:20px;
            text-align:center;
        }

        .title h2{
            font-size:42px;
            margin-bottom:8px;
        }

        .title p{
            color:#cfcfcf;
            font-size:14px;
            margin-bottom:35px;
        }

        .input-group{
            margin-bottom:22px;
        }

        .input-group label{
            display:block;
            margin-bottom:10px;
            font-size:13px;
            letter-spacing:1px;
            color:#d9d9d9;
        }

        .input-box{
            width:100%;
            height:58px;

            border-radius:18px;

            background:rgba(0,0,0,0.35);

            border:1px solid rgba(255,255,255,0.05);

            padding:0 20px;

            color:white;
            font-size:15px;

            outline:none;

            transition:0.3s;
        }

        .input-box:focus{
            border:1px solid #ff8f8f;
            box-shadow:0 0 15px rgba(255,143,143,0.4);
        }

        .forgot{
            text-align:right;
            margin-top:-10px;
            margin-bottom:25px;
        }

        .forgot a{
            color:#ff9c9c;
            text-decoration:none;
            font-size:13px;
        }

        .login-btn{
            width:100%;
            height:60px;

            border:none;
            border-radius:20px;

            background:linear-gradient(90deg,#ff8c8c,#ff6f6f);

            color:#1b1b1b;

            font-size:18px;
            font-weight:700;

            cursor:pointer;

            transition:0.3s;

            box-shadow:0 0 25px rgba(255,111,111,0.5);
        }

        .login-btn:hover{
            transform:translateY(-2px);
            box-shadow:0 0 35px rgba(255,111,111,0.8);
        }

        .register{
            margin-top:30px;
            text-align:center;
            font-size:14px;
            color:#cfcfcf;
        }

        .register a{
            color:#ff9c9c;
            text-decoration:none;
            font-weight:600;
        }

        .footer{
            margin-top:30px;
            text-align:center;
            font-size:11px;
            color:#777;
            letter-spacing:2px;
        }

    </style>
</head>

<body>

    <div class="container">

        <div class="logo">
            <h1>CineStream</h1>
        </div>

        <div class="title">
            <h2>Welcome Back</h2>
            <p>Step back into the world of stories.</p>
        </div>
        <%
            String error = request.getParameter("error");

            if("wrong_password".equals(error)){
        %>

        <div class="error-message">
            Username atau password Anda salah.
        </div>

        <%
            } else if("user_not_found".equals(error)){
        %>

        <div class="error-message">
            Akun Anda belum terdaftar. Silakan lakukan registrasi terlebih dahulu.
        </div>

        <%
            }
        %>

        <!-- LOGIN FORM -->

        <form action="<%=request.getContextPath()%>/login" method="post">
            <div class="input-group">

                <label>USERNAME OR EMAIL</label>

                <input
                    type="text"
                    name="username"
                    class="input-box"
                    placeholder="Enter your email"
                    required>

            </div>

            <div class="input-group">

                <label>PASSWORD</label>

                <input
                    type="password"
                    name="password"
                    class="input-box"
                    placeholder="Enter your password"
                    required>

            </div>

            <div class="forgot">
                <a href="ChangePassword.jsp">
                    Forgot Password?
                </a>
            </div>

            <button type="submit" class="login-btn">
                Login
            </button>

            <div class="register">

                Don't have an account?

                <a href="Register.jsp">
                    Create an account
                </a>

            </div>

            <div class="footer">
                PRIVACY POLICY &nbsp;&nbsp;&nbsp; TERMS OF SERVICE
            </div>

        </form>

    </div>

</body>
</html>
```
