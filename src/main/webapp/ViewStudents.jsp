<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String dbUser = "root";
    String dbPassword = "Tien0610";

    // Lấy danh sách lớp
    List<String[]> classes = new ArrayList<>();
    try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT MaLop, TenLop FROM Lop")) {
        while (rs.next()) {
            classes.add(new String[]{rs.getString("MaLop"), rs.getString("TenLop")});
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    // Lấy danh sách sinh viên theo lớp
    String selectedClass = request.getParameter("MaLop");
    List<String[]> students = new ArrayList<>();
    if (selectedClass != null && !selectedClass.isEmpty()) {
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM SinhVien WHERE MaLop = ?")) {
            stmt.setString(1, selectedClass);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    students.add(new String[]{
                        rs.getString("MaSV"),
                        rs.getString("TenSV"),
                        rs.getString("email"),
                        rs.getString("SDT"),
                        rs.getString("DOB"),
                        rs.getString("DiaChi")
                    });
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
    <title>Danh sách sinh viên theo lớp</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Danh sách sinh viên theo lớp</h2>

    <!-- Form chọn lớp -->
    <form method="get" action="ViewStudents.jsp" class="mb-3">
        <label for="MaLop">Chọn lớp:</label>
        <select name="MaLop" id="MaLop" class="form-select" onchange="this.form.submit()">
            <option value="">-- Chọn --</option>
            <% for (String[] clazz : classes) { %>
                <option value="<%= clazz[0] %>" <%= selectedClass != null && selectedClass.equals(clazz[0]) ? "selected" : "" %>>
                    <%= clazz[1] %>
                </option>
            <% } %>
        </select>
    </form>

    <!-- Hiển thị danh sách sinh viên -->
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Mã sinh viên</th>
                <th>Tên sinh viên</th>
                <th>Email</th>
                <th>Số điện thoại</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
            </tr>
        </thead>
        <tbody>
            <% if (students.isEmpty()) { %>
                <tr>
                    <td colspan="6">Không có sinh viên trong lớp này.</td>
                </tr>
            <% } else { %>
                <% for (String[] student : students) { %>
                    <tr>
                        <td><%= student[0] %></td>
                        <td><%= student[1] %></td>
                        <td><%= student[2] %></td>
                        <td><%= student[3] %></td>
                        <td><%= student[4] %></td>
                        <td><%= student[5] %></td>
                    </tr>
                <% } %>
            <% } %>
        </tbody>
    </table>

    <a href="Login_home.jsp" class="btn btn-secondary">Quay lại</a>
</div>
</body>
</html>
