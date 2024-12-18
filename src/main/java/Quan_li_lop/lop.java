package Quan_li_lop;

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
import DAO.Class;
import DAO.Score;

@WebServlet("/lop")
public class lop extends HttpServlet {

	private static final String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    private static final String dbUsername = "root";
    private static final String dbPassword = "Tien0610";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, dbUsername, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Class> classList = new ArrayList<>();
        String MaKH = request.getParameter("MaKH"); 
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM Lop WHERE MaKH = ?")) {
            
            pstmt.setString(1, MaKH); // Gán giá trị cho tham số
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String MaLop = rs.getString("MaLop");
                String TenLop = rs.getString("TenLop");
                
                classList.add(new Class(MaLop, TenLop, MaKH));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("classList", classList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("classShow.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String MaLop = request.getParameter("MaLop");
        String TenLop = request.getParameter("TenLop");
        String MaKH = request.getParameter("MaKH");

        try (Connection connection = getConnection()) {
            if ("add".equals(action)) {
                String insertQuery = "INSERT INTO Lop (MaLop, TenLop, MaKH) VALUES (?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertQuery)) {
                    pstmt.setString(1, MaLop);
                    pstmt.setString(2, TenLop);
                    pstmt.setString(3, MaKH);
                    pstmt.executeUpdate();
                }
            } else if ("update".equals(action)) {
                String updateQuery = "UPDATE Lop SET TenLop = ?, MaKH = ? WHERE MaLop = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(updateQuery)) {
                	pstmt.setString(1, TenLop);
                    pstmt.setString(2, MaKH);
                    pstmt.setString(3, MaLop);
                    pstmt.executeUpdate();
                }
            } else if ("delete".equals(action)) {
                String deleteQuery = "DELETE FROM Lop WHERE MaLop = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(deleteQuery)) {
                    pstmt.setString(1, MaLop);
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        doGet(request, response);
    }
} 