
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <style>
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 25%;
    
        }
        body {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        }
        .signupForm {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 70vh;
        }
        .form {
        background-color: white;
        width: 500px;
        border-radius: 8px;
        padding: 20px 40px;
        box-shadow: 0 10px 25px rgba(92, 99, 105, .2);
        }
        .inputContainer {
        position: relative;
        height: 45px;
        width: 80%;
        margin-bottom: 17px;
        }
        .title {
        font-size: 50px;
        margin-bottom: 50px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .input {
        position: absolute;
        top: 0px;
        left: 110px;
        height: 100%;
        width: 100%;
        border: 1px solid #DADCE0;
        border-radius: 7px;
        font-size: 16px;
        padding: 0 20px;
        outline: none;
        background: none;
        z-index: 1;
        }
        .styling{
            font-family: 'Gill Sans', 'Gill Sans MT', 'Calibri', 'Trebuchet MS', sans-serif;
        }
        .submitBtn {
        display: block;
        margin-left: auto;
        padding: 15px 30px;
        border: none;
        background-color: purple;
        color: white;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        margin-top: 30px;
        }
        .submitBtn:hover {
        background-color: #9867C5;
        transform: translateY(-2px);
        }
    </style>
           <%
           response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");
           response.setHeader("Expires", "0");
           %>
    <body style="background-color: rgb(239, 247, 216);">
        <img id="image" src="Images/gpay_logo.png" width="20" height="160" alt="" class="center">
        <div class="signupForm">
            <form class="form" action="signup_details" method="post">
              <h1 class="title">Sign up</h1>
                
              <div class="inputContainer">
                <h5 class="styling">Name: </h5><input type="text" class="input" name="usr_name" autocomplete="off" required>
              </div>

              <div class="inputContainer">
                <h5 class="styling">Gmail: </h5><input type="email" class="input" pattern="[a-zA-Z0-9._%+-]+@gmail.com" name="usr_gmail" autocomplete="off" required>
              </div>
              
              <div class="inputContainer">
                <h5 class="styling">Phone_no: </h5><input type="text" class="input" pattern="[0-9]{10}" name="usr_phone" autocomplete="off" autocomplete="off" required>
              </div>
        
              <div class="inputContainer">
                <h5 class="styling">Pin(4 Digit): </h5><input type="text" class="input" pattern="[0-9]{4}" name="usr_pin" autocomplete="off" autocomplete="off" required>
              </div>
              <%

                        if(request.getAttribute("alert_msg")!=null){
                            out.println("<div class=\"inputContainer\">");
                            out.println("<h5 class=\"styling_db\">"+request.getAttribute("alert_msg")+"</h5>");
                            out.println("</div>");
                        }
                    %>
        
              <input type="submit" class="submitBtn" value="Sign up">
            </form>
          </div>
    </body>
</html>