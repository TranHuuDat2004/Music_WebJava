<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="musicart.com.musicart.connectDB" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%
    // Kiểm tra nếu yêu cầu là multipart
    String contentType = request.getContentType();
    if (contentType != null && contentType.startsWith("multipart/form-data")) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Tạo thư mục upload nếu chưa tồn tại
            String audioUploadPath ="audio"; // Thư mục audio
            String imgUploadPath = "img"; // Thư mục img

            // Tạo các thư mục nếu chưa có
            new File(audioUploadPath).mkdirs();
            new File(imgUploadPath).mkdirs();

            // Đọc nội dung từ request
            String boundary = contentType.substring(contentType.indexOf("boundary=") + 9);
            boundary = "--" + boundary;

            InputStream inputStream = request.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));

            String line;
            String currentFieldName = null;
            String title = null, singer = null, description = null;
            String imageFileName = null, musicFileName = null;

            File currentFile = null;
            OutputStream fileOutputStream = null;

            while ((line = reader.readLine()) != null) {
                if (line.startsWith(boundary)) {
                    // Kết thúc file hiện tại
                    if (fileOutputStream != null) {
                        fileOutputStream.close();
                        fileOutputStream = null;
                    }

                    // Đọc tiêu đề phần tiếp theo
                    line = reader.readLine();
                    if (line != null && line.contains("Content-Disposition")) {
                        // Lấy tên field
                        int nameIndex = line.indexOf("name=\"") + 6;
                        int nameEndIndex = line.indexOf("\"", nameIndex);
                        currentFieldName = line.substring(nameIndex, nameEndIndex);

                        // Kiểm tra có phải file upload không
                        if (line.contains("filename=\"")) {
                            int fileIndex = line.indexOf("filename=\"") + 10;
                            int fileEndIndex = line.indexOf("\"", fileIndex);
                            String fileName = line.substring(fileIndex, fileEndIndex);

                            if (fileName != null && !fileName.isEmpty()) {
                                // Tạo file trong thư mục tương ứng
                                if ("image".equals(currentFieldName)) {
                                    imageFileName = fileName;
                                    currentFile = new File(imgUploadPath + File.separator + fileName);
                                } else if ("file".equals(currentFieldName)) {
                                    musicFileName = fileName;
                                    currentFile = new File(audioUploadPath + File.separator + fileName);
                                }

                                if (currentFile != null) {
                                    fileOutputStream = new FileOutputStream(currentFile);
                                }
                            }
                        }
                    }
                } else if (line.isEmpty()) {
                    // Bỏ qua dòng trống
                    continue;
                } else if (fileOutputStream != null) {
                    // Ghi dữ liệu file
                    fileOutputStream.write(line.getBytes("UTF-8"));
                    fileOutputStream.write("\r\n".getBytes("UTF-8"));
                } else if (currentFieldName != null) {
                    // Đọc giá trị trường text
                    if ("title".equals(currentFieldName)) {
                        title = line.trim();
                    } else if ("singer".equals(currentFieldName)) {
                        singer = line.trim();
                    } else if ("description".equals(currentFieldName)) {
                        description = line.trim();
                    }
                }
            }

            // Kiểm tra nếu thiếu dữ liệu
            if (title == null || title.trim().isEmpty() ||
                singer == null || singer.trim().isEmpty() ||
                description == null || description.trim().isEmpty() ||
                imageFileName == null || imageFileName.trim().isEmpty() ||
                musicFileName == null || musicFileName.trim().isEmpty()) {

                out.println("<p style='color: red;'>Please fill in all required fields!</p>");
            } else {
                // Kết nối cơ sở dữ liệu
                conn = connectDB.getConnection();

                // Câu lệnh SQL để chèn dữ liệu
                String sql = "INSERT INTO song (title, singer, description, file_name, image, views) VALUES (?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);

                // Gán giá trị (chỉ lưu tên file)
                pstmt.setString(1, title);
                pstmt.setString(2, singer);
                pstmt.setString(3, description);
                pstmt.setString(4, musicFileName); // Chỉ lưu tên file nhạc
                pstmt.setString(5, imageFileName); // Chỉ lưu tên file ảnh
                pstmt.setInt(6, 0); // Gán giá trị mặc định cho cột views

                // Thực thi
                int rowsInserted = pstmt.executeUpdate();

                if (rowsInserted > 0) {
                    out.println("<p style='color: green;'>Song added successfully!</p>");
                } else {
                    out.println("<p style='color: red;'>Failed to add song. Please try again.</p>");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color: red;'>An error occurred: " + e.getMessage() + "</p>");
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    } else {
        out.println("<p style='color: red;'>Invalid request!</p>");
    }
%>

<!-- Thêm liên kết quay lại -->
<a href="add-song.jsp" style="color: blue; text-decoration: underline;">Back to Add Song Form</a>
