<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.sql.*" %>
<%@ page import="musicart.com.musicart.connectDB" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>
        Dashboard
    </title>
    <script src="https://cdn.tailwindcss.com">
    </script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/chart.js">
    </script>
</head>
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

        <!-- Manage Song Table -->
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-xl font-semibold mb-4">Manage Song</h2>
            <table class="w-full">
                <thead>
                <tr class="text-left text-gray-600">
                    <th class="py-2">Song ID</th>
                    <th class="py-2">Title</th>
                    <th class="py-2">Singer</th>
                    <th class="py-2">Image</th>
                    <th class="py-2">File Name</th>
                    <th class="py-2">Views</th>
                    <th class="py-2">Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Kết nối cơ sở dữ liệu
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicart", "root", ""); // Thay "root" và "" bằng username và password của bạn

                        // Truy vấn dữ liệu từ bảng song
                        String sql = "SELECT song_id, title, singer, image, file_name, views FROM song";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();

                        // Duyệt qua các hàng dữ liệu và hiển thị
                        while (rs.next()) {
                            int songId = rs.getInt("song_id");
                            String title = rs.getString("title");
                            String singer = rs.getString("singer");
                            String image = rs.getString("image");
                            String fileName = rs.getString("file_name");
                            int views = rs.getInt("views");
                %>
                <tr class="border-t">
                    <td class="py-2"><%= songId %>
                    </td>
                    <td class="py-2"><%= title %>
                    </td>
                    <td class="py-2"><%= singer %>
                    </td>
                    <td class="py-2">
                        <img src="img/<%= image %>" alt="Song Image" class="h-10 w-10 rounded-full" width="60" height="60">
                    </td>
                    <td class="py-2"><%= fileName %>
                    </td>
                    <td class="py-2"><%= views %>
                    </td>
                    <td class="py-2">
                        <a href="delete-song.jsp?id=<%= songId %>">
                            <button class="bg-red-500 text-white py-1 px-2 rounded hover:bg-red-600"
                                    onclick="return confirm('Are you sure you want to delete this song?');">
                                Delete
                            </button>
                        </a>
                    </td>
                    
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    } finally {
                        // Đóng kết nối
                        if (rs != null) try {
                            rs.close();
                        } catch (SQLException ignored) {
                        }
                        if (stmt != null) try {
                            stmt.close();
                        } catch (SQLException ignored) {
                        }
                        if (conn != null) try {
                            conn.close();
                        } catch (SQLException ignored) {
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>


</body>
</html>
