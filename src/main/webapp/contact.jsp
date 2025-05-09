<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="musicart.com.musicart.connectDB" %>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<jsp lang="en">

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

    <!-- Stylesheet -->
    <link rel="stylesheet" href="css/contact.css">
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
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb.jpg);">
        <div class="bradcumbContent">
            <p>See what's new</p>
            <h2>Contact</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100-0">
        <div class="container">
            <div class="row">

                <div class="col-12 col-lg-3">
                    <div class="contact-content mb-100">
                        <!-- Title -->
                        <div class="contact-title mb-50">
                            <h5>Contact Info</h5>
                        </div>

                        <!-- Single Contact Info -->
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-placeholder"></span>
                            </div>
                            <p>19 St. Nguyen Huu Tho, Tan Phong Ward, District 7, Ho Chi Minh City</p>
                        </div>

                        <!-- Single Contact Info -->
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-smartphone"></span>
                            </div>
                            <p>028 3775 5052 <br> (+84) 912 345 789 <br> (+84) 987 654 311</p>
                        </div>

                        <!-- Single Contact Info -->
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-mail"></span>
                            </div>
                            <p>tiendattp91@gmail.com <br>522h0134@student.tdtu.edu.vn <br>522h0007@student.tdtu.edu.vn</p>
                        </div>

                        <!-- Contact Social Info -->
                        <div class="contact-social-info mt-50">
                            <a href="https://www.facebook.com/alanwalkermusic" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="https://www.youtube.com/@Alanwalkermusic" data-toggle="tooltip" data-placement="top" title="Youtube"><i class="fa fa-youtube" aria-hidden="true"></i></a>
                            <a href="https://www.instagram.com/alanwalkermusic" data-toggle="tooltip" data-placement="top" title="Instagram"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                            <a href="https://twitter.com/IAmAlanWalker" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        </div>

                    </div>
                </div>

                <div class="col-12 col-lg-9">
                    <!-- ##### Google Maps ##### -->
                    <div class="map-area mb-100">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7840.047801341739!2d106.69582139813065!3d10.732639900000015!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528b2747a81a3%3A0x33c1813055acb613!2sTon%20Duc%20Thang%20University!5e0!3m2!1sen!2s!4v1711703207468!5m2!1sen!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" allowfullscreen></iframe>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->

<!-- ##### Contact Area Start ##### -->
<section class="contact" id="contact">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading">
                    <h1 style="font-size: 48px; font-weight: bold; text-align: center;">Get In Touch</h1>
                    <p style="font-size: 24px; text-align: center;">Send us a message</p>
                </div>
            </div>
        </div>
        <div class="contact-form-area">
            <form action="contact_post.jsp" method="post">
                <div class="row">
                    <!-- Name Input -->
                    <div class="col-md-6 col-lg-4">
                        <div class="form-group wow fadeInUp" data-wow-delay="100ms">
                            <input
                                style="color:#000;"
                                name="name"
                                type="text"
                                class="form-control"
                                id="name"
                                placeholder="Name"
                                required>
                        </div>
                    </div>
                    <!-- Email Input -->
                    <div class="col-md-6 col-lg-4">
                        <div class="form-group wow fadeInUp" data-wow-delay="200ms">
                            <input
                                style="color:#000;"
                                name="email"
                                type="email"
                                class="form-control"
                                id="email"
                                placeholder="E-mail"
                                required>
                        </div>
                    </div>
                    <!-- Subject Input -->
                    <div class="col-lg-4">
                        <div class="form-group wow fadeInUp" data-wow-delay="300ms">
                            <input
                                style="color:#000;"
                                name="subject"
                                type="text"
                                class="form-control"
                                id="subject"
                                placeholder="Subject"
                                required>
                        </div>
                    </div>
                    <!-- Message Input -->
                    <div class="col-12">
                        <div class="form-group wow fadeInUp" data-wow-delay="400ms">
                            <textarea
                                style="color:#000;"
                                name="message"
                                class="form-control"
                                id="message"
                                cols="30"
                                rows="10"
                                placeholder="Message"
                                required></textarea>
                        </div>
                    </div>
                    <!-- Submit Button -->
                    <div class="col-12 text-center wow fadeInUp" data-wow-delay="500ms">
                        <button
                            style="color:#000;"
                            class="btn oneMusic-btn mt-30"
                            type="submit">Send <i class="fa fa-angle-double-right"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- ##### Contact Area End ##### -->


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

    <!-- ##### Feedback Script ##### -->
    <script src="feedback_home.js"></script>

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