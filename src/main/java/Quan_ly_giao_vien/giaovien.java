package Quan_ly_giao_vien;

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
import DAO.Teachers;

@WebServlet("/giaovien")
public class giaovien extends HttpServlet {

    private static final String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    private static final String username = "root";
    private static final String password = "Tien0610";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, username, password);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Teachers> teacherList = new ArrayList<>();

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("SELECT * FROM GIAOVIEN")) {

            while (rs.next()) {
                String maGV = rs.getString("MaGV");
                String TenGV = rs.getString("TenGV");                
                String SDT = rs.getString("SDT");
                String email = rs.getString("email");
                String DOB = rs.getString("DOB");

                teacherList.add(new Teachers(maGV, TenGV, SDT, email , DOB));
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("teacherList", teacherList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("TeacherShow.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String MaGV = request.getParameter("MaGV");
        String TenGV = request.getParameter("TenGV");        
        String SDT = request.getParameter("SDT");
        String email = request.getParameter("email");
        String DOB = request.getParameter("DOB");

        try (Connection connection = getConnection()) {
            if ("add".equals(action)) {
                String insertQuery = "INSERT INTO GIAOVIEN (MaGV, TenGV, SDT, email, DOB) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertQuery)) {
                    pstmt.setString(1, MaGV);
                    pstmt.setString(2, TenGV);
                    pstmt.setString(3, SDT);
                    pstmt.setString(4, email);                    
                    pstmt.setString(5, DOB);
                    pstmt.executeUpdate();
                }
            } else if ("update".equals(action)) {
                String updateQuery = "UPDATE GIAOVIEN SET TenGV = ?,SDT = ?, email = ?, DOB = ? WHERE MaGV = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(updateQuery)) {
                    pstmt.setString(1, TenGV);
                    pstmt.setString(2, SDT);
                    pstmt.setString(3, email);                    
                    pstmt.setString(4, DOB);
                    pstmt.setString(5, MaGV);
                    pstmt.executeUpdate();
                }
            } else if ("delete".equals(action)) {
                String deleteQuery = "DELETE FROM GIAOVIEN WHERE MaGV = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(deleteQuery)) {
                    pstmt.setString(1, MaGV);
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        doGet(request, response);
    }
} 