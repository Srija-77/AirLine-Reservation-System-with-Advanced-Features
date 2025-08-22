package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.Database;

/**
 * Servlet implementation class BookFlight
 */
@WebServlet("/BookFlight")
public class BookFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookFlight() {
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
		
		
		String from=request.getParameter("from");
		String to=request.getParameter("to");
		String date=request.getParameter("departure-date");
		
		HttpSession session=request.getSession();
		session.getAttribute("passenger");
		try {
		Connection con=Database.getConnection();
		String sql="select * from flights where source='"+from+"' and destination='"+to+"'";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		request.setAttribute("date", date);
		request.setAttribute("result",rs );
		RequestDispatcher	 requestDispatcher=request.getRequestDispatcher("flightdetails.jsp");
	            requestDispatcher.forward(request, response);

		
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
