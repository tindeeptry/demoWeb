package Quan_li_diem;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.Score;

@WebServlet("/diem")
public class diem extends HttpServlet {

    private static final String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    private static final String dbUsername = "root";
    private static final String dbPassword = "Tien0610";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, dbUsername, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Score> scoreList = new ArrayList<>();
        String MaSV = request.getParameter("MaSV"); // Lấy tham số từ yêu cầu
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM Lop_MonHoc WHERE MaSV = ?")) {
            
            pstmt.setString(1, MaSV); // Gán giá trị cho tham số
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String MaLopMonHoc = rs.getString("MaLopMonHoc");
                String MaLop = rs.getString("MaLop");
                String MaMH = rs.getString("MaMH");
                float Diem = rs.getFloat("Diem");
                if (rs.wasNull()) {
                    Diem = 0.0f; // Hoặc giá trị mặc định khác
                }
                scoreList.add(new Score(MaLopMonHoc, MaLop, MaMH, MaSV, Diem));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("scoreList", scoreList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ScoreShow.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String MaLopMonHoc = request.getParameter("MaLopMonHoc");
        String MaLop = request.getParameter("MaLop");
        String MaMH = request.getParameter("MaMH");
        String MaSV = request.getParameter("MaSV");
        String diemStr = request.getParameter("Diem");
        float Diem = 0.0f; // Giá trị mặc định
        if (diemStr != null && !diemStr.trim().isEmpty()) {
            try {
                Diem = Float.parseFloat(diemStr);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                // Xử lý nếu cần (bạn có thể ghi log hoặc gán giá trị mặc định)
            }
        }
        
        try (Connection connection = getConnection()) {
            if ("add".equals(action)) {
                String insertQuery = "INSERT INTO Lop_MonHoc (MaLopMonHoc, MaLop, MaMH, MaSV, Diem) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertQuery)) {
                    pstmt.setString(1, MaLopMonHoc);
                    pstmt.setString(2, MaLop);
                    pstmt.setString(3, MaMH);
                    pstmt.setString(4, MaSV);
                    pstmt.setFloat(5, Diem);
                    pstmt.executeUpdate();
                }
            } else if ("update".equals(action)) {
                String updateQuery = "UPDATE Lop_MonHoc SET MaLop = ?, MaMH = ?, MaSV = ?, Diem = ? WHERE MaLopMonHoc = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(updateQuery)) {
                    pstmt.setString(1, MaLop);
                    pstmt.setString(2, MaMH);
                    pstmt.setString(3, MaSV);
                    pstmt.setFloat(4, Diem);
                    pstmt.setString(5, MaLopMonHoc);
                    pstmt.executeUpdate();
                }
            } else if ("delete".equals(action)) {
                String deleteQuery = "DELETE FROM Lop_MonHoc WHERE MaLopMonHoc = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(deleteQuery)) {
                    pstmt.setString(1, MaLopMonHoc);
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        doGet(request, response);
    }
}
