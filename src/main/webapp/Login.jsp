<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Nhập</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <div class="login-box mx-auto text-center" style="max-width: 400px;">
        <h2 class="mb-4">Chào mừng đến Trang Chủ Câu Lạc Bộ Tin Học</h2>
        
        <!-- Hiển thị thông báo lỗi nếu có -->
        <%
            String errorMessage = request.getParameter("error");
            if ("1".equals(errorMessage)) {
        %>
            <div class="alert alert-danger text-center" role="alert">
                Sai tên đăng nhập hoặc mật khẩu! Vui lòng thử lại.
            </div>
        <%
            }
        %>
        
        <!-- Form đăng nhập -->
        <form action="LoginServlet" method="post">
		    <div class="mb-3">
		        <input type="text" class="form-control" name="name" placeholder="Tên đăng nhập" required>
		    </div>
		    <div class="mb-3">
		        <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required>
		    </div>
		    <div class="d-grid">
		        <button type="submit" class="btn btn-primary">Đăng nhập</button>
		    </div>
		</form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
