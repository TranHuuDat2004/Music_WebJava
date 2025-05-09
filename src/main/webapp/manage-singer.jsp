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
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-gray-100 font-sans leading-normal tracking-normal">
<div class="flex flex-col md:flex-row"">
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
        
        <!-- Manage Singer Table -->
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-xl font-semibold mb-4">
                Manage Singer
            </h2>
            <table class="w-full">
                <thead>
                <tr class="text-left text-gray-600">
                    <th class="py-2">
                        ID
                    </th>
                    <th class="py-2">
                        Name
                    </th>
                    <th class="py-2">
                        Image
                    </th>
                    <th class="py-2">
                        Age
                    </th>
                    <th class="py-2">
                        Description
                    </th>
                    <th style="padding-left: 15px;" class="py-2">
                        Action
                    </th>
                </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                
                        try {
                            // Kết nối cơ sở dữ liệu
                            conn = connectDB.getConnection(); // Phương thức lấy kết nối từ class connectDB của bạn
                
                            // Truy vấn bảng singer
                            String sql = "SELECT singer_id, name, age, image, description FROM singer";
                            stmt = conn.prepareStatement(sql);
                            rs = stmt.executeQuery();
                
                            // Lặp qua từng dòng trong kết quả
                            while (rs.next()) {
                                int singerId = rs.getInt("singer_id");
                                String name = rs.getString("name");
                                int age = rs.getInt("age");
                                String image = rs.getString("image");
                                String description = rs.getString("description");
                    %>
                                <tr class="border-t">
                                    <td class="py-2"><%= singerId %></td>
                                    <td class="py-2"><%= name %></td>
                                    <td class="py-2">
                                        <img alt="Singer Image" class="h-10 w-10 rounded-full" 
                                             height="40" src="img/<%= image %>" width="60"/>
                                    </td>
                                    <td class="py-2"><%= age %></td>
                                    <td style="max-width: 350px;" class="py-2"><%= description %></td>
                                    <td style="padding-left: 15px;" class="py-2">
                                        <!-- <a href="edit-singer.jsp?id=<%= singerId %>"><button class="bg-yellow-500 text-white py-1 px-2 rounded hover:bg-yellow-600">
                                            Edit
                                        </a>
                                        </button> -->
                                        <a href="delete-singer?id=<%= singerId %>"><button onsubmit="return confirm('Are you sure you want to delete this singer?');"
                                        class="bg-red-500 text-white py-1 px-2 rounded hover:bg-red-600">
                                            Delete
                                        </button>
                                    </a>
                                    </td>
                                </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Đóng kết nối
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>