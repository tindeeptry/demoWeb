package Quan_ly_khoa_hoc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.Courses;

@WebServlet("/khoahoc")
public class khoahoc extends HttpServlet {

    private static final String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    private static final String username = "root";
    private static final String password = "Tien0610";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, username, password);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Courses> courseList = new ArrayList<>();
        request.setCharacterEncoding("UTF-8");
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("SELECT * FROM Khoahoc")) {

            while (rs.next()) {
                String MaKH = rs.getString("MaKH");
                String TenKH = rs.getString("TenKH");
                String NgayBatDau_N_H = rs.getString("NgayBatDau_N_H");
                String NgayKetThuc_N_H = rs.getString("NgayKetThuc_N_H");

                courseList.add(new Courses(MaKH, TenKH, NgayBatDau_N_H, NgayKetThuc_N_H ));
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("courseList", courseList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("CourseShow.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String MaKH = request.getParameter("MaKH");
        String TenKH = request.getParameter("TenKH");
        String NgayBatDau_N_H = request.getParameter("NgayBatDau_N_H");
        String NgayKetThuc_N_H = request.getParameter("NgayKetThuc_N_H");
        
        try (Connection connection = getConnection()) {
            if ("add".equals(action)) {
                String insertQuery = "INSERT INTO Khoahoc (MaKH, TenKH, NgayBatDau_N_H, NgayKetThuc_N_H) VALUES (?, ?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertQuery)) {
                    pstmt.setString(1, MaKH);
                    pstmt.setString(2, TenKH);
                    pstmt.setString(3, NgayBatDau_N_H);
                    pstmt.setString(4, NgayKetThuc_N_H);
                    pstmt.executeUpdate();
                }
            } else if ("update".equals(action)) {
                String updateQuery = "UPDATE Khoahoc SET TenKH = ?, NgayBatDau_N_H = ?, NgayKetThuc_N_H = ? WHERE MaKH = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(updateQuery)) {
                    pstmt.setString(1, TenKH);
                    pstmt.setString(2, NgayBatDau_N_H);
                    pstmt.setString(3, NgayKetThuc_N_H);
                    pstmt.setString(4, MaKH);
                    pstmt.executeUpdate();
                }
            } else if ("delete".equals(action)) {
                String deleteQuery = "DELETE FROM Khoahoc WHERE MaKH = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(deleteQuery)) {
                    pstmt.setString(1, MaKH);
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        doGet(request, response);
    }
} 