<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.Class" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String username = "root";
    String password = "Tien0610";

    String MaLop = request.getParameter("MaLop");
    Class clas = null;

    try (Connection connection = DriverManager.getConnection(dbURL, username, password);
         PreparedStatement stmt = connection.prepareStatement("SELECT * FROM Lop WHERE MaLop = ?")) {
        stmt.setString(1, MaLop);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                clas = new Class(
                    rs.getString("MaLop"),
                    rs.getString("TenLop"),
                    rs.getString("MaKH")
                );
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<html>
<head>
    <title>Chỉnh sửa lớp học</title>
</head>
<body>
<h2>Chỉnh sửa lớp học</h2>
<form action="lop" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="MaLop" value="<%= clas != null ? clas.getMaLop() : "" %>">
    Tên lớp: <input type="text" name="TenLop" value="<%= clas != null ? clas.getTenLop() : "" %>"><br>
    Mã khoá học: <input type="text" name="NgayToChuc" value="<%= clas != null ? clas.getMaKH() : "" %>"><br>
    <input type="submit" value="Cập nhật">
</form>
</body>
</html>
  