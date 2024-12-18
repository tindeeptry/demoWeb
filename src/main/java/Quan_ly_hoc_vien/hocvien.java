package Quan_ly_hoc_vien;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.Students;

@WebServlet("/hocvien")
public class hocvien extends HttpServlet {

    private static final String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    private static final String dbUsername = "root";
    private static final String dbPassword = "Tien0610";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, dbUsername, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Students> studentList = new ArrayList<>();
        String maLop = request.getParameter("MaLop"); // Lấy tham số từ yêu cầu
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM SinhVien WHERE MaLop = ?")) {
            
            pstmt.setString(1, maLop); // Gán giá trị cho tham số
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String maSV = rs.getString("MaSV");
                String tenSV = rs.getString("TenSV");
                String email = rs.getString("email");
                String sdt = rs.getString("SDT");
                String dob = rs.getString("DOB");
                String diaChi = rs.getString("DiaChi");

                studentList.add(new Students(maSV, maLop, tenSV, email, sdt, dob, diaChi));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("studentList", studentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("StudentShow.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String maSV = request.getParameter("MaSV");
        String maLop = request.getParameter("MaLop");
        String tenSV = request.getParameter("TenSV");
        String email = request.getParameter("email");
        String sdt = request.getParameter("SDT");
        String dob = request.getParameter("DOB");
        String diaChi = request.getParameter("DiaChi");

        try (Connection connection = getConnection()) {
            if ("add".equals(action)) {
                String insertQuery = "INSERT INTO SinhVien (MaSV, MaLop, TenSV, email, SDT, DOB, DiaChi) VALUES (?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertQuery)) {
                    pstmt.setString(1, maSV);
                    pstmt.setString(2, maLop);
                    pstmt.setString(3, tenSV);
                    pstmt.setString(4, email);
                    pstmt.setString(5, sdt);
                    pstmt.setString(6, dob);
                    pstmt.setString(7, diaChi);
                    pstmt.executeUpdate();
                }
            } else if ("update".equals(action)) {
                String updateQuery = "UPDATE SinhVien SET MaLop = ?, TenSV = ?, email = ?, SDT = ?, DOB = ?, DiaChi = ? WHERE MaSV = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(updateQuery)) {
                    pstmt.setString(1, maLop);
                    pstmt.setString(2, tenSV);
                    pstmt.setString(3, email);
                    pstmt.setString(4, sdt);
                    pstmt.setString(5, dob);
                    pstmt.setString(6, diaChi);
                    pstmt.setString(7, maSV);
                    pstmt.executeUpdate();
                }
            } else if ("delete".equals(action)) {
                String deleteQuery = "DELETE FROM SinhVien WHERE MaSV = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(deleteQuery)) {
                    pstmt.setString(1, maSV);
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        doGet(request, response);
    }
}
