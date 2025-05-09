<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="musicart.com.musicart.connectDB" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Modern Music</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
    .table-row {
    cursor: pointer;
    transition: background-color 0.3s;
}

.table-row:nth-child(even) {
    background-color: #ffffff; /* Dòng chẵn */
}

.table-row:nth-child(odd) {
    background-color: #f9f9f9; /* Dòng lẻ */
}

.table-row:hover {
    background-color: #e0e0e0; /* Hover */
    color: #000; /* Đổi màu chữ khi hover */
}

.table-cell {
    padding: 12px;
    border-bottom: 1px solid #ddd;
    display: flex;
    align-items: center;
}

.bg-white {
    background-color: #ffffff;
}

.p-6 {
    padding: 1.5rem;
}

.rounded-lg {
    border-radius: 0.75rem;
}

.shadow-md {
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Base Button Styles */
.btn3 {
    display: inline-block !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    text-align: center !important;
    padding: 10px 20px !important;
    border-radius: 8px !important;
    cursor: pointer !important;
    transition: background-color 0.3s, color 0.3s, transform 0.2s !important;
    border: none !important;
    outline: none !important;
    width: 150px !important;
}

/* Primary Button Styles */
.btn3-primary {
    background-color: #007bff !important;
    color: #ffffff !important;
    box-shadow: 0 4px 6px rgba(0, 123, 255, 0.2) !important;
    margin:10px !important;
    padding: 10px !important;

}

.btn3-primary:hover {
    background-color: #0056b3 !important;
    box-shadow: 0 6px 8px rgba(0, 86, 179, 0.3) !important;
    transform: scale(1.05) !important;
}

.btn3-primary:active {
    background-color: #003f7f !important;
    transform: scale(0.98) !important;
}

/* Secondary Button Styles */
.btn3-secondary {
    background-color: #6c757d !important;
    color: #ffffff !important;
    box-shadow: 0 4px 6px rgba(108, 117, 125, 0.2) !important;
    margin:10px !important;
    padding: 10px !important;
}

.btn3-secondary:hover {
    background-color: #565e64 !important;
    box-shadow: 0 6px 8px rgba(86, 94, 100, 0.3) !important;
    transform: scale(1.05) !important;
}

.btn3-secondary:active {
    background-color: #3e4347 !important;
    transform: scale(0.98) !important;
}


</style>
<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

        <!-- ##### Header Area Start ##### -->
        <%@ include file="header.jsp" %>

    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what's new</p>
            <h2>Search</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- Search box -->
    <form action="search.jsp" class="search-bar relative w-full" method="POST" style="max-width: 1000px; margin: auto;">
        <!-- Input Box -->
        <div class="relative w-full mb-4">
            <input 
                class="w-full py-2 px-4 rounded-lg border border-gray-300" 
                name="data" 
                placeholder="Search for songs or singers" 
                required 
                type="text" 
                style="padding-right: 40px;"
            />
            <!-- Search Icon -->
            <i class="fas fa-search absolute top-2.5 right-4 text-gray-400" style="position: absolute; right: 12px; top: 12px;"></i>
        </div>
        <!-- Buttons -->
        <div class="flex justify-center gap-4">
            <button class="btn3 btn3-primary" name="btnSearchSong" type="submit">
                Search Songs
            </button>
            <button class="btn3 btn3-secondary" name="btnSearchSinger" type="submit">
                Search Singers
            </button>
        </div>
    </form>
           
    
    <%
    // Lấy dữ liệu từ form tìm kiếm
    String searchKeyword = request.getParameter("data");
    boolean searchSong = request.getParameter("btnSearchSong") != null;  // Kiểm tra nút tìm theo bài hát
    boolean searchSinger = request.getParameter("btnSearchSinger") != null;  // Kiểm tra nút tìm theo ca sĩ

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
        try {
            // Kết nối cơ sở dữ liệu
            conn = connectDB.getConnection();
            String sql = "";

            if (searchSong) {
                sql = "SELECT song_id, title, image, singer " +
                      "FROM song " +
                      "WHERE LOWER(title) LIKE ?";
            } else if (searchSinger) {
                sql = "SELECT singer_id, name, image " +
                      "FROM singer " +
                      "WHERE LOWER(name) LIKE ?";
            }

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + searchKeyword.toLowerCase() + "%");
            rs = pstmt.executeQuery();
%>
            <div class="result">
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h2 style="text-align:center" class="text-lg font-bold mb-4 text-gray-800">
                        Search Results
                    </h2>
                    <table style="width: 100%; border-collapse: collapse; margin: 1rem 0; font-size: 16px; font-family: Arial, sans-serif;">
                        <thead>
                            <tr style="background-color: #f4f4f4; text-align: left; color: #333;">
                                <th style="padding: 12px; border-bottom: 2px solid #ddd;">No.</th>
                                <% if (searchSong) { %>
                                    <th style="padding: 12px; border-bottom: 2px solid #ddd;">Title</th>
                                    <th style="padding: 12px; border-bottom: 2px solid #ddd;">Image</th>
                                    <th style="padding: 12px; border-bottom: 2px solid #ddd;">Singer</th>
                                <% } else if (searchSinger) { %>
                                    <th style="padding: 12px; border-bottom: 2px solid #ddd;">Singer Name</th>
                                    <th style="padding: 12px; border-bottom: 2px solid #ddd;">Image</th>
                                <% } %>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                int index = 1; 
                                if (!rs.isBeforeFirst()) { 
                            %>
                                <tr>
                                    <td colspan="4" style="text-align: center;">No results found for "<%= searchKeyword %>"</td>
                                </tr>
                            <% 
                                } else { 
                                    while (rs.next()) { 
                            %>
                                <tr class="table-row" style="cursor: pointer;" onclick="<%= searchSong ? "window.location.href='song-detail.jsp?id=" + rs.getInt("song_id") + "'" : "window.location.href='singer-detail.jsp?id=" + rs.getInt("singer_id") + "'" %>">
                                    <td style="padding: 12px;"><%= index++ %></td>
                                    <% if (searchSong) { %>
                                        <td>
                                            <div>
                                                <p class="font-semibold"><%= rs.getString("title") %></p>
                                            </div>
                                        </td>
                                        <td style="padding: 12px;"><img width="80" src="img/<%= rs.getString("image") %>" ></td>
                                        <td style="padding: 12px;"><%= rs.getString("singer") %></td>
                                    <% } else if (searchSinger) { %>
                                        <td>
                                            <div>
                                                <p class="font-semibold"><%= rs.getString("name") %></p>
                                            </div>
                                        </td>
                                        <td style="padding: 12px;"><img width="80" src="img/<%= rs.getString("image") %>" >
                                        </td>
                                    <% } %>
                                </tr>
                            <% 
                                    } 
                                } 
                            %>
                        </tbody>
                    </table>
                </div>
                
<%
        } catch (Exception e) {
%>
            <p style="color:red;">Error: <%= e.getMessage() %></p>
<%
            e.printStackTrace();
        } finally {
            // Đóng kết nối
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    } else {
%>
        <p style="color:blue;">Please enter a search keyword!</p>
<%
    }
%>

    <!-- ***** Elements Area End ***** -->


    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>

</html>