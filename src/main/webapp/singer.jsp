<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="musicart.com.musicart.connectDB" %>

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

        <!-- ##### Album Category Area Start ##### -->
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
    

                <!-- Singer Albums -->
                <div class="row oneMusic-albums">
                    <%
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;

                        try {
                            // Kết nối đến cơ sở dữ liệu
                            conn = connectDB.getConnection();

                            // Query để lấy danh sách ca sĩ
                            String query = "SELECT singer_id, name, image, age, description FROM singer ORDER BY name";
                            stmt = conn.prepareStatement(query);
                            rs = stmt.executeQuery();

                            // Hiển thị từng ca sĩ
                            while (rs.next()) {
                                int id = rs.getInt("singer_id");
                                String name = rs.getString("name");
                                String image = rs.getString("image");
                                int age = rs.getInt("age");
                                String description = rs.getString("description");
                                String firstLetter = name.substring(0, 1).toLowerCase(); // Lấy chữ cái đầu
                    %>
                    <!-- Single Album -->
                    <a href="singer-detail.jsp?id=<%= id %>">
                        <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item <%= firstLetter %>">
                            <div class="single-album">
                                <img src="img/<%= image %>" alt="<%= name %>">
                                <div class="album-info">
                                    <h5><%= name %></h5>
                                    <!-- <p>Click để xem chi tiết</p> -->
                                </div>
                            </div>
                        </div>
                    </a>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<p>Error: " + e.getMessage() + "</p>");
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>
                </div>
            </div>
        </section>
        <!-- ##### Album Category Area End ##### -->



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