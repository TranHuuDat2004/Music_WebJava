package musicart.com.musicart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete-singer")
public class DeleteSingerServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/musicart";
    private static final String DB_USER = "root"; // Thay bằng user của bạn
    private static final String DB_PASS = ""; // Thay bằng mật khẩu của bạn

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String singerId = request.getParameter("id");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            String sql = "DELETE FROM singer WHERE singer_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, singerId);

            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted > 0) {
                response.getWriter().println("Singer deleted successfully!");
            } else {
                response.getWriter().println("Singer not found!");
            }
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
