package com.eventmanagement.adminservlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventmanagement.dbutil.AdminUtil;
import com.eventmanagement.modals.Categories;

/**
 * Servlet implementation class AddCategory
 */
@WebServlet("/admin/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Name = request.getParameter("name");
		Categories categories = new Categories(0, Name);

		AdminUtil adminUtil = new AdminUtil();
		try {
			if (adminUtil.AddCategory(categories)) {
				response.sendRedirect("categories.jsp?message=AddSuccess");
			} else {
				response.sendRedirect("categories.jsp?message=AddFailed");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
