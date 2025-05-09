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
        
        <!-- Manage User Table -->
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-2xl font-bold mb-6">Manage Users</h2>
        <div class="bg-white p-6 rounded-lg shadow-md">
            <table class="w-full border-collapse border border-gray-300">
                <thead>
                <tr class="text-left text-gray-600">
                    <th class="border py-2 px-4">ID</th>
                    <th class="border py-2 px-4">Username</th>
                    <th class="border py-2 px-4">Email</th>
                    <th class="border py-2 px-4">Role</th>
                    <th class="border py-2 px-4">Actions</th>
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
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicart", "root", ""); // Thay username/password tương ứng

                        // Truy vấn dữ liệu từ bảng user
                        String sql = "SELECT id, username, email, role FROM user";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();

                        // Duyệt qua các hàng dữ liệu và hiển thị
                        while (rs.next()) {
                            int userId = rs.getInt("id");
                            String username = rs.getString("username");
                            String email = rs.getString("email");
                            String role = rs.getString("role");
                %>
                <tr class="border-t">
                    <td class="border py-2 px-4"><%= userId %></td>
                    <td class="border py-2 px-4"><%= username %></td>
                    <td class="border py-2 px-4"><%= email %></td>
                    <td class="border py-2 px-4"><%= role %></td>
                    <td class="py-2">
                        <a href="delete-user.jsp?id=<%= userId %>">
                            <button class="bg-red-500 text-white py-1 px-2 rounded hover:bg-red-600"
                                    onclick="return confirm('Are you sure you want to delete this user?');">
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
                        if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                        if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
                        if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>