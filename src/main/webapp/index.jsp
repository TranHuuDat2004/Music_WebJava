<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="musicart.com.musicart.connectDB" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Modern Music</title>
    <link rel="icon" href="img/core-img/favicon.ico">
    <link rel="stylesheet" href="css/style.css">
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
    <%@ include file="header.jsp" %>


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
                                    class="btn oneMusic-btn mt-50">This week's top <i
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
                                    class="btn oneMusic-btn mt-50">This week's top hit <i
                                        class="fa fa-angle-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Hero Area End ##### -->
    
    <!-- Buy Now Area Start -->
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
                <% 
                    Connection conn = null; 
                    Statement stmt = null; 
                    ResultSet rs = null;
                    try {
                        conn = connectDB.getConnection();
                        String query = "SELECT singer_id, name, image, age, description FROM singer";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(query);

                        while (rs.next()) {
                            int id = rs.getInt("singer_id");
                            String name = rs.getString("name");
                            String image = rs.getString("image");
                            int age = rs.getInt("age");
                            String description = rs.getString("description");
                %>
                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                        <div class="album-thumb">
                            <a href="singer-detail.jsp?id=<%= id %>">
                                <img src="img/<%= image %>" alt="<%= name %>">
                            </a>
                        </div>
                        <div class="album-info">
                            <a href="singer-detail.jsp?id=<%= id %>">
                                <h5 style="text-align: center;"><%= name %></h5>
                            </a>
                        </div>
                    </div>
                </div>
                <% 
                        }
                    } catch (Exception e) { 
                        e.printStackTrace(); 
                        out.println("<p>Error retrieving singers: " + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                    }
                %>
            </div>
        </div>
    </section>
    <!-- Buy Now Area End -->

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

    <!-- JavaScript Files -->
    <script src="quiz.js"></script>
    <script src="feedback_home.js"></script>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/bootstrap/popper.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <script src="js/plugins/plugins.js"></script>
    <script src="js/active.js"></script>
</body>

</html>
