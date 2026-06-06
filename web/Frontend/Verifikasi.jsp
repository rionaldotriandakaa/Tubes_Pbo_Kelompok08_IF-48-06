<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CineStream Verification</title>

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
            linear-gradient(
            rgba(3,8,20,0.30),
            rgba(3,8,20,0.55)),
            url('../Assets/BagroundLogin.jpg');

            background-size:cover;
            background-position:center;
            background-repeat:no-repeat;

            color:white;
            overflow:hidden;
        }

        .container{
            text-align:center;
        }

        .logo{
            margin-bottom:25px;
        }

        .logo h1{
            color:#ff8f8f;
            font-size:42px;
            font-weight:700;
        }

        .logo-line{
            width:45px;
            height:4px;
            background:#ff8f8f;
            border-radius:10px;
            margin:8px auto;
        }

        .card{

            width:500px;
            padding:45px;

            border-radius:35px;

            background:rgba(255,255,255,0.08);

            border:1px solid rgba(255,255,255,0.08);

            backdrop-filter:blur(20px);

            box-shadow:0 15px 50px rgba(0,0,0,0.4);
        }

        .card h2{
            font-size:28px;
            margin-bottom:12px;
        }

        .card p{
            color:#d0d0d0;
            font-size:14px;
            line-height:25px;
        }

        .email{
            color:#9ccfff;
            font-weight:500;
        }

        .otp-container{
            display:flex;
            justify-content:center;
            gap:12px;

            margin:35px 0;
        }

        .otp-input{

            width:55px;
            height:60px;

            border:none;
            outline:none;

            border-radius:18px;

            background:rgba(0,0,0,0.35);

            color:white;

            text-align:center;
            font-size:24px;
            font-weight:600;

            transition:0.3s;
        }

        .otp-input:focus{
            border:1px solid #ff8f8f;
            box-shadow:0 0 15px rgba(255,143,143,0.5);
        }

        .verify-btn{

            width:100%;
            height:58px;

            border:none;
            border-radius:18px;

            cursor:pointer;

            font-size:16px;
            font-weight:700;

            color:#1b1b1b;

            background:
            linear-gradient(
            90deg,
            #ffb0b0,
            #ff6f6f);

            box-shadow:
            0 0 25px rgba(255,111,111,0.5);

            transition:0.3s;
        }

        .verify-btn:hover{
            transform:translateY(-2px);

            box-shadow:
            0 0 35px rgba(255,111,111,0.7);
        }

        .resend{
            margin-top:25px;
        }

        .resend p{
            color:#8d8d8d;
            font-size:11px;
            letter-spacing:1px;
            margin-bottom:8px;
        }

        .resend a{
            color:#8fc7ff;
            text-decoration:none;
            font-size:14px;
            font-weight:500;
        }

        .footer{

            margin-top:30px;

            display:flex;
            justify-content:center;
            gap:25px;

            color:#8a8a8a;
            font-size:11px;
        }

    </style>
</head>

<body>

    <div class="container">

        <div class="logo">
            <h1>CineStream</h1>
            <div class="logo-line"></div>
        </div>

        <div class="card">

            <h2>Verify Your Account</h2>

            <p>
                We've sent a 6-digit verification code to
                <br>
                <span class="email">
                    user@gmail.com
                </span>
            </p>

            <form action="Dashboard.jsp" method="post">

                <div class="otp-container">

                    <input type="text" maxlength="1" class="otp-input" required>
                    <input type="text" maxlength="1" class="otp-input" required>
                    <input type="text" maxlength="1" class="otp-input" required>
                    <input type="text" maxlength="1" class="otp-input" required>
                    <input type="text" maxlength="1" class="otp-input" required>
                    <input type="text" maxlength="1" class="otp-input" required>

                </div>

                <button type="submit" class="verify-btn">
                    Verify →
                </button>

            </form>

            <div class="resend">

                <p>DIDN'T RECEIVE THE CODE?</p>

                <a href="#">
                    Resend code ↻
                </a>

            </div>

            <div class="footer">

                <span>END-TO-END ENCRYPTED</span>
                <span>HELP CENTER</span>
                <span>TERMS</span>

            </div>

        </div>

    </div>

    <script>

        const inputs = document.querySelectorAll('.otp-input');

        inputs.forEach((input,index)=>{

            input.addEventListener('input',()=>{

                if(input.value.length === 1 &&
                   index < inputs.length - 1){

                    inputs[index + 1].focus();
                }

            });

            input.addEventListener('keydown',(e)=>{

                if(e.key === 'Backspace' &&
                   input.value === '' &&
                   index > 0){

                    inputs[index - 1].focus();
                }

            });

        });

    </script>

</body>
</html>