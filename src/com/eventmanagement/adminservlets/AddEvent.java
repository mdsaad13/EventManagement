package com.eventmanagement.adminservlets;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.eventmanagement.Environment;
import com.eventmanagement.Formatter;
import com.eventmanagement.dbutil.AdminUtil;
import com.eventmanagement.modals.Events;

/**
 * Servlet implementation class AddEvent
 */
@WebServlet("/admin/AddEvent")
public class AddEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String title = "";
		String description = "";
		int catID = 0;
		String dateTime = Formatter.CurrentDateTime();
		int visibility = 0;

		String venueDate = "";
		String address = "";
		Random rand = new Random();
		int rand_int1 = rand.nextInt(1000);

		String UPLOAD_DIRECTORY = Environment._InstalledDirectory + "\\WebContent\\assets\\EventImages";
		String filename = "";
		String imgUrl = "";

		// process only if its multipart content
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				for (FileItem item : multiparts) {
					if (item.isFormField()) {

						if (item.getFieldName().equalsIgnoreCase("title")) {
							title = item.getString();
						}
						if (item.getFieldName().equalsIgnoreCase("description")) {
							description = item.getString();
						}
						if (item.getFieldName().equalsIgnoreCase("catid")) {
							catID = Integer.parseInt(item.getString());
						}
						if (item.getFieldName().equalsIgnoreCase("event_visibility")) {
							visibility = Integer.parseInt(item.getString());
						}
						if (item.getFieldName().equalsIgnoreCase("venueDate")) {
							venueDate = item.getString();
						}
						if (item.getFieldName().equalsIgnoreCase("address")) {
							address = item.getString();
						}
					} else {
						String name = new File(item.getName()).getName();
						filename = rand_int1 + name;
						item.write(new File(UPLOAD_DIRECTORY + File.separator + filename));
					}
				}
			} catch (Exception ex) {

			}
		}

		imgUrl = filename;

		Events events = new Events(0, title, description, catID, "", dateTime, visibility, imgUrl, venueDate, address);
		AdminUtil adminUtil = new AdminUtil();
		try {
			if (adminUtil.AddEvent(events)) {
				response.sendRedirect("events.jsp?message=AddSuccess");
			} else {
				response.sendRedirect("events.jsp?message=AddFailed");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
