package com.eventmanagement.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eventmanagement.dbutil.AccountUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String Email = request.getParameter("email");
		String Password = request.getParameter("password");

		AccountUtil accountUtil = new AccountUtil();
		try {
			int ID = accountUtil.UserLogin(Email, Password);
			if (ID > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("UserID", ID);

				response.sendRedirect("index.jsp");
			} else {
				request.setAttribute("Email", Email);
				request.setAttribute("msg", "InvalidCreds");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}