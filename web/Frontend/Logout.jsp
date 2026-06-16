<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // 1. Hancurkan seluruh session user di baris paling atas sebelum HTML di-render
    if (session != null) {
        session.invalidate();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CineStream - Logging Out...</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background:
                linear-gradient(
                rgba(3,8,20,0.35),
                rgba(3,8,20,0.55)),
                url('../Assets/BagroundLogin.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            overflow: hidden;
            color: white;
        }

        .logout-box {
            width: 100%;
            max-width: 400px;
            padding: 45px;
            border-radius: 30px;
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(20px);
            box-shadow: 0 8px 40px rgba(0, 0, 0, 0.5);
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }

        h1 {
            color: #ff6f6f;
            font-size: 36px;
            font-weight: 700;
        }

        p {
            color: #cfcfcf;
            font-size: 14px;
        }

        /* Deklarasi Animasi Berputar Murni */
        @keyframes putarMuter {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>

<body>

    <div class="logout-box">
        <h1>Logged Out</h1>
        <p id="loading-text">Redirecting to login page</p>
        
        <div style="
            width: 42px;
            height: 42px;
            border: 4px solid rgba(255, 255, 255, 0.1);
            border-top: 4px solid #ff6f6f;
            border-radius: 50%;
            margin-top: 15px;
            animation: putarMuter 0.8s linear infinite;
        "></div>
    </div>

    <script>
        // Animasi teks titik-titik berjalan (...) biar makin hidup
        var pText = document.getElementById("loading-text");
        var dots = 0;
        setInterval(function() {
            dots = (dots + 1) % 4;
            pText.innerHTML = "Redirecting to login page" + ".".repeat(dots);
        }, 400);

        // Pengalihan halaman
        setTimeout(function() {
            window.location.href = "Login.jsp";
        }, 2500);
    </script>

</body>
</html>