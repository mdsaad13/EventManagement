package com.eventmanagement.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventmanagement.Formatter;
import com.eventmanagement.dbutil.AccountUtil;
import com.eventmanagement.modals.Users;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String Name = request.getParameter("name");
		String Email = request.getParameter("email");
		String Mobile = request.getParameter("mobile");
		String Password = request.getParameter("password");
		String DateTime = Formatter.CurrentDateTime();

		Users users = new Users(0, Name, Email, Password, Mobile, DateTime);

		AccountUtil accountUtil = new AccountUtil();
		try {
			if (accountUtil.InsertUser(users)) {
				request.setAttribute("msg", "RegisterSuccess");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
