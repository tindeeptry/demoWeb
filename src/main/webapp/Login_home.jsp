<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || role == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chính</title>
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
        <a class="navbar-brand" href="#">CLB Tin Học</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <span class="nav-link">Chào mừng, <%= username %></span>
                </li>
                <li class="nav-item">
                    <button class="btn btn-danger" onclick="confirmLogout()">Đăng xuất</button>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container mt-4">
    <h1>Xin chào <%= username %>!</h1>
    <p>Vai trò của bạn: <%= role %></p>
    <p>Chào mừng bạn đến với CLB Tin Học.</p>
    <a href="ViewCourses.jsp" class="btn btn-primary">Xem các khoá học</a>
    <a href="ViewTeachers.jsp" class="btn btn-secondary">Xem giáo viên</a>
	<a href="ViewClasses.jsp" class="btn btn-secondary">Xem lớp</a>
	<a href="ViewStudents.jsp" class="btn btn-secondary">Xem sinh viên</a>
	<a href="ViewActivities.jsp" class="btn btn-secondary">Xem hoạt động</a>
	<a href="ViewScores.jsp" class="btn btn-secondary">Xem điểm</a>
	<a href="ViewCtb.jsp" class="btn btn-secondary">Xem đóng góp</a>
</div>
</body>
</html>
