package Quan_li_HD_CLB;

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
import DAO.Contribution;

@WebServlet("/donggop")
public class donggop extends HttpServlet {

    private static final String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    private static final String username = "root";
    private static final String password = "Tien0610";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, username, password);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Contribution> ctbList = new ArrayList<>();

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("SELECT * FROM XepHang_TichCuc")) {

            while (rs.next()) {
                String MaXH = rs.getString("MaXH");
                String MaSV = rs.getString("MaSV");
                int SoHoatDong = rs.getInt("SoHoatDong");

                ctbList.add(new Contribution(MaXH, MaSV, SoHoatDong));
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("ctbList", ctbList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("CTBShow.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String MaXH = request.getParameter("MaXH");
        String MaSV = request.getParameter("MaSV");
        String soHoatDongParam = request.getParameter("SoHoatDong");

        int SoHoatDong = 0;
        if (soHoatDongParam != null && !soHoatDongParam.isEmpty()) {
            try {
                SoHoatDong = Integer.parseInt(soHoatDongParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("CTBShow.jsp?error=invalid_number");
                return;
            }
        }

        try (Connection connection = getConnection()) {
            if ("add".equals(action)) {
                String insertQuery = "INSERT INTO XepHang_TichCuc (MaXH, MaSV, SoHoatDong) VALUES (?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertQuery)) {
                    pstmt.setString(1, MaXH);
                    pstmt.setString(2, MaSV);
                    pstmt.setInt(3, SoHoatDong);
                    pstmt.executeUpdate();
                }
            } else if ("update".equals(action)) {
                String updateQuery = "UPDATE XepHang_TichCuc SET MaSV = ?, SoHoatDong = ? WHERE MaXH = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(updateQuery)) {
                    pstmt.setString(1, MaSV);
                    pstmt.setInt(2, SoHoatDong);
                    pstmt.setString(3, MaXH);
                    pstmt.executeUpdate();
                }
            } else if ("delete".equals(action)) {
                String deleteQuery = "DELETE FROM XepHang_TichCuc WHERE MaXH = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(deleteQuery)) {
                    pstmt.setString(1, MaXH);
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        doGet(request, response);
    }
}
