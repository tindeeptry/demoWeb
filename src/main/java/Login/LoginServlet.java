package Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("name");
        String password = request.getParameter("password");

        String url = "jdbc:mysql://localhost:3306/clb_tin_hoc";
        String dbUser = "root";
        String dbPassword = "Tien0610";

        try {
            // Đăng ký driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Kết nối cơ sở dữ liệu
            Connection connection = DriverManager.getConnection(url, dbUser, dbPassword);

            // Kiểm tra thông tin đăng nhập
            String query = "SELECT username, role FROM Users WHERE username = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Đăng nhập thành công
                String role = resultSet.getString("role"); // Lấy vai trò

                // Lưu thông tin vào session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                // Chuyển hướng dựa trên vai trò
                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("Home_Login.jsp"); // Trang dành cho admin
                } else {
                    response.sendRedirect("Login_home.jsp"); // Trang dành cho user
                }
            } else {
                // Sai tên đăng nhập hoặc mật khẩu
                response.sendRedirect("Login.jsp?error=1");
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Login.jsp?error=1");
        }
    }
}
