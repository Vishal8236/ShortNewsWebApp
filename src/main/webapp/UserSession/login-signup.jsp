<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login-Signup Page</title>
        <link rel="stylesheet" href="../Style/login-signup.css" />
        <link rel="stylesheet" href="../SharePage/global-css.css" />
        <%@include file="../SharePage/bootstrap_link.jsp" %>
        <script src="./login-signup.js"></script>
    </head>
    <body class="bg-login">
        <div class="mt-50 justify-content-center d-flex">
            <div class="d-flex shadow-login bg-white rounded-3 w-75">
                <div class="col-6 intro-login">
                    <div class="text-center text-white py-2">
                        <span class="h1">Welcome Back!</span>
                        <p class="mt-2">To Keep connected with us please <br> login with your personal info</p>
                        <div>
                            <button class="signup-btn" id="Signup-btn">SIGN UP</button>
                            <button class="signup-btn" id="login-btn">LOG IN</button>
                        </div>
                        <div class="">
                            <img src="../Images/loginicon.svg" height="300px" width="200px" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-6 px-4 py-2" id="login">
                    <%
                        if (request.getParameter("error") != null) {
                    %>
                    <div>
                       <div class="alert alert-danger d-flex align-items-center" role="alert">
                            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                            <div>
                                Email and password is not match <strong>Try again!</strong>
                            </div>
                      </div> 
                    </div>
                    <%
                        }
                    %>
                    <div class="text-center">
                        <span class="h1 text-green">Login</span>
                    </div>
                    <div class="mt-4">
                        <form action="./Login" method="POST">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input type="email" name="email" class="form-control " id="exampleInputEmail1" aria-describedby="emailHelp">
                                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Check me out</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
                <div id="Signup" class="col-6 py-2 px-4">
                    <div class="text-center text-green">
                        <span class="h1">Signup</span>
                    </div>
                    <div class="mt-4">
                        <form action="./Signup" method="POST">
                            <div class="mb-3">
                                <label for="exampleInputName" class="form-label">Name</label>
                                <input type="text" name="name" class="form-control " id="exampleInputName" aria-describedby="nameHelp">

                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input type="email" name="email" class="form-control " id="exampleInputEmail1"  aria-describedby="emailHelp">
                                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                <input type="password" name="password" class="form-control"  id="exampleInputPassword1">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Confirm Password</label>
                                <input type="password" name="c_password" class="form-control" id="exampleInputPassword1">
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                        <div class="mt-3">
                            <a href="">Already have an account? LOGIN</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
