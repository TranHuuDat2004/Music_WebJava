package musicart.com.musicart;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/add-singer-post.jsp")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddSingerServlet extends HttpServlet {

    private static final String SAVE_DIR = "img"; // Thư mục lưu ảnh
    private static final String DB_URL = "jdbc:mysql://localhost:3306/musicart";
    private static final String DB_USER = "root"; // Thay bằng user của bạn
    private static final String DB_PASS = ""; // Thay bằng mật khẩu của bạn

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String description = request.getParameter("description");
        Part imagePart = request.getPart("image");

        String fileName = extractFileName(imagePart);
        String savePath = getServletContext().getRealPath("") + File.separator + SAVE_DIR;

        // Tạo thư mục nếu chưa tồn tại
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        try {
            // Lưu file ảnh vào thư mục webapp/img
            String filePath = savePath + File.separator + fileName;
            imagePart.write(filePath);

            // Lưu thông tin vào cơ sở dữ liệu
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                String sql = "INSERT INTO singer (name, age, image, description) VALUES (?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, name);
                statement.setInt(2, age);
                statement.setString(3, fileName); // Đường dẫn tương đối tới file ảnh
                statement.setString(4, description);

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    response.getWriter().println("Singer added successfully!");
                }
            }
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    // Hàm lấy tên file từ Part
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "default.jpg"; // Tên file mặc định nếu không tìm thấy
    }
}
