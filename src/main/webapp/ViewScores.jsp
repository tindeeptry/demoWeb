<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String dbUser = "root";
    String dbPassword = "Tien0610";

    // Lấy danh sách sinh viên dựa trên tìm kiếm
    String searchName = request.getParameter("searchName");
    List<String[]> studentsList = new ArrayList<>();
    if (searchName != null && !searchName.isEmpty()) {
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
             PreparedStatement stmt = conn.prepareStatement("SELECT MaSV, TenSV FROM SinhVien WHERE TenSV LIKE ?")) {
            stmt.setString(1, "%" + searchName + "%");
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    studentsList.add(new String[]{rs.getString("MaSV"), rs.getString("TenSV")});
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy danh sách điểm của sinh viên được chọn
    String selectedStudent = request.getParameter("MaSV");
    List<String[]> scores = new ArrayList<>();
    if (selectedStudent != null && !selectedStudent.isEmpty()) {
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Lop_MonHoc WHERE MaSV = ?")) {
            stmt.setString(1, selectedStudent);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    scores.add(new String[]{
                        rs.getString("MaLopMonHoc"),
                        rs.getString("MaMH"),
                        String.valueOf(rs.getFloat("Diem"))
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
    <title>Danh sách điểm theo sinh viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Danh sách điểm theo sinh viên</h2>

    <!-- Form tìm kiếm sinh viên -->
    <form method="get" action="ViewScores.jsp" class="mb-3">
        <label for="searchName">Nhập tên sinh viên:</label>
        <input type="text" id="searchName" name="searchName" class="form-control" value="<%= searchName != null ? searchName : "" %>">
        <button type="submit" class="btn btn-primary mt-2">Tìm kiếm</button>
    </form>

    <!-- Hiển thị kết quả tìm kiếm -->
    <% if (searchName != null && !studentsList.isEmpty()) { %>
        <form method="get" action="ViewScores.jsp">
            <input type="hidden" name="searchName" value="<%= searchName %>">
            <label for="MaSV">Chọn sinh viên:</label>
            <select name="MaSV" id="MaSV" class="form-select" onchange="this.form.submit()">
                <option value="">-- Chọn sinh viên --</option>
                <% for (String[] student : studentsList) { %>
                    <option value="<%= student[0] %>" <%= selectedStudent != null && selectedStudent.equals(student[0]) ? "selected" : "" %>>
                        <%= student[1] %> (<%= student[0] %>)
                    </option>
                <% } %>
            </select>
        </form>
    <% } else if (searchName != null) { %>
        <p>Không tìm thấy sinh viên nào với tên "<%= searchName %>".</p>
    <% } %>

    <!-- Hiển thị danh sách điểm -->
    <% if (selectedStudent != null && !scores.isEmpty()) { %>
        <h3>Điểm của sinh viên:</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Mã lớp môn học</th>
                    <th>Mã môn học</th>
                    <th>Điểm</th>
                </tr>
            </thead>
            <tbody>
                <% for (String[] score : scores) { %>
                    <tr>
                        <td><%= score[0] %></td>
                        <td><%= score[1] %></td>
                        <td><%= score[2] %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } else if (selectedStudent != null) { %>
        <p>Không có điểm nào cho sinh viên đã chọn.</p>
    <% } %>

    <a href="Login_home.jsp" class="btn btn-secondary mt-3">Quay lại</a>
</div>
</body>
</html>
