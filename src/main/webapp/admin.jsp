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
        rs = stmt.executeQuery("SELECT COUNT(*) AS total FROM Contact");
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
    <title>Dashboard</title>
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
    .text-2xl {
        transition: transform 0.2s ease-in-out;
    }

    .chart-container {
        width: 100%; /* Mặc định chiếm 100% chiều rộng của parent */
        height: 400px; /* Chiều cao cố định */
        max-width: 1400px; /* Kích thước tối đa */
        margin: 0 auto; /* Canh giữa */
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
<body class="bg-gray-100 font-sans leading-normal tracking-normal">
<div class="flex flex-col md:flex-row">
    <!-- Sidebar -->
    <%
        // Lấy tên file hiện tại từ URL
        String currentPage = request.getRequestURI();
    %>
    <%@ include file="Sidebar.jsp" %>

    <!-- Main Content -->
    <div class="flex-1 p-6">
        <!-- Top Bar -->
        <%@ include file="topbar.jsp" %>
        <!-- Dashboard Content -->
        <h1 class="text-2xl font-semibold mb-4">Dashboard</h1>
        <div class="grid grid-cols-1 md:grid-cols-5 gap-4 mb-6">
            <div class="bg-white p-4 rounded-lg shadow-md flex items-center">
                <i class="fa-solid fa-hand-horns text-3xl text-purple-500 mr-4" style="color: #fc4dff;"></i>
                <div>
                    <p class="text-gray-600">Singers</p>
                    <p class="text-2xl font-bold" id="counter-singer"><%= totalSingers %>
                    </p>
                </div>
            </div>
            <div class="bg-white p-4 rounded-lg shadow-md flex items-center">
                <i class="fas fa-music text-3xl text-purple-500 mr-4"></i>
                <div>
                    <p class="text-gray-600">Songs</p>
                    <p class="text-2xl font-bold" id="counter-music"><%= totalSongs %>
                    </p>
                </div>
            </div>
            <div class="bg-white p-4 rounded-lg shadow-md flex items-center">
                <i class="fa-solid fa-user-music text-3xl text-purple-500 mr-4" style="color: #63E6BE;"></i>
                <div>
                    <p class="text-gray-600">Users</p>
                    <p class="text-2xl font-bold" id="counter-users"><%= totalUsers %>
                    </p>
                </div>
            </div>
            <div class="bg-white p-4 rounded-lg shadow-md flex items-center">
                <i class="fa-solid fa-head-side-headphones text-3xl text-purple-500 mr-4" style="color: #FFD43B;"></i>
                <div>
                    <p class="text-gray-600">Listening</p>
                    <p class="text-2xl font-bold" id="counter-listening"><%= totalViews %>
                    </p>
                </div>
            </div>
            <div class="bg-white p-4 rounded-lg shadow-md flex items-center">
                <i class="fa-solid fa-comment-music text-3xl text-purple-500 mr-4" style="color: #74C0FC;"></i>
                <div>
                    <p class="text-gray-600">Contacts</p>
                    <p class="text-2xl font-bold" id="counter-comments"><%= totalComments %>
                    </p>
                </div>
            </div>
        </div>

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
                <h2 class="text-xl font-semibold mb-4">This week's top hit</h2>
                <div class="chart-container">
                    <canvas id="revenueChart"></canvas>
                </div>
            </div>
        </div>


        <!-- Song Table -->
        <div class="bg-white p-4 rounded-lg shadow-md">
            <table class="w-full">
                <thead>
                <tr class="text-left text-gray-600">
                    <th class="py-2">Title</th>
                    <th class="py-2">Singers</th>
                    <th class="py-2">Listening</th>
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
                
                            int rank = 1; // Khởi tạo thứ hạng
                            while (rs.next()) { // Lặp qua từng dòng dữ liệu
                                String songId = rs.getString("song_id");
                                String title = rs.getString("title");
                                String singer = rs.getString("singer");
                                String image = rs.getString("image");
                                String views = rs.getString("views");
                    %>
                    <tr class="border-t">
                        <!-- Cột Top -->
                        <td class="py-2 font-semibold"><%= rank %></td>
                        
                        <td class="py-2 flex items-center">
                            <img src="img/<%= image %>" alt="Song Thumbnail" class="rounded-full mr-2"
                                 width="60" height="60"/>
                            <div>
                                <p class="font-semibold"><%= title %>
                                </p>
                            </div>
                        </td>
                        <td class="py-2"><%= singer %></td>
                        <td class="py-2">
                            <span class="bg-green-100 text-green-600 py-1 px-3 rounded-full text-xs"><%= views %></span>
                        </td>
                    </tr>
                    <%
                                rank++; // Tăng thứ hạng
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


        </table>
        <div class="flex justify-between items-center mt-4">
            <p class="text-gray-600">SHOWING 1-2 OF 100</p>
            <div class="flex space-x-2">
                <button class="px-3 py-1 bg-gray-200 text-gray-600 rounded">1</button>
                <button class="px-3 py-1 bg-white text-gray-600 rounded">2</button>
                <button class="px-3 py-1 bg-white text-gray-600 rounded">3</button>
            </div>
        </div>
    </div>
</div>
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


</body>

</html>
