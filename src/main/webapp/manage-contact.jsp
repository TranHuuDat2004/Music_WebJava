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
        
        <!-- Manage Contact Table -->
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-xl font-semibold mb-4">
                Manage Contact
            </h2>
            <table class="w-full">
                <thead>
                    <%
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                
                    try {
                        conn = connectDB.getConnection(); // Kết nối tới database
                        String sql = "SELECT id, name, email, subject, message FROM contact";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();
                
                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                            String email = rs.getString("email");
                            String subject = rs.getString("subject");
                            String message = rs.getString("message");
                %>
                <tr class="border-t">
                    <td class="py-2"><%= name %></td>
                    <td class="py-2"><%= email %></td>
                    <td class="py-2"><%= subject %></td>
                    <td class="py-2"><%= message %></td>
                    <td class="py-2">
                        <!-- <a href="edit-contact.jsp?id=<%= id %>">
                            <button class="bg-yellow-500 text-white py-1 px-2 rounded hover:bg-yellow-600">
                                Edit
                            </button>
                        </a> -->
                        <a href="delete-contact.jsp?id=<%= id %>" onclick="return confirm('Are you sure you want to delete this contact?');">
                            <button class="bg-red-500 text-white py-1 px-2 rounded hover:bg-red-600">
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
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
                <!-- Add more rows as needed -->
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>