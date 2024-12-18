<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - Quản lý CLB Tin học</title>
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


    <div class="container mt-5">
        <h1 class="text-center">Chào mừng đến với hệ thống quản lý CLB Tin Học</h1>
        <p class="text-center mt-4">Hệ thống này hỗ trợ quản lý thông tin về học viên, khóa học và giáo viên. 
            Vui lòng chọn một chức năng từ menu để bắt đầu.</p>
        
        <div class="row mt-5 text-center">
            <div class="col-md-4">
                <a href="/CLB_TIN_HOC/giaovien" class="btn btn-primary btn-lg">Quản lý giáo viên</a>
            </div>
            <div class="col-md-4">
                <a href="/CLB_TIN_HOC/khoahoc" class="btn btn-success btn-lg">Quản lý khóa học</a>
            </div>
            <div class="col-md-4">
                <a href="/CLB_TIN_HOC/CLB" class="btn btn-info btn-lg">Hoạt động câu lạc bộ</a>
            </div>
            <div class="col-md-4">
                <a href="/CLB_TIN_HOC/donggop" class="btn btn-info btn-lg">Đóng góp</a>
            </div>
        </div>
    </div>

    <footer class="text-center mt-5">
        <p>&copy; 2024 CLB Tin Học - Đại học Sư phạm Đà Nẵng</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
