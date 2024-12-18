<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Score" %>
<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
%>

<html lang="vi">
<head>	
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Sinh Viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <script>
        // Xử lý nút đăng xuất
        function confirmLogout() {
            const confirmed = confirm("Bạn chắc chắn muốn đăng xuất?");
            if (confirmed) {
                // Nếu đồng ý, chuyển hướng về trang đăng nhập
                window.location.href = "Home.jsp";
            }
        }
    </script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="Home_Login.jsp">CLB Tin Học</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <%
                            if (username != null) {
                        %>
                            <a class="btn btn-primary me-2" href="#" role="button">Chào mừng <%= username %></a>
                        <%
                            } else {
                        %>
                            <a class="btn btn-primary" href="Login.jsp" role="button">Đăng nhập</a>
                        <%
                            }
                        %>
                </li>
                <li class="nav-item">
                    <button class="btn btn-danger" onclick="confirmLogout()">Đăng xuất</button>
                </li>
            </ul>
        </div>
    </div>
	</nav>
	
<h2>Điểm số Sinh viên</h2>
<table border="1">
    <tr>
        <th>Mã lớp môn học</th>
        <th>Mã Lớp</th>
        <th>Mã môn học</th>
        <th>Mã sinh viên</th>
        <th>Điểm</th>
        <th>Hành động</th>
    </tr>
    
    <%
    List<Score> scoreList = (List<Score>) request.getAttribute("scoreList");
    if (scoreList != null && !scoreList.isEmpty()) {
        for (Score score : scoreList) {
    %>
        <tr>
            <td><%= score.getMaLopMonHoc() %></td>
            <td><%= score.getMaLop() %></td>
            <td><%= score.getMaMH() %></td>
            <td><%= score.getMaSV() %></td>
            <td><%= score.getDiem() %></td>    
            <td>
                <!-- Form sửa -->
                <form action="EditScore.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="MaLopMonHoc" value="<%= score.getMaLopMonHoc() %>">
                    <input type="submit" value="Sửa">
                </form>
                <!-- Form xóa -->
                <form action="diem" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="MaLopMonHoc" value="<%= score.getMaLopMonHoc() %>">
                    <input type="submit" value="Xóa">
                </form>
            </td>
        </tr>
    <%
        }
    } else {
    %>
        <tr>
            <td colspan="6">Không có dữ liệu</td>
        </tr>
    <%
    }
    %>
</table>

<h2>Thêm điểm</h2>
<form action="InsertScore.jsp" method="get">
    <input type = "submit" value = "thêm sinh viên">
</form>
</body>
</html>
