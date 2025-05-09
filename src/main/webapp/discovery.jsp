<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.sql.*" %>
<%@ page import="musicart.com.musicart.connectDB" %>
<!-- Import Gson vào -->

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    int totalSingers = 0, totalSongs = 0, totalUsers = 0, totalViews = 0, totalComments = 0;

    try {
        // Kết nối cơ sở dữ liệu
        conn = connectDB.getConnection(); // Hàm connectDB.getConnection() được định nghĩa trước

        stmt = conn.createStatement();

        // Lấy tổng số singers
        rs = stmt.executeQuery("SELECT COUNT(*) AS total FROM Singer");
        if (rs.next()) {
            totalSingers = rs.getInt("total");
        }

        // Lấy tổng số songs
        rs = stmt.executeQuery("SELECT COUNT(*) AS total FROM Song");
        if (rs.next()) {
            totalSongs = rs.getInt("total");
        }

        // Lấy tổng số users
        rs = stmt.executeQuery("SELECT COUNT(*) AS total FROM User");
        if (rs.next()) {
            totalUsers = rs.getInt("total");
        }

        // Lấy tổng số views
        rs = stmt.executeQuery("SELECT SUM(views) AS total FROM Song");
        if (rs.next()) {
            totalViews = rs.getInt("total");
        }

        // Lấy tổng số comments
        rs = stmt.executeQuery("SELECT COUNT(*) AS total FROM Comment");
        if (rs.next()) {
            totalComments = rs.getInt("total");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>


<%@ page import="java.sql.*" %>
<%@ page import="musicart.com.musicart.connectDB" %>

<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- Title -->
    <title>Modern Music</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- link icon -->
    <link rel="stylesheet" data-purpose="Layout StyleSheet" title="Web Awesome"
          href="/css/app-wa-8d95b745961f6b33ab3aa1b98a45291a.css?vsn=d">

    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/all.css">

    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-solid.css">

    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-regular.css">

    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-light.css">
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

    .text-2xl {
        transition: transform 0.2s ease-in-out;
    }

    .chart-container {
        width: 100%; /* Mặc định chiếm 100% chiều rộng của parent */
        height: 400px; /* Chiều cao cố định */
        max-width: 1400px; /* Kích thước tối đa */
        margin: 0 auto; /* Canh giữa */
    }

    .table-row {
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .table-row:nth-child(even) {
            background-color: #ffffff; /* Dòng chẵn */
        }

        .table-row:nth-child(odd) {
            background-color: #f9f9f9; /* Dòng lẻ */
        }

        .table-row:hover {
            background-color: #e0e0e0; /* Hover */
            color: #000; /* Đổi màu chữ khi hover */
        }

        .table-cell {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            display: flex;
            align-items: center;
        }

        .image-thumbnail {
            border-radius: 50%;
            margin-right: 10px;
            border: 1px solid #ddd;
        }

    /* Màn hình nhỏ hơn 1400px */
    @media (max-width: 1400px) {
        .chart-container {
            max-width: 1200px;
        }
    }

    /* Màn hình nhỏ hơn 768px (điện thoại) */
    @media (max-width: 768px) {
        .chart-container {
            max-width: 100%; /* Chiếm toàn bộ chiều rộng */
            height: 300px; /* Giảm chiều cao */
        }
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

<!-- ##### Breadcumb Area Start ##### -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/a9.jpg);">
    <div class="bradcumbContent">
        <p>See what's new</p>
        <h2>This week's top hit</h2>
    </div>
</section>
<!-- ##### Breadcumb Area End ##### -->

<!-- ##### charts Area Start ##### -->
<%
    String[] songTitles = new String[10];
    int[] songViews = new int[10];

    try {
        // Kết nối cơ sở dữ liệu
        conn = connectDB.getConnection(); // Hàm connectDB.getConnection() được định nghĩa trước
        stmt = conn.createStatement();

        // Lấy thông tin các bài hát và lượt xem
        rs = stmt.executeQuery("SELECT title, views FROM Song ORDER BY RAND() LIMIT 10");
        int index = 0;
        while (rs.next()) {
            songTitles[index] = rs.getString("title");
            songViews[index] = rs.getInt("views");
            index++;
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
<!-- Charts -->
<div class="space-y-6 mb-6">
    <!-- Biểu đồ This week's top hit -->
    <div class="bg-white p-4 rounded-lg shadow-md">
        <div class="chart-container">
            <canvas id="revenueChart"></canvas>
        </div>
    </div>
</div>


<!-- Song Table -->
<div class="bg-white p-6 rounded-lg shadow-md">
    <h2 style="text-align:center" class="text-lg font-bold mb-4 text-gray-800">Top 10 Songs</h2>
    <table style="width: 100%; border-collapse: collapse; margin: 1rem 0; font-size: 16px; font-family: Arial, sans-serif;">
        <thead>
            <tr style="background-color: #f4f4f4; text-align: left; color: #333;">
                <th style="padding: 12px; border-bottom: 2px solid #ddd; color: white;">Top</th>
                <th style="padding: 12px; border-bottom: 2px solid #ddd; color: white;">Title</th>
                <th style="padding: 12px; border-bottom: 2px solid #ddd; color: white;">Singers</th>
                <th style="padding: 12px; border-bottom: 2px solid #ddd; color: white;">Listening</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    conn = connectDB.getConnection();
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(
                            "SELECT song_id, title, image, singer, views " +
                                    "FROM song " +
                                    "ORDER BY views DESC " +
                                    "LIMIT 10"
                    );

                    int rank = 1; // Biến đếm để hiển thị số thứ tự
                    while (rs.next()) { // Lặp qua từng dòng dữ liệu
                        String songId = rs.getString("song_id");
                        String title = rs.getString("title");
                        String singer = rs.getString("singer");
                        String image = rs.getString("image");
                        String views = rs.getString("views");
            %>
            <tr class="table-row" style="cursor: pointer;" onclick="window.location.href='song-detail.jsp?id=<%= songId %>'">
                <td class="table-cell" style="padding: 12px;"><%= rank %></td>
                <td class="table-cell">
                    <img src="img/<%= image %>" alt="Song Thumbnail" class="image-thumbnail" width="60" height="60">
                    <div>
                        <p class="font-semibold"><%= title %></p>
                    </div>
                </td>
                <td class="table-cell"><%= singer %></td>
                <td class="table-cell">
                    <span class="bg-green-100 text-green-600 py-1 px-3 rounded-full text-xs"><%= views %></span>
                </td>
            </tr>
            <%
                        rank++; // Tăng biến đếm
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </tbody>
    </table>
</div>


<script>
    // Truyền dữ liệu từ JSP vào JavaScript (VS CODE sẽ hiện lỗi, chạy bình thường)
    const songTitles = <%= new Gson().toJson(songTitles) %>;
    const songViews = <%= new Gson().toJson(songViews) %>;

    // Biểu đồ đường với title là trục X, views là trục Y
    const ctxRevenue = document.getElementById('revenueChart').getContext('2d');
    const revenueChart = new Chart(ctxRevenue, {
        type: 'bar',
        data: {
            labels: songTitles,
            datasets: [{
                label: 'Listening',
                data: songViews,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1,
                maxBarThickness: 50, // Độ dày tối đa của cột
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                x: {
                    beginAtZero: true
                },
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Lấy các giá trị từ JSP và truyền vào JavaScript (VS CODE sẽ hiện lỗi, chạy bình thường)
    const data = {
        totalSingers: <%= totalSingers %>,
        totalSongs: <%= totalSongs %>,
        totalUsers: <%= totalUsers %>,
        totalViews: <%= totalViews %>,
        totalComments: <%= totalComments %>
    };

    function animateCounter(id, start, end, duration) {
        const element = document.getElementById(id); // Lấy phần tử dựa trên ID
        const range = end - start; // Khoảng cách giữa giá trị bắt đầu và kết thúc
        const increment = range / (duration / 10); // Giá trị tăng mỗi lần
        let current = start;

        function updateCounter() {
            current += increment; // Cộng giá trị tăng thêm
            if ((increment > 0 && current >= end) || (increment < 0 && current <= end)) {
                current = end; // Đảm bảo không vượt quá giá trị kết thúc
                clearInterval(timer); // Dừng interval
            }
            element.textContent = Math.round(current); // Cập nhật giá trị hiển thị
        }

        const timer = setInterval(updateCounter, 10); // Cập nhật mỗi 10ms
    }

    // Gọi hàm cho từng số
    animateCounter("counter-singer", 0, data.totalSingers, 2000); // Thời gian: 2 giây
    animateCounter("counter-music", 0, data.totalSongs, 2000); // Thời gian: 2 giây
    animateCounter("counter-users", 0, data.totalUsers, 2000);
    animateCounter("counter-listening", 0, data.totalViews, 2000);
    animateCounter("counter-comments", 0, data.totalComments, 2000);
</script>
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
