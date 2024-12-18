<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.Teachers" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String username = "root";
    String password = "Tien0610";

    String MaGV = request.getParameter("MaGV");
    Teachers teacher = null;

    try (Connection connection = DriverManager.getConnection(dbURL, username, password);
         PreparedStatement stmt = connection.prepareStatement("SELECT * FROM GIAOVIEN WHERE MaGV = ?")) {
        stmt.setString(1, MaGV);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                teacher = new Teachers(
                    rs.getString("MaGV"),
                    rs.getString("TenGV"),
                    rs.getString("SDT"),
                    rs.getString("email"),                    
                    rs.getString("DOB")
                );
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<html>
<head>
    <title>Chỉnh sửa Giáo viên</title>
</head>
<body>
<h2>Chỉnh sửa Giáo viên</h2>
<form action="giaovien" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="MaGV" value="<%= teacher != null ? teacher.getMaGV() : "" %>">
    Name: <input type="text" name="TenGV" value="<%= teacher != null ? teacher.getTenGV() : "" %>" required><br>
    SĐT: <input type="tel" name="SDT" value="<%= teacher != null ? teacher.getSDT() : "" %>"><br>
    Email: <input type="email" name="email" value="<%= teacher != null ? teacher.getEmail() : "" %>" required><br>    
    DOB: <input type="date" name="DOB" value="<%= teacher != null ? teacher.getDOB() : "" %>"><br>
    <input type="submit" value="Cập nhật">
</form>
</body>
</html>
