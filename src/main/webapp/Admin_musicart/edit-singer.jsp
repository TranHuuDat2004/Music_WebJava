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
            String currentPage = "manage-singer.jsp";
        %>
            <%@ include file="Sidebar.jsp" %>
    
        <!-- Main Content -->
        <div class="flex-1 p-6">
            <!-- Top Bar -->
            <%@ include file="topbar.jsp" %>
    
            <!-- Edit Singer Form -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-semibold mb-4">Edit Singer</h2>
    
                <%
                    String singerId = request.getParameter("id");
                    String query = "SELECT * FROM singer WHERE singer_id = ?";
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
    
                    try {
                        conn = connectDB.getConnection(); // Kết nối database
                        pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, singerId);
                        rs = pstmt.executeQuery();
    
                        if (rs.next()) {
                            String name = rs.getString("name");
                            int age = rs.getInt("age");
                            String description = rs.getString("description");
                            String image = rs.getString("image");
                %>
                <form action="edit-singer" method="POST">
                    <input type="hidden" name="singer_id" value="<%= singerId %>"/>
                    <div class="mb-4">
                        <label class="block text-gray-700">Name</label>
                        <input class="w-full py-2 px-4 rounded-lg border border-gray-300" type="text" name="name"
                               value="<%= name %>" required/>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700">Age</label>
                        <input class="w-full py-2 px-4 rounded-lg border border-gray-300" type="number" name="age"
                               value="<%= age %>" required/>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700">Description</label>
                        <textarea class="w-full py-2 px-4 rounded-lg border border-gray-300" rows="4" name="description"
                                  required><%= description %></textarea>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700">Image URL</label>
                        <input class="w-full py-2 px-4 rounded-lg border border-gray-300" type="text" name="image"
                               value="<%= image %>" required/>
                        <img alt="Singer Image" class="h-20 w-20 rounded-full mt-4" height="80"
                             src="img<%= image %>" width="80"/>
                    </div>
                    <button class="bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600" type="submit">
                        Save Changes
                    </button>
                </form>
                <%
                        } else {
                %>
                <p class="text-red-500">Singer not found!</p>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<p class='text-red-500'>Error: " + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </div>
        </div>
    </div>

</body>
</html>