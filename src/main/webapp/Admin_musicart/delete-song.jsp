<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="musicart.com.musicart.connectDB" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Singer</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans leading-normal tracking-normal">
    <div class="container mx-auto p-6">
        <h1 class="text-2xl font-bold mb-6">Delete Song</h1>
        <%
            String message = "";
            String songId = request.getParameter("id");

            if (songId != null && !songId.isEmpty()) {
                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    conn = connectDB.getConnection(); // Kết nối tới database
                    String sql = "DELETE FROM song WHERE song_id = ?";

                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, songId);

                    int rowsDeleted = pstmt.executeUpdate();
                    if (rowsDeleted > 0) {
                        message = "Song with ID " + songId + " was successfully deleted.";
                    } else {
                        message = "No song found with ID " + songId + ".";
                    }
                } catch (Exception e) {
                    message = "Error: " + e.getMessage();
                } finally {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            } else {
                message = "Invalid song ID.";
            }
        %>

        <!-- Display Message -->
        <div class="bg-white p-4 rounded-lg shadow-md">
            <p class="text-lg font-semibold text-gray-700"><%= message %></p>
            <a href="manage-song.jsp" class="mt-4 inline-block bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600">
                Back to Song List
            </a>
        </div>
    </div>
</body>
</html>
