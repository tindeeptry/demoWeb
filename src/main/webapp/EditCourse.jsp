<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.Courses" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String username = "root";
    String password = "Tien0610";

    String MaKH = request.getParameter("MaKH");
    Courses course = null;

    try (Connection connection = DriverManager.getConnection(dbURL, username, password);
         PreparedStatement stmt = connection.prepareStatement("SELECT * FROM Khoahoc WHERE MaKH = ?")) {
        stmt.setString(1, MaKH);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                course = new Courses(
                    rs.getString("MaKH"),
                    rs.getString("TenKH"),
                    rs.getString("NgayBatDau_N_H"),
                    rs.getString("NgayKetThuc_N_H")
                );
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<html lang="vi">
<head>
    <title>Chỉnh sửa Sinh viên</title>
</head>
<body>
<h2>Chỉnh sửa Sinh viên</h2>
<form action="khoahoc" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="MaKH" value="<%= course != null ? course.getMaKH() : "" %>">
    Name: <input type="text" name="TenKH" value="<%= course != null ? course.getTenKH() : "" %>" required><br>
    Ngày bắt đầu: <input type="date" name="NgayBatDau_N_H" value="<%= course != null ? course.getNgayBatDau_N_H() : "" %>" required><br>
    Ngày kết thúc: <input type="date" name="NgayKetThuc_N_H" value="<%= course != null ? course.getNgayKetThuc_N_H() : "" %>"><br>
    <input type="submit" value="Cập nhật">
</form>
</body>
</html>
