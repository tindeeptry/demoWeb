<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String dbUser = "root";
    String dbPassword = "Tien0610";

    List<String[]> teachers = new ArrayList<>();
    try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT * FROM GIAOVIEN")) {
        while (rs.next()) {
            teachers.add(new String[]{rs.getString("MaGV"), rs.getString("TenGV"), rs.getString("SDT"), rs.getString("Email"), rs.getString("DOB")});
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách giáo viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Danh sách giáo viên</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Mã GV</th>
                <th>Tên GV</th>
                <th>Số điện thoại</th>
                <th>Email</th>
                <th>Ngày tháng năm sinh</th>
            </tr>
        </thead>
        <tbody>
            <% if (teachers.isEmpty()) { %>
                <tr>
                    <td colspan="4">Không có giáo viên nào.</td>
                </tr>
            <% } else { %>
                <% for (String[] teacher : teachers) { %>
                    <tr>
                        <td><%= teacher[0] %></td>
                        <td><%= teacher[1] %></td>
                        <td><%= teacher[2] %></td>
                        <td><%= teacher[3] %></td>
                        <td><%= teacher[4] %></td>
                    </tr>
                <% } %>
            <% } %>
        </tbody>
    </table>
    <a href="Login_home.jsp" class="btn btn-secondary">Quay lại</a>
</div>
</body>
</html>
