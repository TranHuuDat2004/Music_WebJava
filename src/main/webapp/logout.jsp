<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate(); // Xóa toàn bộ session
    response.sendRedirect("index.jsp"); // Chuyển hướng về trang chủ
%>
