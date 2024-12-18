<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.Students" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String username = "root";
    String password = "Tien0610";

    String MaSV = request.getParameter("MaSV");
    Students student = null;

    try (Connection connection = DriverManager.getConnection(dbURL, username, password);
         PreparedStatement stmt = connection.prepareStatement("SELECT * FROM SinhVien WHERE MaSV = ?")) {
        stmt.setString(1, MaSV);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                student = new Students(
                    rs.getString("MaSV"),
                    rs.getString("MaLop"),
                    rs.getString("TenSV"),
                    rs.getString("email"),
                    rs.getString("SDT"),
                    rs.getString("DOB"),
                    rs.getString("DiaChi")
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
    <input type="hidden" name="MaSV" value="<%= student != null ? student.getMaSV() : "" %>">
    Mã lớp: <input type="text" name="MaLop" value="<%= student != null ? student.getMaLop() : "" %>" required><br>
    Name: <input type="text" name="TenSV" value="<%= student != null ? student.getTenSV() : "" %>" required><br>
    Email: <input type="email" name="email" value="<%= student != null ? student.getEmail() : "" %>" required><br>
    SĐT: <input type="tel" name="SDT" value="<%= student != null ? student.getSDT() : "" %>"><br>
    DOB: <input type="date" name="DOB" value="<%= student != null ? student.getDOB() : "" %>"><br>
    Địa chỉ: <input type="text" name="DiaChi" value="<%= student != null ? student.getDiaChi() : "" %>"><br>
    <input type="submit" value="Cập nhật">
</form>
</body>
</html>
