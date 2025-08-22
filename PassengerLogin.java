package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.Database;

/**
 * Servlet implementation class PassengerLogin
 */
@WebServlet("/passenger_login")
public class PassengerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassengerLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session=request.getSession();
        session.setAttribute("passenger", email);

        try {
           Connection conn=Database.getConnection();

            String sql = "SELECT * FROM passenger WHERE email = ? AND password = ?";
         PreparedStatement   pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

         ResultSet   rs = pstmt.executeQuery();

            if (rs.next()) {
                // Login success
            	
               // HttpSession session = request.getSession();
                session.setAttribute("passengerName", rs.getString("fullname"));
                response.sendRedirect("Phome.html"); // Or home page for passengers
            } else {
                // Login failed
                response.sendRedirect("login_failed.html");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } 
	}

}
