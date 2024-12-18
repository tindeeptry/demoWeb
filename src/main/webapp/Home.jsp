<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - Quản lý CLB Tin học</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        /* Header Section with Cover Image */
        header {
            background-image: url('cover-image.jpg');
            background-size: cover;
            background-position: center;
            padding: 100px 0; /* Increase padding for better spacing */
            color: white; /* Text color to make it stand out on the image */
        }

        header h1 {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 20px;
        }

        header p {
            font-size: 1.5rem;
            font-style: italic;
        }

        /* Make header text responsive */
        @media (max-width: 768px) {
            header h1 {
                font-size: 2rem;
            }

            header p {
                font-size: 1.2rem;
            }
        }

        /* Centered text style for sections */
        .text-center-custom {
            text-align: center;
        }

        /* Style for Introduction Section */
        .introduction-section {
            background-color: #f8f9fa;
            padding: 40px;
            border-radius: 10px;
            margin-top: 20px;
        }

        .introduction-section h3 {
            color: #007bff;
            margin-bottom: 20px;
        }

        /* Custom styling for images section */
        .image-gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 40px;
        }

        .image-gallery img {
            width: 300px;
            height: 200px;
            margin: 15px;
            border-radius: 10px;
            object-fit: cover;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .image-gallery img:hover {
            transform: scale(1.05);
        }

        /* Articles Section Styling */
        .articles-section {
            margin-top: 60px;
        }

        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: none;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
            border-radius: 10px 10px 0 0;
        }

        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #007bff;
        }

        .card-text {
            color: #6c757d;
        }

        /* Footer style */
        footer {
            background-color: #f8f9fa;
            padding: 20px;
            margin-top: 50px;
            text-align: center;
        }

        footer p {
            color: #6c757d;
        }

        /* Style for buttons */
        .btn-lg {
            width: 100%;
            margin-top: 10px;
        }

        /* Section for the row of buttons */
        .button-row .col-md-4 {
            margin-bottom: 20px;
        }

        /* Section heading */
        h1, h2, h3 {
            font-family: 'Arial', sans-serif;
        }

        /* Contact Section */
        .contact-section {
            background-color: #f8f9fa;
            padding: 40px;
            border-radius: 10px;
            margin-top: 60px;
        }

        .contact-section h2 {
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
        }

        .contact-section .form-control {
            margin-bottom: 15px;
        }

        .map {
            border: none;
            width: 100%;
            height: 400px;
            border-radius: 10px;
            margin-top: 20px;
        }

        /* Game Section */
        .game-container {
            position: relative;
            width: 100%;
            padding-bottom: 56.25%; /* 16:9 aspect ratio */
            height: 0;
            overflow: hidden;
            border-radius: 10px;
            background-color: #fff;
        }

        .game-container iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: none;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="Login.jsp">
                <img src="logotin.png" alt="CLB Tin Học" width="115" height="35" class="me-2">
                <span>CLB Tin Học</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="btn btn-primary" href="Login.jsp" role="button">Đăng nhập</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <header class="text-center">
        <div class="container">
            <h1 class="text-white">Chào mừng đến với hệ thống quản lý CLB Tin Học</h1>
            <p class="text-white">Một môi trường học tập và phát triển kỹ năng công nghệ thông tin cho sinh viên</p>
        </div>
    </header>

    <div class="container mt-5">
        <h2 class="text-center-custom">Giới thiệu về CLB Tin Học</h2>

        <!-- Introduction Section about CLB Tin Học -->
        <div class="introduction-section">
            <p>
                CLB Tin Học là một tổ chức sinh viên tại Đại học Sư phạm Đà Nẵng, được thành lập với mục tiêu cung cấp 
                môi trường học tập và phát triển kỹ năng về công nghệ thông tin. CLB tổ chức các khóa học, hoạt động, 
                và sự kiện liên quan đến tin học để giúp sinh viên nâng cao kiến thức và kỹ năng về lập trình, thiết kế web, 
                khoa học dữ liệu, và nhiều lĩnh vực khác trong ngành công nghệ.
            </p>
            <p>
                CLB luôn chào đón những bạn trẻ đam mê công nghệ và muốn học hỏi, trải nghiệm trong lĩnh vực này.
                Tham gia CLB Tin Học, bạn sẽ có cơ hội tham gia các dự án thực tế, giao lưu học hỏi với các chuyên gia 
                và tạo dựng những mối quan hệ trong cộng đồng công nghệ.
            </p>
        </div>

        <!-- Image Gallery Section -->
        <div class="image-gallery">
            <img src="image1.jpg" alt="Image 1">
            <img src="image2.jpg" alt="Image 2">
            <img src="image3.jpg" alt="Image 3">
        </div>

        <h3 class="text-center mt-4">Hệ thống này hỗ trợ quản lý thông tin về học viên, khóa học và giáo viên. 
            Vui lòng chọn một chức năng từ menu để bắt đầu.</h3>

        <div class="row mt-5 text-center">
            <div class="col-md-4">
                <a href="Login.jsp" class="btn btn-primary btn-lg">Quản lý học viên</a>
            </div>
            <div class="col-md-4">
                <a href="Login.jsp" class="btn btn-success btn-lg">Quản lý khóa học</a>
            </div>
            <div class="col-md-4">
                <a href="Login.jsp" class="btn btn-info btn-lg">Quản lý giáo viên</a>
            </div>
        </div>

        <!-- Articles Section -->
        <div class="articles-section">
            <h2 class="text-center mb-5">Bài viết nổi bật</h2>
            
            <div class="row">
                <!-- Article 1 -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <img src="article1.png" class="card-img-top" alt="Khóa học lập trình C++ cơ bản">
                        <div class="card-body">
                            <h5 class="card-title">Khóa học lập trình C++ cơ bản</h5>
                            <p class="card-text">Học những thuật toán cơ bản và ứng dụng của C++ trong các lĩnh vực công nghệ.</p>
                        </div>
                    </div>
                </div>
                
                <!-- Article 2 -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <img src="article2.jpg" class="card-img-top" alt="Thiết kế web hiện đại với HTML & CSS">
                        <div class="card-body">
                            <h5 class="card-title">Thiết kế web hiện đại với HTML & CSS</h5>
                            <p class="card-text">Học cách xây dựng và thiết kế giao diện website chuyên nghiệp, đẹp mắt với các công cụ hiện đại.</p>
                        </div>
                    </div>
                </div>

                <!-- Article 3 -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <img src="article3.jpg" class="card-img-top" alt="Tham gia dự án thực tế với CLB">
                        <div class="card-body">
                            <h5 class="card-title">Tham gia dự án thực tế với CLB</h5>
                            <p class="card-text">Kết nối với cộng đồng công nghệ và tham gia phát triển các dự án phần mềm.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Game Section -->
        <div class="game-container">
            <iframe src="https://play.famobi.com/animal-quiz" title="Game 3"></iframe>
        </div>

        <!-- Contact Section -->
        <div class="contact-section">
            <h2>Liên hệ với chúng tôi</h2>
            <form>
                <div class="row">
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="Họ và tên">
                    </div>
                    <div class="col-md-6">
                        <input type="email" class="form-control" placeholder="Email">
                    </div>
                </div>
                <textarea class="form-control" rows="4" placeholder="Nội dung liên hệ"></textarea>
                <button type="submit" class="btn btn-primary mt-3">Gửi</button>
            </form>
        </div>

        <!-- Map Section -->
        <iframe class="map"
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.07393775994!2d108.15654907576011!3d16.061652539639432!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421924682e8689%3A0x48eb0bdbeec05215!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBTxrAgUGjhuqFtIC0gxJDhuqFpIGjhu41jIMSQw6AgTuG6tW5n!5e0!3m2!1svi!2s!4v1734186521933!5m2!1svi!2s"
            width="600" height="450" style="border:0;"
            allowfullscreen="" loading="lazy"
            referrerpolicy="no-referrer-when-downgrade">
        </iframe>
    </div>

    <footer>
        <p>CLB Tin Học - Đại học Sư phạm Đà Nẵng | © 2024</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"></script>
</body>
</html>
