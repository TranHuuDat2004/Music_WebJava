<%@ page import="java.sql.*, musicart.com.musicart.connectDB" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.util.ArrayList" %>

<%
    // Lấy thông tin từ form
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm_password");
    String role = request.getParameter("role");

    // Biến để lưu lỗi
    ArrayList<String> errors = new ArrayList<>();

    // Kiểm tra dữ liệu đầu vào
    if (username == null || username.isEmpty()) {
        errors.add("Username is required.");
    }
    if (email == null || email.isEmpty()) {
        errors.add("Email is required.");
    }
    if (password == null || password.isEmpty()) {
        errors.add("Password is required.");
    }
    if (confirmPassword == null || confirmPassword.isEmpty() || !password.equals(confirmPassword)) {
        errors.add("Passwords do not match.");
    }

    if (errors.isEmpty()) {

        // Kết nối đến cơ sở dữ liệu và thêm người dùng mới nếu không có lỗi
        if (errors.isEmpty()) {
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                conn = connectDB.getConnection();

                String sql = "INSERT INTO user (username, email, password, role) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, email);
                pstmt.setString(3, password);
                pstmt.setString(4, role);

                int rowsInserted = pstmt.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("login.jsp");
                } else {
                    errors.add("Error registering user.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                errors.add("Database error: " + e.getMessage());
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        }
    }

    // Hiển thị lỗi nếu có
    if (!errors.isEmpty()) {
        out.println("<div class='mt-3'>");
        for (String error : errors) {
            out.println("<p class='text-danger'>" + error + "</p>");
        }
        out.println("</div>");
    }
%>