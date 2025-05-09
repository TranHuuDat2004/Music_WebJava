<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.sql.*" %>
<%@ page import="musicart.com.musicart.connectDB" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>
        Dashboard
    </title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-gray-100 font-sans leading-normal tracking-normal">
<div class="flex flex-col md:flex-row"">
            <!-- Sidebar -->
    <%
    // Lấy tên file hiện tại từ URL
    String currentPage = request.getRequestURI();
%>
    <%@ include file="Sidebar.jsp" %>
    <!-- Main Content -->
    <div class="flex-1 p-6">
        <!-- Top Bar -->
        <%@ include file="topbar.jsp" %>
        <!-- Add Singer Form -->
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-xl font-semibold mb-4">Add Singer</h2>
            <form action="add-singer-post.jsp" method="post" enctype="multipart/form-data">
                <div class="grid grid-cols-2 gap-4 mb-4">
                    <div>
                        <label class="block text-gray-700">Name Singer</label>
                        <input name="name" class="w-full py-2 px-4 rounded-lg border border-gray-300" type="text" placeholder="Enter singer name"/>
                    </div>
                    <div>
                        <label class="block text-gray-700">Age</label>
                        <input name="age" class="w-full py-2 px-4 rounded-lg border border-gray-300" type="number" placeholder="Enter age"/>
                    </div>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700">Description</label>
                    <textarea name="description" class="w-full py-2 px-4 rounded-lg border border-gray-300" rows="4" placeholder="Enter description"></textarea>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700">Image</label>
                    <input name="image" class="w-full py-2 px-4 rounded-lg border border-gray-300" type="file"/>
                </div>
                <button class="bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600" type="submit">Add Singer</button>
            </form>
        </div>
    </div>
</div>
<script>
    // Revenue Line Chart
    const ctxRevenue = document.getElementById('revenueChart').getContext('2d');
    const revenueChart = new Chart(ctxRevenue, {
        type: 'line',
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
            datasets: [{
                label: 'Revenue',
                data: [1200, 1900, 3000, 5000, 2000, 3000, 4500],
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                fill: true,
                tension: 0.1
            }]
        },
        options: {
            responsive: true,
            scales: {
                x: {
                    beginAtZero: true
                },
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Best Seller Pie Chart
    const ctxBestSeller = document.getElementById('bestSellerChart').getContext('2d');
    const bestSellerChart = new Chart(ctxBestSeller, {
        type: 'pie',
        data: {
            labels: ['Product A', 'Product B', 'Product C', 'Product D'],
            datasets: [{
                label: 'Best Seller',
                data: [300, 50, 100, 150],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true
        }
    });
</script>
</body>
</html>