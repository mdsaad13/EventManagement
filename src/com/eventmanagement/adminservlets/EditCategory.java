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
 * Servlet implementation class EditCategory
 */
@WebServlet("/admin/EditCategory")
public class EditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Name = request.getParameter("email");
		Categories categories = new Categories(0, Name);
		AdminUtil adminUtil = new AdminUtil();
		try {
			if (adminUtil.EditCategory(categories)) {
				response.sendRedirect("categories.jsp?message=UpdateSuccess");
			} else {
				response.sendRedirect("categories.jsp?message=UpdateFailed");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
