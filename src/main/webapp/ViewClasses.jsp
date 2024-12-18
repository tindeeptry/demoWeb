<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String dbUser = "root";
    String dbPassword = "Tien0610";

    // Lấy danh sách khóa học
    List<String[]> courses = new ArrayList<>();
    try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT MaKH, TenKH FROM Khoahoc")) {
        while (rs.next()) {
            courses.add(new String[]{rs.getString("MaKH"), rs.getString("TenKH")});
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    // Lấy danh sách lớp theo khóa
    String selectedCourse = request.getParameter("MaKH");
    List<String[]> classes = new ArrayList<>();
    if (selectedCourse != null && !selectedCourse.isEmpty()) {
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Lop WHERE MaKH = ?")) {
            stmt.setString(1, selectedCourse);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    classes.add(new String[]{rs.getString("MaLop"), rs.getString("TenLop")});
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách lớp theo khóa</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Danh sách lớp theo khóa</h2>

    <!-- Form chọn khóa học -->
    <form method="get" action="ViewClasses.jsp" class="mb-3">
        <label for="MaKH">Chọn khóa học:</label>
        <select name="MaKH" id="MaKH" class="form-select" onchange="this.form.submit()">
            <option value="">-- Chọn --</option>
            <% for (String[] course : courses) { %>
                <option value="<%= course[0] %>" <%= selectedCourse != null && selectedCourse.equals(course[0]) ? "selected" : "" %>>
                    <%= course[1] %>
                </option>
            <% } %>
        </select>
    </form>

    <!-- Hiển thị danh sách lớp -->
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Mã lớp</th>
                <th>Tên lớp</th>
            </tr>
        </thead>
        <tbody>
            <% if (classes.isEmpty()) { %>
                <tr>
                    <td colspan="2">Không có lớp nào thuộc khóa học này.</td>
                </tr>
            <% } else { %>
                <% for (String[] clazz : classes) { %>
                    <tr>
                        <td><%= clazz[0] %></td>
                        <td><%= clazz[1] %></td>
                    </tr>
                <% } %>
            <% } %>
        </tbody>
    </table>

    <a href="Login_home.jsp" class="btn btn-secondary">Quay lại</a>
</div>
</body>
</html>
