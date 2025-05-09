<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

        <!-- Quiz Stylesheet -->
        <link rel="stylesheet" href="quiz.css">

    </head>
    <style>
        .album-thumb {
            width: 100%;
            overflow: hidden;
        }

        .album-thumb img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            /* Cắt ảnh nếu cần */
        }
    </style>

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
        <header class="header-area">
            <!-- Navbar Area -->
            <div class="oneMusic-main-menu">
                <div class="classy-nav-container breakpoint-off">
                    <div class="container">
                        <!-- Menu -->
                        <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                            <!-- Nav brand -->
                            <a href="index.jsp" class="nav-brand"><img src="img/core-img/logo.png" alt=""></a>

                            <!-- Navbar Toggler -->
                            <div class="classy-navbar-toggler">
                                <span class="navbarToggler"><span></span><span></span><span></span></span>
                            </div>

                            <!-- Menu -->
                            <div class="classy-menu">

                                <!-- Close Button -->
                                <div class="classycloseIcon">
                                    <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                                </div>

                                <!-- Nav Start -->
                                <div class="classynav">
                                    <ul>
                                        <li><a href="index.jsp">Home</a></li>
                                        <li><a href="singer.jsp">Singer</a></li>
                                        <li><a href="song.jsp">Song</a></li>
                                        <li><a href="event.jsp">Events</a></li>
                                        <li><a href="blog.jsp">News</a></li>
                                        <li><a href="search.jsp">Search</a></li>
                                        <li><a href="contact.jsp">Contact</a></li>
                                    </ul>

                                    <!-- Login/Register & Cart Button -->
                                    <div class="login-register-cart-button d-flex align-items-center">
                                        <!-- Login/Register -->
                                        <div class="login-register-btn mr-50">
                                            <a href="login.jsp" id="loginBtn">Login / Register</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Nav End -->

                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- ##### Header Area End ##### -->

        <!-- ##### Hero Area Start ##### -->
        <section class="hero-area">
            <div class="hero-slides owl-carousel">
                <!-- Single Hero Slide -->
                <div class="single-hero-slide d-flex align-items-center justify-content-center">
                    <!-- Slide Img -->
                    <div class="slide-img bg-img" style="background-image: url(img/bg-img/bg-1.jpg);"></div>
                    <!-- Slide Content -->
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="hero-slides-content text-center">
                                    <h6 data-animation="fadeInUp" data-delay="100ms">Latest album</h6>
                                    <h2 data-animation="fadeInUp" data-delay="300ms">Timeless Melodies <span>Timeless
                                            Melodies</span></h2>
                                    <a data-animation="fadeInUp" data-delay="500ms" href="discovery.jsp"
                                        class="btn oneMusic-btn mt-50">Discover <i
                                            class="fa fa-angle-double-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Hero Slide -->
                <div class="single-hero-slide d-flex align-items-center justify-content-center">
                    <!-- Slide Img -->
                    <div class="slide-img bg-img" style="background-image: url(img/bg-img/bg-2.jpg);"></div>
                    <!-- Slide Content -->
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="hero-slides-content text-center">
                                    <h6 data-animation="fadeInUp" data-delay="100ms">Newest song</h6>
                                    <h2 data-animation="fadeInUp" data-delay="300ms">Temporal Transcendence
                                        <span>Temporal
                                            Transcendence</span>
                                    </h2>
                                    <a data-animation="fadeInUp" data-delay="500ms" href="discovery.jsp"
                                        class="btn oneMusic-btn mt-50">Discover <i
                                            class="fa fa-angle-double-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Hero Area End ##### -->

        <!-- ##### Buy Now Area Start ##### -->
        <section class="oneMusic-buy-now-area has-fluid bg-gray section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="section-heading style-2">
                            <p>See what's new</p>
                            <h2>Popular Artists</h2>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <!-- Single Album Area 1-->
                    <a href="singer-detail.jsp">
                        <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                            <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                                <div class="album-thumb">
                                    <img src="img/bg-img/b2.jpg" alt="">
                                </div>
                                <div class="album-info">
                                    <a href="#">
                                        <h5>Son Tung M-TP</h5>
                                    </a>
                                    <p>Hay Trao Cho Anh</p>
                                </div>
                            </div>
                        </div>
                    </a>

                    <!-- Single Album Area 2-->
                    <a href="singer-detail.jsp">
                        <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                            <div class="single-album-area wow fadeInUp" data-wow-delay="200ms">
                                <div class="album-thumb">
                                    <img src="img/bg-img/b1.jpg" alt="">
                                </div>
                                <div class="album-info">
                                    <a href="#">
                                        <h5>Taylor Swift</h5>
                                    </a>
                                    <p>Look What You Made Me Do</p>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!-- Single Album Area 3-->
                    <a href="singer-detail.jsp">
                        <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                            <div class="single-album-area wow fadeInUp" data-wow-delay="300ms">
                                <div class="album-thumb">
                                    <img src="img/bg-img/b3.jpg" alt="">
                                </div>
                                <div class="album-info">
                                    <a href="#">
                                        <h5>Justin Bieber</h5>
                                    </a>
                                    <p>Baby</p>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!-- Single Album Area 4-->
                    <a href="singer-detail.jsp">
                        <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                            <div class="single-album-area wow fadeInUp" data-wow-delay="400ms">
                                <div class="album-thumb">
                                    <img src="img/bg-img/b4.jpg" alt="">
                                </div>
                                <div class="album-info">
                                    <a href="#">
                                        <h5>Ed Sheeran</h5>
                                    </a>
                                    <p>Shape of you</p>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!-- Single Album Area 5-->
                    <a href="singer-detail.jsp">
                        <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                            <div class="single-album-area wow fadeInUp" data-wow-delay="500ms">
                                <div class="album-thumb">
                                    <img src="img/bg-img/b6.jpg" alt="">
                                    <!-- Album Price -->
                                    <!-- <div class="album-price">
                                <p>$0.90</p>
                            </div> -->
                                    Play Icon
                                    
                                </div>
                                <div class="album-info">
                                    <a href="#">
                                        <h5>Jay Chou</h5>
                                    </a>
                                    <p>Mojito</p>
                                </div>
                            </div>
                        </div>
                    </a>
                        <!-- Single Album Area 6-->
                        <a href="singer-detail.jsp">
                            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                                <div class="single-album-area wow fadeInUp" data-wow-delay="600ms">
                                    <div class="album-thumb">
                                        <img src="img/bg-img/b5.jpg" alt="">
                                    </div>
                                    <div class="album-info">
                                        <a href="#">
                                            <h5>G - Dragon</h5>
                                        </a>
                                        <p>Haru Haru</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                            <!-- Single Album Area 7-->
                            <a href="singer-detail.jsp">
                                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                                        <div class="album-thumb">
                                            <img src="img/bg-img/b7.jpg" alt="">
                                        </div>
                                        <div class="album-info">
                                            <a href="#">
                                                <h5>Rihanna</h5>
                                            </a>
                                            <p>Diamonds</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                                <!-- Single Album Area 8-->
                                <a href="singer-detail.jsp">
                                    <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                                        <div class="single-album-area wow fadeInUp" data-wow-delay="200ms">
                                            <div class="album-thumb">
                                                <img src="img/bg-img/b8.jpg" alt="">
                                            </div>
                                            <div class="album-info">
                                                <a href="#">
                                                    <h5>Cardi B</h5>
                                                </a>
                                                <p>I Like It</p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                    <!-- Single Album Area 9-->
                                    <a href="singer-detail.jsp">
                                        <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                                            <div class="single-album-area wow fadeInUp" data-wow-delay="300ms">
                                                <div class="album-thumb">
                                                    <img src="img/bg-img/b9.jpg" alt="">
                                                </div>
                                                <div class="album-info">
                                                    <a href="#">
                                                        <h5>Camila Cabello</h5>
                                                    </a>
                                                    <p>Señorita</p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                        <!-- Single Album Area -->
                                        <a href="singer-detail.jsp">
                                            <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                                                <div class="single-album-area wow fadeInUp" data-wow-delay="400ms">
                                                    <div class="album-thumb">
                                                        <img src="img/bg-img/b10.jpg" alt="">
                                                    </div>
                                                    <div class="album-info">
                                                        <a href="#">
                                                            <h5>Charlie Puth</h5>
                                                        </a>
                                                        <p>How long</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                            <!-- Single Album Area -->
                                            <a href="singer-detail.jsp">
                                                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                                                    <div class="single-album-area wow fadeInUp" data-wow-delay="500ms">
                                                        <div class="album-thumb">
                                                            <img src="img/bg-img/b11.jpg" alt="">
                                                        </div>
                                                        <div class="album-info">
                                                            <a href="#">
                                                                <h5>Alec Benjamin</h5>
                                                            </a>
                                                            <p>Let Me Down Slowly</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                                <!-- Single Album Area -->
                                                <a href="singer-detail.jsp">
                                                    <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                                                        <div class="single-album-area wow fadeInUp"
                                                            data-wow-delay="600ms">
                                                            <div class="album-thumb">
                                                                <img src="img/bg-img/b12.jpg" alt="">
                                                            </div>
                                                            <div class="album-info">
                                                                <a href="#">
                                                                    <h5>Shakira</h5>
                                                                </a>
                                                                <p>La la la</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>

                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="load-more-btn text-center wow fadeInUp" data-wow-delay="300ms">
                            <a href="#" class="btn oneMusic-btn">Load More <i class="fa fa-angle-double-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Buy Now Area End ##### -->

        <!-- ##### Quiz Area Start ##### -->
        <section>
            <div class="app">
                <h1>Quiz Challenge</h1>
                <div class="quiz">
                    <h2 id="question">Question goes here</h2>
                    <div id="answer-button">
                        <button class="btn-quiz">Answer 1</button>
                        <button class="btn-quiz">Answer 2</button>
                        <button class="btn-quiz">Answer 3</button>
                        <button class="btn-quiz">Answer 4</button>
                    </div>
                    <button id="next-btn-quiz">Next</button>
                </div>
            </div>
        </section>
        <!-- ##### Quiz Area End ##### -->

        <!-- ##### Contact Area Start ##### -->
        <section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img"
            style="background-image: url(img/bg-img/bg-2.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-heading white wow fadeInUp" data-wow-delay="100ms">
                            <p>See what's new</p>
                            <h2>Get In Touch</h2>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <!-- Contact Form Area -->
                        <div class="contact-form-area">
                            <form action="" method="post" name="contact-form">
                                <div class="row">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="form-group wow fadeInUp" data-wow-delay="100ms">
                                            <input name="name" type="text" class="form-control" id="name"
                                                placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-4">
                                        <div class="form-group wow fadeInUp" data-wow-delay="200ms">
                                            <input name="email" type="email" class="form-control" id="email"
                                                placeholder="E-mail">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group wow fadeInUp" data-wow-delay="300ms">
                                            <input name="subject" type="text" class="form-control" id="subject"
                                                placeholder="Subject">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group wow fadeInUp" data-wow-delay="400ms">
                                            <textarea name="message" class="form-control" id="message" cols="30"
                                                rows="10" placeholder="Message"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-12 text-center wow fadeInUp" data-wow-delay="500ms">
                                        <button class="btn oneMusic-btn mt-30" type="submit">Send <i
                                                class="fa fa-angle-double-right"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
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

        <!-- ##### Quiz Script ##### -->
        <script src="quiz.js"></script>

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