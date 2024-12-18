<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String dbUser = "root";
    String dbPassword = "Tien0610";

    List<String[]> ctbs = new ArrayList<>();
    try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT * FROM XepHang_TichCuc")) {
        while (rs.next()) {
            ctbs.add(new String[]{rs.getString("MaXH"), rs.getString("MaSV"), String.valueOf(rs.getInt("SoHoatDong"))});
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách khoá học</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Danh sách khoá học</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Mã xếp hạng</th>
                <th>Mã sinh viên</th>
                <th>Số hoạt động đã tham gia</th>
            </tr>
        </thead>
        <tbody>
            <% if (ctbs.isEmpty()) { %>
                <tr>
                    <td colspan="3">Không có khoá học nào.</td>
                </tr>
            <% } else { %>
                <% for (String[] ctb : ctbs) { %>
                    <tr>
                        <td><%= ctb[0] %></td>
                        <td><%= ctb[1] %></td>
                        <td><%= ctb[2] %></td>
                    </tr>
                <% } %>
            <% } %>
        </tbody>
    </table>
    <a href="Home_Login.jsp" class="btn btn-secondary">Quay lại</a>
</div>
</body>
</html>
