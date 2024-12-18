<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Courses" %>
<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
    String message = (String) request.getAttribute("message"); // Fetch message from request
%>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách khoá học</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <script>
        // Hiển thị thông báo khi xóa khóa học
        function confirmDelete(event, courseName) {
            event.preventDefault(); // Ngừng hành động mặc định (không gửi form ngay lập tức)
            const confirmed = confirm("Bạn chắc chắn muốn xóa khóa học " + courseName + "?");
            if (confirmed) {
                event.target.submit(); // Nếu xác nhận, gửi form xóa
            }
        }

        
    </script>
    <style>
        /* Custom styles for centering the form */
        .center-form {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="Home_Login.jsp">
            <img src="logotin.png" alt="CLB Tin Học" width="115" height="35" class="me-2">
            <span>CLB Tin Học</span>
        </a>
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

<div class="container">
    <h2 class="text-center ">Danh sách Khoá Học</h2>
    
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-primary">
                <tr>
                    <th>MaKH</th>
                    <th>TenKH</th>
                    <th>Ngày bắt đầu năm học</th>
                    <th>Ngày kết thúc năm học</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<Courses> courseList = (List<Courses>) request.getAttribute("courseList");
                if (courseList != null && !courseList.isEmpty()) {
                    for (Courses course : courseList) {
                %>
                <tr>
                    <td><%= course.getMaKH() %></td>
                    <td><%= course.getTenKH() %></td>
                    <td><%= course.getNgayBatDau_N_H() %></td>
                    <td><%= course.getNgayKetThuc_N_H() %></td>
                    <td>
                        <!-- Edit -->
                        <form action="EditCourse.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="MaKH" value="<%= course.getMaKH() %>">
                            <input type="submit" value="Sửa" class="btn btn-warning btn-sm">
                        </form>
                        <!-- Delete with Confirmation -->
                        <form action="khoahoc" method="post" style="display:inline;" onsubmit="confirmDelete(event, '<%= course.getTenKH() %>');">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="MaKH" value="<%= course.getMaKH() %>">
                            <input type="submit" value="Xóa" class="btn btn-danger btn-sm">
                        </form>
                        <!-- View Details -->
                        <form action="lop" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="select">
                            <input type="hidden" name="MaKH" value="<%= course.getMaKH() %>">
                            <input type="submit" value="Xem chi tiết" class="btn btn-info btn-sm">
                        </form>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5" class="text-center">Không có dữ liệu</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>

    <!-- Centered Add New Course Button -->
    <div class="text-center mt-4">
        <h2>Thêm mới Khoá Học</h2>
    </div>
    <div class="text-center">
        <form action="InsertCourse.jsp" method="get" onsubmit="showSuccessMessage()">
            <input type="submit" value="Thêm Khoá Học" class="btn btn-success">
        </form>
    </div>
</div>

</body>
</html>
