<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Contribution" %>
<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
%>

<html lang="vi">
<head>	
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xếp Hạng Độ Tích Cực</title>
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
        <th>Mã Xếp Hạng</th>
        <th>Mã Sinh Viên</th>
        <th>Số Hoạt Động</th>
        <th>Hành động</th>
    </tr>
    
    <%
    List<Contribution> ctbList = (List<Contribution>) request.getAttribute("ctbList");
    if (ctbList != null && !ctbList.isEmpty()) {
        for (Contribution ctb : ctbList) {
    %>
        <tr>
            <td><%= ctb.getMaXH() %></td>
            <td><%= ctb.getMaSV() %></td>
            <td><%= ctb.getSoHoatDong() %></td>  
            <td>
                <!-- Form sửa -->
                <form action="EditCTB.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="MaXH" value="<%= ctb.getMaXH() %>">
                    <input type="submit" value="Sửa">
                </form>
                <!-- Form xóa -->
                <form action="donggop" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="MaXH" value="<%= ctb.getMaXH() %>">
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
<form action="InsertCTB.jsp" method="get">
    <input type = "submit" value = "thêm xếp hạng">
</form>
</body>
</html>
