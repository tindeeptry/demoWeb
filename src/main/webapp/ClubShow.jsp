<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Club" %>
<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
%>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hoạt động câu lạc bộ</title>
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
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <span class="nav-link">Chào mừng, <%= username %></span>
                </li>
                
                <li class="nav-item">
                    <button class="btn btn-danger btn-sm" onclick="confirmLogout()">Đăng xuất</button>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h2>Danh sách Hoạt động</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Mã HD</th>
                <th>Tên hoạt động</th>
                <th>Ngày tổ chức</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
        <% 
        List<Club> clubList = (List<Club>) request.getAttribute("clubList");
        if (clubList != null && !clubList.isEmpty()) {
            for (Club club : clubList) { 
        %>
            <tr>
                <td><%= club.getMaHD() %></td>
                <td><%= club.getTenHD() %></td>
                <td><%= club.getNgayToChuc() %></td>
                <td>
                    <form action="EditClub.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="MaHD" value="<%= club.getMaHD() %>">
                        <input type="submit" class="btn btn-primary btn-sm" value="Sửa">
                    </form>
                    <form action="CLB" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="MaHD" value="<%= club.getMaHD() %>">
                        <input type="submit" class="btn btn-danger btn-sm" value="Xóa">
                    </form>
                </td>
            </tr>
        <% 
            }
        } else { 
        %>
            <tr>
                <td colspan="4" class="text-center">Không có dữ liệu</td>
            </tr>
        <% 
        } 
        %>
        </tbody>
    </table>

    <h2>Thêm mới Hoạt động</h2>
    <a href="InsertClub.jsp" class="btn btn-success">Thêm Hoạt động</a>
    
    
</div>

</body>
</html>
