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

@WebServlet("/add-song-post.jsp")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddSongServlet extends HttpServlet {

    private static final String SAVE_DIR = "audio"; // Thư mục lưu file bài hát
    private static final String SAVE_DIR2 = "img"; // Thư mục lưu ảnh

    private static final String DB_URL = "jdbc:mysql://localhost:3306/musicart";
    private static final String DB_USER = "root"; // Thay bằng user của bạn
    private static final String DB_PASS = ""; // Thay bằng mật khẩu của bạn

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String singer = request.getParameter("singer");
        String description = request.getParameter("description");
        Part audioPart = request.getPart("file");
        Part imagePart = request.getPart("image");

        String audioFileName = extractFileName(audioPart);
        String imageFileName = extractFileName(imagePart);

        String audioSavePath = getServletContext().getRealPath("") + File.separator + SAVE_DIR;
        String imageSavePath = getServletContext().getRealPath("") + File.separator + SAVE_DIR2;

        File audioDir = new File(audioSavePath);
        if (!audioDir.exists()) {
            audioDir.mkdir();
        }

        File imageDir = new File(imageSavePath);
        if (!imageDir.exists()) {
            imageDir.mkdir();
        }

        try {
            String audioFilePath = audioSavePath + File.separator + audioFileName;
            audioPart.write(audioFilePath);

            String imageFilePath = imageSavePath + File.separator + imageFileName;
            imagePart.write(imageFilePath);

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                String sql = "INSERT INTO song (title, singer, description, file_name, image, views) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, title);
                statement.setString(2, singer);
                statement.setString(3, description);
                statement.setString(4, audioFileName);
                statement.setString(5, imageFileName);
                statement.setInt(6, 0);

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    response.setContentType("text/html;charset=UTF-8");
                    response.getWriter().println("<h3>Song added successfully!</h3>");
                    response.getWriter().println("<p>Audio file saved as: " + audioFileName + "</p>");
                    response.getWriter().println("<p>Image file saved as: " + imageFileName + "</p>");
                }
            } catch (Exception e) {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("Database error: " + e.getMessage());
            }
        } catch (Exception e) {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("File upload error: " + e.getMessage());
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "default.mp3";
    }

}