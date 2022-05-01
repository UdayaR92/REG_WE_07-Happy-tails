package com.victory;

import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class insert kobo
 */
@WebServlet("/Signup")
public class victoryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String kid=request.getParameter("kid");
		// catch the user inputs form form and assign to the variables
		
		String cname = request.getParameter("cname");
		String program = request.getParameter("program");
		String city = request.getParameter("city");
		String location = request.getParameter("location");
		String date = request.getParameter("date");
		String budget = request.getParameter("budget");
		
		
		boolean isTrue;
		
		//send assigned values to the DButill file
		isTrue = victoryDBUtil.insertVictory(cname, program, city, location, date, budget);
		
		//check that send data successfully passed or fail
		if(isTrue == true) {

				
			RequestDispatcher  dis = request.getRequestDispatcher("victoryViewAll.jsp");
			  dis.forward(request,response);
			  
	
		}
		else {
			
			
			RequestDispatcher  dis2 = request.getRequestDispatcher("victoryInsert.jsp");
			dis2.forward(request,response);
		}
		
		
	}

}
