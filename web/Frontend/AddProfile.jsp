<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CineStream - Add Profile</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

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

            background:
            linear-gradient(rgba(3,8,20,0.75),
            rgba(3,8,20,0.90)),
            url('../Assets/BagroundLogin.jpg');

            background-size:cover;
            background-position:center;
            color:white;
        }

        .container{
            width:500px;
            padding:45px;
            border-radius:30px;

            background:rgba(255,255,255,0.08);
            border:1px solid rgba(255,255,255,0.08);

            backdrop-filter:blur(15px);

            box-shadow:0 8px 40px rgba(0,0,0,0.5);
        }

        .title{
            text-align:center;
            margin-bottom:30px;
        }

        .title h2{
            font-size:38px;
            margin-bottom:10px;
        }

        .title p{
            color:#cccccc;
        }

        .input-group{
            margin-bottom:25px;
        }

        .input-group label{
            display:block;
            margin-bottom:10px;
            font-size:14px;
            color:#d9d9d9;
        }

        .input-box{
            width:100%;
            height:55px;

            border:none;
            outline:none;

            border-radius:15px;

            background:rgba(0,0,0,0.35);

            color:white;
            padding:0 20px;
        }

        .avatar-picker{
            display:flex;
            justify-content:center;
            gap:15px;
            margin-top:15px;
        }

        .avatar-option input{
            display:none;
        }

        .avatar-option img{
            width:80px;
            height:80px;
            border-radius:15px;
            cursor:pointer;

            border:3px solid transparent;
            transition:0.3s;
        }

        .avatar-option input:checked + img{
            border-color:#ff6f6f;
            box-shadow:0 0 20px rgba(255,111,111,.6);
        }

        .kids{
            margin:25px 0;
            display:flex;
            gap:10px;
            align-items:center;
        }

        .button-group{
            display:flex;
            gap:15px;
        }

        .btn{
            flex:1;
            height:55px;
            border:none;
            border-radius:18px;
            cursor:pointer;
            font-weight:600;
            text-decoration:none;

            display:flex;
            justify-content:center;
            align-items:center;
        }

        .cancel{
            background:#22283f;
            color:white;
        }

        .save{
            background:linear-gradient(90deg,#ff8c8c,#ff6f6f);
            color:black;
        }
    </style>
</head>
<body>

    <div class="container">

        <div class="title">
            <h2>Add Profile</h2>
            <p>Create a new profile for CineStream</p>
        </div>

        <form action="../AddProfileServlet" method="post">

            <div class="input-group">
                <label>PROFILE NAME</label>

                <input
                    type="text"
                    name="profileName"
                    class="input-box"
                    placeholder="Enter profile name"
                    required>
            </div>

            <div class="input-group">
                <label>CHOOSE AVATAR</label>

                <div class="avatar-picker">

                <label class="avatar-option">
                    <input type="radio" name="chosenAvatar" value="avatar1.png" checked>
                    <img src="../Assets/avatars/avatar1.png" alt="Avatar 1">
                </label>

                <label class="avatar-option">
                    <input type="radio" name="chosenAvatar" value="avatar2.png">
                    <img src="../Assets/avatars/avatar2.png" alt="Avatar 2">
                </label>

                <label class="avatar-option">
                    <input type="radio" name="chosenAvatar" value="avatar3.png">
                    <img src="../Assets/avatars/avatar3.png" alt="Avatar 3">
                </label>

                <label class="avatar-option">
                    <input type="radio" name="chosenAvatar" value="avatar4.png">
                    <img src="../Assets/avatars/avatar4.png" alt="Avatar 4">
                </label>

                </div>
            </div>

            <div class="kids">
                <input type="checkbox"
                    id="kids"
                    name="isKids"
                    value="true">

                <label for="kids">
                    This is a Kids Profile
                </label>
            </div>

            <div class="button-group">

                <a href="ChooseProfile.jsp" class="btn cancel">
                    Cancel
                </a>

                <button type="submit" class="btn save">
                    Save Profile
                </button>

            </div>

        </form>

    </div>

</body>
</html>