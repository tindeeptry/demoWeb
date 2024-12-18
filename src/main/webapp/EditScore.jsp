<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.Score" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String username = "root";
    String password = "Tien0610";

    String MaLopMonHoc = request.getParameter("MaLopMonHoc");
    Score score = null;

    try (Connection connection = DriverManager.getConnection(dbURL, username, password);
         PreparedStatement stmt = connection.prepareStatement("SELECT * FROM Lop_MonHoc WHERE MaLopMonHoc = ?")) {
        stmt.setString(1, MaLopMonHoc);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                score = new Score(
                    rs.getString("MaLopMonHoc"),
                    rs.getString("MaLop"),
                    rs.getString("MaMH"),
                    rs.getString("MaSV"),
                    rs.getFloat("Diem") // Cột `Diem` thay vì `MaDiem`
                );
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<html>
<head>
    <title>Chỉnh sửa lớp môn học</title>
</head>
<body>
<h2>Chỉnh sửa lớp môn học</h2>
<%
    if (score == null) {
%>
    <p style="color: red;">Không tìm thấy thông tin lớp môn học với mã: <%= MaLopMonHoc %></p>
<%
    } else {
%>
    <form action="diem" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="MaLopMonHoc" value="<%= score.getMaLopMonHoc() %>">
        Mã lớp: <input type="text" name="MaLop" value="<%= score.getMaLop() %>"><br>
        Mã môn học: <input type="text" name="MaMH" value="<%= score.getMaMH() %>"><br>
        Mã sinh viên: <input type="text" name="MaSV" value="<%= score.getMaSV() %>"><br>
        Điểm: <input type="number" step="0.01" name="Diem" value="<%= score.getDiem() %>"><br>
        <input type="submit" value="Cập nhật">
    </form>
<%
    }
%>
</body>
</html>
