package Quan_li_CLB;

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
import DAO.Club;

@WebServlet("/CLB")
public class CLB extends HttpServlet {

    private static final String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    private static final String username = "root";
    private static final String password = "Tien0610";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, username, password);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Club> clubList = new ArrayList<>();

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("SELECT * FROM HoatDong_CLB")) {

            while (rs.next()) {
                String MaHD = rs.getString("MaHD");
                String TenHD = rs.getString("TenHD");
                String NgayToChuc = rs.getString("NgayToChuc");

                clubList.add(new Club(MaHD, TenHD, NgayToChuc));
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("clubList", clubList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ClubShow.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String MaHD = request.getParameter("MaHD");
        String TenHD = request.getParameter("TenHD");
        String NgayToChuc = request.getParameter("NgayToChuc");

        try (Connection connection = getConnection()) {
            if ("add".equals(action)) {
                String insertQuery = "INSERT INTO HoatDong_CLB (MaHD, TenHD, NgayToChuc) VALUES (?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertQuery)) {
                    pstmt.setString(1, MaHD);
                    pstmt.setString(2, TenHD);
                    pstmt.setString(3, NgayToChuc);
                    pstmt.executeUpdate();
                }
            } else if ("update".equals(action)) {
                String updateQuery = "UPDATE HoatDong_CLB SET TenSV = ?, email = ? WHERE MaHD = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(updateQuery)) {
                    pstmt.setString(1, TenHD);
                    pstmt.setString(2, NgayToChuc);
                    pstmt.setString(3, MaHD);
                    pstmt.executeUpdate();
                }
            } else if ("delete".equals(action)) {
                String deleteQuery = "DELETE FROM HoatDong_CLB WHERE MaHD = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(deleteQuery)) {
                    pstmt.setString(1, MaHD);
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        doGet(request, response);
    }
} 