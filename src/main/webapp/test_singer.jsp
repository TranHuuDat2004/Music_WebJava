<%@ page import="java.sql.*, musicart.com.musicart.connectDB" %>

<%
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Danh sách ca sĩ</title>
  <style>
    table {
      width: 100%;
      border-collapse: collapse;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }
    th {
      background-color: #f2f2f2;
    }
  </style>
</head>
<body>
<h2>Danh sách ca sĩ</h2>
<table>
  <tr>
    <th>ID</th>
    <th>Tên</th>
    <th>Ảnh</th>
    <th>Tuổi</th>
    <th>Mô tả</th>
  </tr>
  <%
    try {
      conn = connectDB.getConnection();
      String query = "SELECT singer_id, name, image, age, description FROM singer";
      stmt = conn.createStatement();
      rs = stmt.executeQuery(query);

      while (rs.next()) {
        int id = rs.getInt("singer_id");
        String name = rs.getString("name");
        String image = rs.getString("image");
        int age = rs.getInt("age");
        String description = rs.getString("description");
  %>
  <tr>
    <td><%= id %></td>
    <td><%= name %></td>
    <td><img src="img/<%= image %>" alt="<%= name %>" width="100"></td>
    <td><%= age %></td>
    <td><%= description %></td>
  </tr>
  <%
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (rs != null) rs.close();
      if (stmt != null) stmt.close();
      if (conn != null) conn.close();
    }
  %>
</table>
</body>
</html>