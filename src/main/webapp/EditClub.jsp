<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.Club" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String username = "root";
    String password = "Tien0610";

    String MaHD = request.getParameter("MaHD");
    Club club = null;

    try (Connection connection = DriverManager.getConnection(dbURL, username, password);
         PreparedStatement stmt = connection.prepareStatement("SELECT * FROM HoatDong_CLB WHERE MaHD = ?")) {
        stmt.setString(1, MaHD);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                club = new Club(
                    rs.getString("MaHD"),
                    rs.getString("TenHD"),
                    rs.getString("NgayToChuc")
                );
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<html>
<head>
    <title>Chỉnh sửa Sinh viên</title>
</head>
<body>
<h2>Chỉnh sửa Sinh viên</h2>
<form action="hocvien" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="MaHD" value="<%= club != null ? club.getMaHD() : "" %>">
    Name: <input type="text" name="TenHD" value="<%= club != null ? club.getTenHD() : "" %>"><br>
    Email: <input type="date" name="NgayToChuc" value="<%= club != null ? club.getNgayToChuc() : "" %>"><br>
    <input type="submit" value="Cập nhật">
</form>
</body>
</html>
  