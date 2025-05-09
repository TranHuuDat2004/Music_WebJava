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

    <style>
        
        /* Download Button Style */
        .download-button {
            display: inline-block;
            padding: 5px 15px;
            background-color: white;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .download-button:hover {
            background-color: #41C9E2;
        }

        .single-album {
            width: 100%;
            overflow: hidden;
        }

        .single-album img {
            width: 100%;
            height: 300px;
            object-fit: cover; /* Cắt ảnh nếu cần */
        }

    </style>
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
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/a9.jpg);">
        <div class="bradcumbContent">
            <p>See what's new</p>
            <h2>Latest Albums</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Album Catagory Area Start ##### -->
    <section class="album-catagory section-padding-100-0">
        <h2 style="text-align: center;">Filter by First Letter</h2>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="browse-by-catagories catagory-menu d-flex flex-wrap align-items-center mb-70">
                        <a href="#" data-filter="*" class="active">Browse All</a>
                        <a href="#" data-filter=".a">A</a>
                        <a href="#" data-filter=".b">B</a>
                        <a href="#" data-filter=".c">C</a>
                        <a href="#" data-filter=".d">D</a>
                        <a href="#" data-filter=".e">E</a>
                        <a href="#" data-filter=".f">F</a>
                        <a href="#" data-filter=".g">G</a>
                        <a href="#" data-filter=".h">H</a>
                        <a href="#" data-filter=".i">I</a>
                        <a href="#" data-filter=".j">J</a>
                        <a href="#" data-filter=".k">K</a>
                        <a href="#" data-filter=".l" >L</a>
                        <a href="#" data-filter=".m" >M</a>
                        <a href="#" data-filter=".n" >N</a>
                        <a href="#" data-filter=".o" >O</a>
                        <a href="#" data-filter=".p" >P</a>
                        <a href="#" data-filter=".q" >Q</a>
                        <a href="#" data-filter=".r" >R</a>
                        <a href="#" data-filter=".s" >S</a>
                        <a href="#" data-filter=".t" >T</a>
                        <a href="#" data-filter=".u" >U</a>
                        <a href="#" data-filter=".v" >V</a>
                        <a href="#" data-filter=".w" >W</a>
                        <a href="#" data-filter=".x" >X</a>
                        <a href="#" data-filter=".y" >Y</a>
                        <a href="#" data-filter=".z" >Z</a>
                        <a href="#" data-filter=".number" class="active">0-9</a>
                    </div>
                </div>
            </div>

            <div class="row oneMusic-albums">

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item s">
                    <div class="single-album">
                        <img src="img/bg-img/b2.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Son Tung M-TP</h5>
                            </a>
                            <p>Hay Trao Cho Anh</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t">
                    <div class="single-album">
                        <img src="img/bg-img/b1.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Taylor Swift</h5>
                            </a>
                            <p>Look What You Made Me Do</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item j">
                    <div class="single-album">
                        <img src="img/bg-img/b3.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Justin Bieber</h5>
                            </a>
                            <p>Baby</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item e">
                    <div class="single-album">
                        <img src="img/bg-img/b4.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Ed Sheeran</h5>
                            </a>
                            <p>Shape of you</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item j">
                    <div class="single-album">
                        <img src="img/bg-img/b6.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Jay Chou</h5>
                            </a>
                            <p>Mojito</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item g">
                    <div class="single-album">
                        <img src="img/bg-img/b5.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>G - Dragon</h5>
                            </a>
                            <p>Haru Haru</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item r">
                    <div class="single-album">
                        <img src="img/bg-img/b7.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Rihanna</h5>
                            </a>
                            <p>Diamonds</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item c">
                    <div class="single-album">
                        <img src="img/bg-img/b8.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Cardi B</h5>
                            </a>
                            <p>I Like It</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item c">
                    <div class="single-album">
                        <img src="img/bg-img/b9.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Camila Cabello</h5>
                            </a>
                            <p>Señorita</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item c">
                    <div class="single-album">
                        <img src="img/bg-img/b10.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Charlie Puth</h5>
                            </a>
                            <p>How long</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item a">
                    <div class="single-album">
                        <img src="img/bg-img/b11.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Alec Benjamin</h5>
                            </a>
                            <p>Let Me Down Slowly</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item s">
                    <div class="single-album">
                        <img src="img/bg-img/b12.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Shakira</h5>
                            </a>
                            <p>La la la</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Album Catagory Area End ##### -->

    <!-- ##### Buy Now Area Start ##### -->
    <div class="oneMusic-buy-now-area mb-100">
        <div class="container">
            <div class="row" id="albumContainer">

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single-album-area">
                        <div class="album-thumb">
                            <img src="img/bg-img/b1.jpg" alt="">
                            <!-- Album Price -->
                            <!-- <div class="album-price">
                                <p>$0.90</p>
                            </div> -->
                            <!-- Play Icon -->
<%--                            <div class="play-icon">--%>
<%--                                <a href="#" class="video--play--btn"><span class="icon-play-button"></span></a>--%>
<%--                            </div>--%>
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>Taylor Swift</h5>
                            </a>
                            <p>POP</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single-album-area">
                        <div class="album-thumb">
                            <img src="img/bg-img/b2.jpg" alt="">
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>SON TUNG M-TP</h5>
                            </a>
                            <p>ELECTRIC</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single-album-area">
                        <div class="album-thumb">
                            <img src="img/bg-img/b3.jpg" alt="">
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>Justin Bieber</h5>
                            </a>
                            <p>POP</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single-album-area">
                        <div class="album-thumb">
                            <img src="img/bg-img/b4.jpg" alt="">
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>Ed Sheeran</h5>
                            </a>
                            <p>Modern - POP</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-3 hidden-album">
                    <div class="single-album-area">
                        <div class="album-thumb">
                            <img src="img/bg-img/bg-5.jpg" alt="">
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>Duc Phuc</h5>
                            </a>
                            <p>Het Thuong Can Nho - POP</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-3 hidden-album">
                    <div class="single-album-area">
                        <div class="album-thumb">
                            <img src="img/bg-img/bg-6.jpg" alt="">
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>Andree</h5>
                            </a>
                            <p>TETTOVEN - RAP</p>
                        </div>
                    </div> Pink Sweat$
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-3 hidden-album">
                    <div class="single-album-area">
                        <div class="album-thumb">
                            <img src="img/bg-img/bg-7.jpg" alt="">
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>Pink Sweat$</h5>
                            </a>
                            <p>At my wrost- Siblings</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-3 hidden-album">
                    <div class="single-album-area">
                        <div class="album-thumb">
                            <img src="img/bg-img/bg-8.jpg" alt="">
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>Dhruv</h5>
                            </a>
                            <p> Double take- Soft</p>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-12">
                    <div class="load-more-btn text-center">
                        <a href="#" class="btn oneMusic-btn" id="loadMoreBtn">Load More <i class="fa fa-angle-double-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Buy Now Area End ##### -->

    <!-- ##### Add Area Start ##### -->
    <div class="add-area mb-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="adds"> 
                        <video width="640" height="360" controls>
                            <source src="img/teaser.mp4" >
                        </video>
                        <p class="addInfo">Alan Walker - Faded (teaser) </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Add Area End ##### -->

    <!-- ##### Song Area Start ##### -->
    <div class="one-music-songs-area mb-70">
        <div class="container">
            <div class="row">

                <!-- Single Song Area -->
                <div class="col-12">
                    <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                        <div class="song-thumbnail">
                            <img src="img/bg-img/l1.jpg" alt="">
                        </div>
                        <div class="song-play-area">
                            <div class="song-name">
                                <p>01. Shape of You</p>
                            </div>
                            <audio preload="auto" controls>
                                <source src="audio/soy.mp3">
                            </audio>
                        </div>
                        <div class="download-button">
                            <a href="audio/soy.mp3" download>
                                <i class="fa fa-download"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Single Song Area -->
                <div class="col-12">
                    <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                        <div class="song-thumbnail">
                            <img src="img/bg-img/l2.jpg" alt="">
                        </div>
                        <div class="song-play-area">
                            <div class="song-name">
                                <p>02. We don't talk anymore</p>
                            </div>
                            <audio preload="auto" controls>
                                <source src="audio/wdtam.mp3">
                            </audio>
                        </div>
                        <div class="download-button">
                            <a href="audio/wdtam.mp3" download>
                                <i class="fa fa-download"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Single Song Area -->
                <div class="col-12">
                    <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                        <div class="song-thumbnail">
                            <img src="img/bg-img/l3.jpg" alt="">
                        </div>
                        <div class="song-play-area">
                            <div class="song-name">
                                <p>03. Senõrita</p>
                            </div>
                            <audio preload="auto" controls>
                                <source src="audio/senorita.mp3">
                            </audio>
                        </div>
                        <div class="download-button">
                            <a href="audio/senorita.mp3" download>
                                <i class="fa fa-download"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Single Song Area -->
                <div class="col-12">
                    <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                        <div class="song-thumbnail">
                            <img src="img/bg-img/l4.jpg" alt="">
                        </div>
                        <div class="song-play-area">
                            <div class="song-name">
                                <p>04. Despacito</p>
                            </div>
                            <audio preload="auto" controls>
                                <source src="audio/despacito.mp3">
                            </audio>
                        </div>
                        <div class="download-button">
                            <a href="audio/despacito.mp3" download>
                                <i class="fa fa-download"></i>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- ##### Song Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img" style="background-image: url(img/bg-img/bg-2.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading white">
                        <p>See what's new</p>
                        <h2>Get In Touch</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <!-- Contact Form Area -->
                    <div class="contact-form-area">
                        <form action="#" method="post" name="contact-form">
                            <div class="row">
                                <div class="col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <input name="name" type="text" class="form-control" id="name" placeholder="Name">
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <input name="email" type="email" class="form-control" id="email" placeholder="E-mail">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <input name="subject" type="text" class="form-control" id="subject" placeholder="Subject">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea name="message" name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                                    </div>
                                </div>
                                <div class="col-12 text-center">
                                    <button class="btn oneMusic-btn mt-30" type="submit">Send <i class="fa fa-angle-double-right"></i></button>
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