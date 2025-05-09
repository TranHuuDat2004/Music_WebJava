package musicart.com.musicart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/edit-singer")
public class EditSingerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String singerId = request.getParameter("id");
        if (singerId == null || singerId.isEmpty()) {
            response.sendRedirect("error.jsp");
            return;
        }

        try (Connection conn = connectDB.getConnection()) {
            String sql = "SELECT * FROM singer WHERE singer_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, singerId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("singer_id", rs.getInt("singer_id"));
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("age", rs.getInt("age"));
                request.setAttribute("image", rs.getString("image"));
                request.setAttribute("description", rs.getString("description"));
            } else {
                response.sendRedirect("not-found.jsp");
                return;
            }

            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }

        request.getRequestDispatcher("edit-singer.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String singerId = request.getParameter("singer_id");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String description = request.getParameter("description");
        String image = request.getParameter("image");

        try (Connection conn = connectDB.getConnection()) {
            String sql = "UPDATE singer SET name = ?, age = ?, description = ?, image = ? WHERE singer_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setInt(2, Integer.parseInt(age));
            stmt.setString(3, description);
            stmt.setString(4, image);
            stmt.setString(5, singerId);

            int rowsUpdated = stmt.executeUpdate();
            stmt.close();

            if (rowsUpdated > 0) {
                response.sendRedirect("success.jsp");
            } else {
                response.sendRedirect("not-found.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
