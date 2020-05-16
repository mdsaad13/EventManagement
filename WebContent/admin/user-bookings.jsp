<%@page import="com.eventmanagement.dbutil.AccountUtil"%>
<%@page import="com.eventmanagement.modals.Bookings"%>
<%@page import="com.eventmanagement.modals.Users"%>
<%@page import="com.eventmanagement.Formatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.eventmanagement.dbutil.AdminUtil"%>
<%
	if (session.getAttribute("AdminID") == null) {
	response.sendRedirect("login.jsp");
	return;
}

int UserID = 0;
UserID = Integer.parseInt(request.getParameter("id"));

AccountUtil accountUtil = new AccountUtil();
Users user = accountUtil.GetUserByID(UserID);

AdminUtil adminUtil = new AdminUtil();

ArrayList<Bookings> list = adminUtil.UsersBookings(UserID);

String Title = "Bookings of " + user.getName();

String Message = null;
Message = request.getParameter("message");
%>
<jsp:include page="header.jsp">
	<jsp:param name="Title" value="<%=Title%>" />
	<jsp:param name="UsersActive" value="active" />
</jsp:include>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<%=Title%>
			<small>Admin panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="users.jsp"> All Users</a></li>
			<li class="active"><%=Title%></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<%
			if (Message != null)
			if (Message.equals("BookingUpdateSuccess")) {
		%>
		<div class="alert alert-success alert-dismissible">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">X</button>
			<h4>
				<i class="icon fa fa-check"></i> Alert!
			</h4>
			Booking status updated successfully!
		</div>
		<%
			} else if (Message.equals("BookingUpdateFailed")) {
		%>
		<div class="alert alert-danger alert-dismissible">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">X</button>
			<h4>
				<i class="icon fa fa-check"></i> Alert!
			</h4>
			Booking status update failed!
		</div>
		<%
			}
		%>
		<div class="">
			<!-- Small boxes (Stat box) -->
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<%=Title%>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="myDataTable"
								class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Booking ID</th>
										<th>Event</th>
										<th>Booked for</th>
										<th>Status</th>
										<th>Date of booking</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<%
										int i = 1;
									for (Bookings item : list) {
									%>
									<tr>
										<td><%=i%></td>
										<td><%=item.getID()%></td>
										<td><a href="view-event.jsp?id=<%=item.getEventID()%>">
												<%=item.getEventTitle()%>
										</a></td>
										<td><%=item.getMembers()%> Member(s)</td>
										<th>
											<%
												if (item.getStatus() == 0) {
												out.println("Pending");
											} else {
												out.println("Accepted");
											}
											%>
										</th>
										<td><%=Formatter.FormatToDateTime(item.getDateOfBooking())%>
										</td>
										<td>
											<%
												if (item.getStatus() == 0) {
											%>
											<a
											href="UpdateBookingStatus?bookingid=<%=item.getID()%>&returnurl=user-bookings.jsp?id=<%=user.getID()%>&"
											class="btn btn-success btn-sm"> Accept </a> <%
 	} else {
 	out.println("No Action required");
 }
 %>
										</td>
									</tr>
									<%
										i++;
									}
									%>
								</tbody>
								<tfoot>
									<tr>
										<th>#</th>
										<th>Booking ID</th>
										<th>Event</th>
										<th>Booked for</th>
										<th>Status</th>
										<th>Date of booking</th>
										<th>Action</th>
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- /.box-body -->
					</div>
				</div>
			</div>
			<!-- /.row -->
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<jsp:include page="footer.jsp" />

<script>
	$(document).ready(function() {
		$('#myDataTable').DataTable({
			responsive : true
		});
	});
</script>