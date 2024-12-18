<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.Contribution" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String username = "root";
    String password = "Tien0610";

    String MaXH = request.getParameter("MaXH");
    Contribution ctb = null;

    try (Connection connection = DriverManager.getConnection(dbURL, username, password);
         PreparedStatement stmt = connection.prepareStatement("SELECT * FROM XepHang_TichCuc WHERE MaXH = ?")) {
        stmt.setString(1, MaXH);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                ctb = new Contribution(
                    rs.getString("MaXH"),
                    rs.getString("MaSV"),
                    rs.getInt("SoHoatDong")
                );
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<html>
<head>
    <title>Chỉnh sửa đóng góp</title>
</head>
<body>
<h2>Chỉnh sửa đóng góp</h2>
<form action="donggop" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="MaXH" value="<%= ctb != null ? ctb.getMaXH() : "" %>">
    Mã sinh viên:<input type="text" name="MaSV" value="<%= ctb != null ? ctb.getMaSV() : "" %>">
    Số hoạt động:<input type="number" name="SoHoatDong" value="<%= ctb != null ? ctb.getSoHoatDong() : "" %>">
    <input type="submit" value="Cập nhật">
    <a href="CTBShow.jsp">Hủy bỏ</a>
    </form>
</body>
</html>
