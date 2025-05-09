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
    <title>Song Detail</title>
    <link rel="stylesheet" href="css/style.css">
</head>

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

    .footer-area {
        width: 100%;
        background-color: #000;
        text-align: center;
        padding: 20px 0;
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
<!-- Header -->
<%@ include file="header.jsp" %>

<!-- ##### Breadcumb Area Start ##### -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/a9.jpg);">
    <div class="bradcumbContent">
        <p>See what's new</p>
        <h2>Song</h2>
    </div>
</section>
<!-- ##### Breadcumb Area End ##### -->

<!-- ##### Featured Artist Area Start ##### -->
<div class="container section-padding-100">
    <div class="row align-items-end">
            <%
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;
String id = request.getParameter("id"); // Lấy ID từ URL
if (id != null) {
    try {
        conn = connectDB.getConnection();

        // Tăng views trước khi lấy thông tin bài hát
        String updateQuery = "UPDATE song SET views = views + 1 WHERE song_id = ?";
        stmt = conn.prepareStatement(updateQuery);
        stmt.setInt(1, Integer.parseInt(id)); // Gán ID vào truy vấn
        stmt.executeUpdate();
        stmt.close();

        // Truy vấn thông tin bài hát
        String selectQuery = "SELECT * FROM song WHERE song_id = ?";
        stmt = conn.prepareStatement(selectQuery);
        stmt.setInt(1, Integer.parseInt(id)); // Gán ID vào truy vấn
        rs = stmt.executeQuery();
        if (rs.next()) {
            int views = rs.getInt("views");
            String title = rs.getString("title");
            String image = rs.getString("image");
            String singer = rs.getString("singer");
            String description = rs.getString("description");
            String file_name = rs.getString("file_name"); // File âm thanh
%>
        <!-- Song Detail -->
        <div class="col-12 col-md-5 col-lg-4">
            <div class="featured-artist-thumb">
                <img src="img/<%= image %>" alt="<%= title %>" class="img-fluid">
            </div>
        </div>
        <div class="col-12 col-md-7 col-lg-8">
            <div class="featured-artist-content">
                <div class="section-heading white text-left mb-30">
                    <h1 style="color: #000; text-align: center;"><%= title %>
                    </h1>
                    <h2 style="color: #000; text-align: center;"><%= singer %>
                    </h2>
                </div>
                <p style="color: #000;"><%= description %>
                </p>
                <p style="color: #000;">Listening: <b><%= views %>
                </b>
                </p>
                <div class="song-play-area">
                    <div class="song-name">
                        <p><%= title %>
                        </p>
                    </div>
                    <audio preload="auto" controls>
                        <source src="audio/<%= file_name %>" type="audio/mpeg">
                        Your browser does not support the audio element.
                    </audio>
                </div>
                <div class="download-button">
                    <a href="audio/<%= file_name %>" download>
                        <i class="fa fa-download"></i>
                    </a>
                </div>
            </div>
        </div>
            <%
        } else {
%>
        <p>Song not found!</p>
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
} else {
%>
        <p>Invalid song ID!</p>
            <%
}
%>
        <!-- ##### Featured Artist Area End ##### -->

        <!-- ##### Latest Albums Area Start ##### -->
        <section class="latest-albums-area section-padding-100">
            <div class="container">
                <div class="section-heading style-2">
                    <p><strong>See some newly released albums</strong></p>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="albums-slideshow owl-carousel">
                            <%
                                try {
                                    conn = connectDB.getConnection();
                                    String query = "SELECT song_id, title, image, singer, description FROM song ORDER BY song_id DESC";
                                    stmt = conn.prepareStatement(query);
                                    rs = stmt.executeQuery();
                                    while (rs.next()) {
                                        int songId = rs.getInt("song_id");
                                        String title = rs.getString("title");
                                        String image = rs.getString("image");
                                        String singer = rs.getString("singer");
                                        String description = rs.getString("description");
                            %>
                            <!-- Single Album -->
                            <div class="single-album">
                                <a href="song-detail.jsp?id=<%= songId %>">
                                    <img src="img/<%= image %>" alt="<%= title %>">
                                    <div class="album-info">
                                        <h5><%= title %>
                                        </h5>
                                        <p><%= singer %>
                                        </p>
                                    </div>
                                </a>
                            </div>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    out.println("<p>Error: " + e.getMessage() + "</p>");
                                } finally {
                                    if (rs != null) try {
                                        rs.close();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                    if (stmt != null) try {
                                        stmt.close();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                    if (conn != null) try {
                                        conn.close();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

        <!-- ##### Latest Albums Area End ##### -->

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
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/bootstrap/popper.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/plugins/plugins.js"></script>
        <script src="js/active.js"></script>
</body>

</html>