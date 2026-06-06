<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logging Out...</title>

    <style>

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

            background:#0d1117;
            color:white;
        }

        .logout-box{
            text-align:center;
        }

        h1{
            color:#ff8c8c;
            margin-bottom:15px;
        }

        p{
            color:#bdbdbd;
        }

    </style>

    <meta http-equiv="refresh" content="2;url=Login.jsp">

</head>

<body>

    <%
        session.invalidate();
    %>

    <div class="logout-box">

        <h1>Logged Out</h1>

        <p>
            Redirecting to login page...
        </p>

    </div>

</body>
</html>