<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="musicart.com.musicart.connectDB" %>

<%
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;

  List<String> chartSongTitles = new ArrayList<>();
  List<Integer> chartSongViews = new ArrayList<>();
  List<String> top5Titles = new ArrayList<>();
  List<Integer> top5Views = new ArrayList<>();

  try {
    conn = connectDB.getConnection();
    stmt = conn.createStatement();

    // Lấy 15 bài hát ngẫu nhiên để hiển thị biểu đồ
    rs = stmt.executeQuery("SELECT title, views FROM Song ORDER BY RAND() LIMIT 15");
    while (rs.next()) {
      chartSongTitles.add(rs.getString("title"));
      chartSongViews.add(rs.getInt("views"));
    }
    rs.close();

    // Lấy top 5 bài hát có lượt xem cao nhất
    rs = stmt.executeQuery("SELECT title, views FROM Song ORDER BY views DESC LIMIT 5");
    while (rs.next()) {
      top5Titles.add(rs.getString("title"));
      top5Views.add(rs.getInt("views"));
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    try {
      if (rs != null) rs.close();
      if (stmt != null) stmt.close();
      if (conn != null) conn.close();
    } catch (SQLException ex) {
      ex.printStackTrace();
    }
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Top Songs</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    .chart-container {
      width: 100%;
      max-width: 800px;
      margin: 20px auto;
    }
    table {
      width: 80%;
      margin: 20px auto;
      border-collapse: collapse;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }
    th {
      background-color: #f4f4f4;
    }
    .trophy {
      font-size: 20px;
    }
    .diamond { color: #b9e2f5; }
    .gold { color: #ffd700; }
    .silver { color: #c0c0c0; }
    .bronze { color: #cd7f32; }
    .clay { color: #d3a78d; }
  </style>
</head>
<body>
<h2 style="text-align: center;">Top Songs Overview</h2>

<!-- Biểu đồ -->
<div class="chart-container">
  <canvas id="songChart"></canvas>
</div>

<!-- Bảng Top 5 -->
<h3 style="text-align: center;">Top 5 Songs</h3>
<table>
  <thead>
  <tr>
    <th>Rank</th>
    <th>Song Title</th>
    <th>Views</th>
    <th>Trophy</th>
  </tr>
  </thead>
  <tbody>
  <%
    String[] trophyClasses = { "diamond", "gold", "silver", "bronze", "clay" };
    for (int i = 0; i < top5Titles.size(); i++) {
  %>
  <tr>
    <td><%= i + 1 %></td>
    <td><%= top5Titles.get(i) %></td>
    <td><%= top5Views.get(i) %></td>
    <td>
      <i class="fas fa-trophy trophy <%= trophyClasses[i] %>"></i>
    </td>
  </tr>
  <%
    }
  %>
  </tbody>
</table>

<script>
  // Truyền dữ liệu biểu đồ từ JSP
  const chartSongTitles = <%= new Gson().toJson(chartSongTitles) %>;
  const chartSongViews = <%= new Gson().toJson(chartSongViews) %>;

  // Vẽ biểu đồ
  const ctx = document.getElementById('songChart').getContext('2d');
  const songChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: chartSongTitles,
      datasets: [{
        label: 'Views',
        data: chartSongViews,
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        borderWidth: 1
      }]
    },
    options: {
      responsive: true,
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</body>
</html>
