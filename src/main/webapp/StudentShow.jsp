<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Students" %>
<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
%>

<!DOCTYPE html>
<html lang="vi">
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Sinh Viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        table {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        th {
            font-size: 1rem;
            font-weight: bold;
            text-transform: uppercase;
        }
        td {
            font-size: 0.9rem;
        }
    </style>
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
    
    <h2 class="text-center my-4">Danh sách Sinh viên</h2>
    <table class="table table-bordered table-striped table-hover mx-auto" style="width: 90%;">
        <thead class="table-primary text-center">
            <tr>
                <th>MaSV</th>
                <th>MaLop</th>
                <th>Name</th>
                <th>Email</th>
                <th>SĐT</th>
                <th>DOB</th>
                <th>Địa chỉ</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <%
            List<Students> studentList = (List<Students>) request.getAttribute("studentList");
            if (studentList != null && !studentList.isEmpty()) {
                for (Students student : studentList) {
            %>
            <tr class="text-center">
                <td><%= student.getMaSV() %></td>
                <td><%= student.getMaLop() %></td>
                <td><%= student.getTenSV() %></td>
                <td><%= student.getEmail() %></td>
                <td><%= student.getSDT() %></td>           
                <td><%= student.getDOB() %></td>
                <td><%= student.getDiaChi() %></td>
                <td>
                    <form action="EditStudent.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="MaSV" value="<%= student.getMaSV() %>">
                        <button type="submit" class="btn btn-warning btn-sm">Sửa</button>
                    </form>
                    <form action="hocvien" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="MaSV" value="<%= student.getMaSV() %>">
                        <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                    </form>
                    <form action="diem" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="select">
                        <input type="hidden" name="MaSV" value="<%= student.getMaSV() %>">
                        <button type="submit" class="btn btn-info btn-sm">Xem chi Tiết</button>
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="8" class="text-center">Không có dữ liệu</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>

    <h2 class="text-center my-4">Thêm mới Sinh viên</h2>
    <div class="text-center">
        <form action="InsertStudent.jsp" method="get">
            <input type="submit" value="Thêm Sinh Viên" class="btn btn-success">
        </form>
    </div>
</body>
</html>
