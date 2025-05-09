package musicart.com.musicart;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class connectDB {
    private static final String URL = "jdbc:mysql://localhost:3306/musicart";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
