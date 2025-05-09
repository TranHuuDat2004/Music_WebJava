


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

<body>
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
            <h2>Register</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->    

    <!-- ##### Register Area Start ##### -->
    <section class="register-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="register-content">
                        <h3>Create Account</h3>
                        <!-- Register Form -->
                        <div class="register-form">
                            <form action="signup.jsp" method="post">
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter E-mail">
                                    <small id="emailHelp" class="form-text text-muted"><i class="fa fa-lock mr-2"></i>We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                    <label for="confirm_password">Confirm Password</label>
                                    <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Confirm Password" required>
                                </div>
                                <div class="form-group">
                                    <label for="role">Select Role:</label><br>
                                    <input type="radio" id="user" name="role" value="user" checked>
                                    <label for="user">User</label><br>
                                    <input type="radio" id="admin" name="role" value="admin">
                                    <label for="admin">Admin</label><br>
                                </div>
                                <button type="submit" class="btn oneMusic-btn mt-30">Register</button>
                            </form>
                            <p class="mt-30">Already have an account? <a href="login.jsp">Login</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Register Area End ##### -->

        <!-- ##### Footer Area Start ##### -->
        <footer class="footer-area">

            <div style="text-align: center; background-color: #000;">
                <img src="icons/icon-pay-01.png" alt="Payment Methods" style="margin-top: 10px;">
                <img src="icons/icon-pay-02.png" alt="Payment Methods" style="margin-top: 10px;">
                <img src="icons/icon-pay-03.png" alt="Payment Methods" style="margin-top: 10px;">
                <img src="icons/icon-pay-04.png" alt="Payment Methods" style="margin-top: 10px;">
                <img src="icons/icon-pay-05.png" alt="Payment Methods" style="margin-top: 10px;">
                <p>&copy; 2024 All rights reserved by Phong - Dat - Nam</p>
            </div>
    
        </footer>
    
        <!-- ##### Footer Area End ##### -->

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