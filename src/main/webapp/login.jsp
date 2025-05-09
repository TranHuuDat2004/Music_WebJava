<%@ page import="java.sql.*, musicart.com.musicart.connectDB" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Modern Music</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="css/style.css">

</head>

<body>`
<!-- Preloader -->
<div class="preloader d-flex align-items-center justify-content-center">
    <div class="lds-ellipsis">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>

    <!-- ##### Header Area Start ##### -->
    <%@ include file="header.jsp" %>

<!-- ##### Breadcumb Area Start ##### -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
    <div class="bradcumbContent">
        <p>See what's new</p>
        <h2>Login</h2>
    </div>
</section>
<!-- ##### Breadcumb Area End ##### -->

<!-- ##### Login Area Start ##### -->
<section class="login-area section-padding-100">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">
                <div class="login-content">
                    <h3>Welcome Back</h3>
                    <!-- Login Form -->
                    <div class="login-form">
                        <form action="login_java.jsp" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Username</label>
                                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter username" name="username">
                                <small id="emailHelp" class="form-text text-muted"><i class="fa fa-lock mr-2"></i>We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <div class="password-input-group">
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
                                    <span class="password-toggle-icon" onclick="togglePasswordVisibility(this)">
                                            <i class="fa fa-eye-slash" aria-hidden="true"></i>
                                        </span>
                                </div>
                            </div>

                            <!-- <div class="form-group">
                                <label for="role">Select Role:</label><br>
                                <input type="radio" id="user" name="role" value="user" checked>
                                <label for="user">User</label><br>
                                <input type="radio" id="admin" name="role" value="admin">
                                <label for="admin">Admin</label><br>
                            </div> -->
                            <div class="form-group form-check"></div>
                            <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                            <label class="form-check-label" for="rememberMe">Remember Me</label>
                    </div>
                    <button type="submit" class="btn oneMusic-btn mt-30">Login</button>
                    </form>
                    <p class="mt-30">Don't have an account? <a href="register.jsp">Register here</a></p>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<!-- ##### Login Area End ##### -->

<script>
    function togglePasswordVisibility(icon) {
        var passwordInput = icon.previousElementSibling;
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            icon.innerHTML = '<i class="fa fa-eye" aria-hidden="true"></i>';
        } else {
            passwordInput.type = "password";
            icon.innerHTML = '<i class="fa fa-eye-slash" aria-hidden="true"></i>';
        }
    }
</script>



<!-- ##### Footer Area Start ##### -->
<footer class="footer-area">
    <div class="container">
        <div class="row d-flex flex-wrap align-items-center">
            <div class="col-12 col-md-6">
                <p class="copywrite-text">
                    <a href="#">Copyright &copy;2024 All rights reserved</a>
                </p>
            </div>
        </div>
    </div>
</footer>
<!-- ##### Footer Area Start ##### -->

<!-- ##### All Javascript Script ##### -->
<!-- jQuery-2.2.4 js -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/bootstrap/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="js/plugins/plugins.js"></script>
<!-- Active js -->
<script src="js/active.js"></script>
</body>

</html>
