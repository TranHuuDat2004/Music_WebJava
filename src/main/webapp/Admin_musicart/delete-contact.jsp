<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="musicart.com.musicart.connectDB" %>
<html>
<head>
    <title>Delete Contact</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="container mx-auto mt-10 p-6">
    <%
        String message = "";
        String contactId = request.getParameter("id");

        if (contactId != null && !contactId.isEmpty()) {
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                conn = connectDB.getConnection(); // Kết nối tới cơ sở dữ liệu
                String sql = "DELETE FROM contact WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(contactId));

                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    message = "Contact has been successfully deleted.";
                } else {
                    message = "No contact found with ID: " + contactId;
                }
            } catch (Exception e) {
                message = "Error: " + e.getMessage();
            } finally {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        } else {
            message = "Invalid contact ID.";
        }
    %>
    <p><%= message %></p>
    <a href="manage-contact.jsp" class="text-blue-500 underline">Back to Manage Contact
