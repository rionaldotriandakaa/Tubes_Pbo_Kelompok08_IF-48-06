<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>

    <title>CineStream - Change Password</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial,sans-serif;
        }

        body{
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;

            background:
            linear-gradient(rgba(0,0,0,0.7),
            rgba(0,0,0,0.7)),
            url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=1974');

            background-size:cover;
            background-position:center;
        }

        .card{

            width:420px;
            padding:40px;

            background:rgba(20,20,40,0.75);

            border-radius:30px;

            backdrop-filter:blur(10px);

            color:white;

            box-shadow:0 0 20px rgba(0,0,0,0.4);
        }

        h1{
            text-align:center;
            margin-bottom:10px;
        }

        p{
            text-align:center;
            color:#cccccc;
            margin-bottom:30px;
        }

        .input-box{
            margin-bottom:20px;
        }

        .input-box label{
            display:block;
            margin-bottom:8px;
            font-size:14px;
        }

        .input-box input{

            width:100%;
            padding:15px;

            border:none;
            outline:none;

            border-radius:15px;

            background:#111827;
            color:white;

            font-size:14px;
        }

        .input-box input::placeholder{
            color:#9ca3af;
        }

        .btn{

            width:100%;
            padding:15px;

            border:none;
            border-radius:20px;

            background:linear-gradient(to right,#ff9a9e,#ff6a88);

            font-size:18px;
            font-weight:bold;

            cursor:pointer;

            transition:0.3s;
        }

        .btn:hover{
            transform:scale(1.03);
            opacity:0.9;
        }

        .back{
            text-align:center;
            margin-top:20px;
        }

        .back a{
            color:#ff9a9e;
            text-decoration:none;
            font-size:14px;
        }

        .back a:hover{
            text-decoration:underline;
        }

    </style>

</head>

<body>

    <div class="card">

        <h1>Change Password</h1>

        <p>Secure your CineStream account</p>

        <form action="Profile.jsp">

            <div class="input-box">
                <label>Current Password</label>

                <input 
                    type="password"
                    name="currentPassword"
                    placeholder="Enter current password"
                    required>
            </div>

            <div class="input-box">
                <label>New Password</label>

                <input 
                    type="password"
                    name="newPassword"
                    placeholder="Enter new password"
                    required>
            </div>

            <div class="input-box">
                <label>Confirm Password</label>

                <input 
                    type="password"
                    name="confirmPassword"
                    placeholder="Confirm new password"
                    required>
            </div>

            <button type="submit" class="btn">
                Update Password
            </button>

        </form>

        <div class="back">
            <a href="Profile.jsp">Back to Profile</a>
        </div>

    </div>

</body>
</html>