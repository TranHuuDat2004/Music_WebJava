<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="musicart.com.musicart.connectDB" %>

<%
    // Kiểm tra nếu phương thức không phải là POST, trả về lỗi hoặc điều hướng
    if (!"POST".equalsIgnoreCase(request.getMethod())) {
%>
        <script>
            alert("Invalid request method. Please use the form to submit.");
            window.location.href = "contact.jsp"; // Điều hướng về trang form
        </script>
<%
        return; // Dừng xử lý tiếp
    }

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String subject = request.getParameter("subject");
    String message = request.getParameter("message");

    if (name != null && email != null && subject != null && message != null) {
        out.println("Form submitted successfully!");
        out.println("<br>Name: " + name);
        out.println("<br>Email: " + email);
        out.println("<br>Subject: " + subject);
        out.println("<br>Message: " + message);
    } else {
        out.println("Form data is missing!");
    }
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Kết nối đến database
        conn = connectDB.getConnection();

        // Câu lệnh SQL để chèn dữ liệu
        String sql = "INSERT INTO contact (name, email, subject, message) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        // Thiết lập giá trị cho các tham số
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, subject);
        pstmt.setString(4, message);

        // Thực thi câu lệnh
        int rowsInserted = pstmt.executeUpdate();

        // Kiểm tra kết quả
        if (rowsInserted > 0) {
%>
            <script>
                alert("Your message has been sent successfully!");
                window.location.href = "contact.jsp"; // Đưa người dùng quay lại trang contact.jsp
            </script>
<%
        } else {
%>
            <script>
                alert("Failed to send your message. Please try again.");
                window.location.href = "contact.jsp"; // Đưa người dùng quay lại trang contact.jsp
            </script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("An error occurred: <%= e.getMessage() %>");
            window.location.href = "contact.jsp";
        </script>
<%
    } finally {
        // Đóng các kết nối
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
