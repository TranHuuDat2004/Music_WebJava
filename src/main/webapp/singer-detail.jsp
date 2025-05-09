<%@ page import="java.sql.*, musicart.com.musicart.connectDB" %>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    ResultSet rsSongs = null;

    // Initialize variables for singer details
    String name = "";
    String image = "";
    int age = 0;
    String description = "";

    // Retrieve the ID from the URL
    String idParam = request.getParameter("id");
    int id = 0;

    try {
        if (idParam != null) {
            id = Integer.parseInt(idParam);
        }

        conn = connectDB.getConnection();

        // Query to get singer details
        String querySinger = "SELECT singer_id, name, image, age, description FROM singer WHERE singer_id = ?";
        stmt = conn.prepareStatement(querySinger);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            image = rs.getString("image");
            age = rs.getInt("age");
            description = rs.getString("description");
        } else {
            out.println("<p>Singer not found.</p>");
        }

        // Query to get songs of the singer
        String querySongs = "SELECT song_id, title, file_name, image FROM song WHERE singer = ?";
        stmt = conn.prepareStatement(querySongs);
        stmt.setString(1, name);
        rsSongs = stmt.executeQuery();

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>

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
            object-fit: cover;
            /* Cắt ảnh nếu cần */
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
        <h2>Singer</h2>
    </div>
</section>
<!-- ##### Breadcumb Area End ##### -->

<!-- ##### Album Catagory Area Start ##### -->
<section class="album-catagory section-padding-100-0">

    <div style="padding-bottom: 20px;"></div>
</section>

<!-- Display singer information -->
<div class="add-area mb-100">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div style="display: flex; align-items: flex-start;">
                    <img src="img/<%= image %>" width="400" height="150" style="margin-right: 20px;">
                    <div style="padding-top: 20px;">
                        <h3 style="text-align: center;"><%= name %>
                        </h3>
                        <h6 style="text-align: center;">Age: <%= age %>
                        </h6>
                        <p><%= description %>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Display singer's songs -->
<div class="one-music-songs-area mb-70">
    <div class="container">
        <div class="row">
            <% while (rsSongs != null && rsSongs.next()) {
                int songId = rsSongs.getInt("song_id");
                String songTitle = rsSongs.getString("title");
                String songImage = rsSongs.getString("image");
                String audioFile = rsSongs.getString("file_name");
            %>
            <div class="col-12">

                <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                    <a href="song-detail.jsp?id=<%= songId %>">
                        <div class="song-thumbnail">
                            <img src="img/<%= songImage %>" alt="">
                        </div>
                    </a>
                    <div class="song-play-area">
                        <div class="song-name">
                            <p><%= songTitle %>
                            </p>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/<%= audioFile %>">
                        </audio>
                    </div>
                    <div class="download-button">
                        <a href="audio/<%= audioFile %>" download>
                            <i class="fa fa-download"></i>
                        </a>
                    </div>
                </div>

            </div>
            <% } %>
        </div>
    </div>
</div>


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