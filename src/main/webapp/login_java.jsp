<%@ page import="java.sql.*, musicart.com.musicart.connectDB" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Kiểm tra nếu yêu cầu là POST và có tham số username/password
    if ("POST".equalsIgnoreCase(request.getMethod()) && 
        request.getParameter("username") != null && 
        request.getParameter("password") != null) {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = connectDB.getConnection();

            // Truy vấn lấy thông tin người dùng từ cơ sở dữ liệu
            String sql = "SELECT role, password FROM user WHERE username = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");

                // So sánh mật khẩu nhập vào với mật khẩu trong cơ sở dữ liệu
                if (storedPassword.equals(password)) {
                    String role = rs.getString("role");

                    // Lưu thông tin người dùng vào session
                    session.setAttribute("username", username);
                    session.setAttribute("role", role);

                    // Chuyển hướng theo vai trò
                    if ("admin".equalsIgnoreCase(role.trim())) {
                        response.sendRedirect("admin.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }                    
                } else {
                    out.println("<p class='text-danger'>Sai tên đăng nhập hoặc mật khẩu!</p>");
                }
            } else {
                out.println("<p class='text-danger'>Sai tên đăng nhập hoặc mật khẩu!</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p class='text-danger'>Đã xảy ra lỗi: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }
%>
