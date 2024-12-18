<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String dbUser = "root";
    String dbPassword = "Tien0610";

    List<String[]> courses = new ArrayList<>();
    try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT * FROM Khoahoc")) {
        while (rs.next()) {
            courses.add(new String[]{rs.getString("MaKH"), rs.getString("TenKH"), rs.getString("NgayBatDau_N_H"), rs.getString("NgayKetThuc_N_H")});
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
                <th>Mã khoá học</th>
                <th>Tên khoá học</th>
                <th>Ngày Bắt đầu năm học</th>
                <th>Ngày kết thúc năm học</th>
            </tr>
        </thead>
        <tbody>
            <% if (courses.isEmpty()) { %>
                <tr>
                    <td colspan="3">Không có khoá học nào.</td>
                </tr>
            <% } else { %>
                <% for (String[] course : courses) { %>
                    <tr>
                        <td><%= course[0] %></td>
                        <td><%= course[1] %></td>
                        <td><%= course[2] %></td>
                        <td><%= course[3] %></td>
                    </tr>
                <% } %>
            <% } %>
        </tbody>
    </table>
    <a href="Home_Login.jsp" class="btn btn-secondary">Quay lại</a>
</div>
</body>
</html>
