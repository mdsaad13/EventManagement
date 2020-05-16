<%@page import="com.eventmanagement.Formatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.eventmanagement.modals.Events"%>
<%@page import="com.eventmanagement.dbutil.AdminUtil"%>
<%
	int EventID = 0;
EventID = Integer.parseInt(request.getParameter("id"));

AdminUtil adminUtil = new AdminUtil();
Events event = adminUtil.GetEventByID(EventID);
%>
<jsp:include page="header.jsp">
  <jsp:param name="Title" value="<%=event.getTitle()%>" />
  <jsp:param name="EventsActive" value="active" />
</jsp:include>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">
					Book now -
					<%=event.getTitle()%></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<%
			if(session.getAttribute("UserID") == null){ %>
				<div class="alert alert-danger m-3 text-center" role="alert">
					<strong>Kindly login to book this event!</strong><br>
					<a href="login.jsp" target="_blank">Login</a>
				</div>
				<% } else { %>
				<form method="POST" action="BookEvent">
					<input type="hidden" name="userID" value="<%=session.getAttribute("UserID")%>">
					<input type="hidden" name="eventID" value="<%=event.getID()%>">
					<div class="form-group">
						<label for="members">Book For</label> 
						<input type="text" class="form-control"
							id="members" name="members" placeholder="Enter number of members to book">
					</div>
					<div class="mt-5 mb-2">
						<button type="submit" class="btn btn-primary btn-block">Book Now</button>
					</div>
				</form>
				<% } %>
			</div>
		</div>
	</div>
</div>

<main id="main">
	<div class="hero-section inner-page">
		<div class="wave">

			<svg width="1920px" height="265px" viewBox="0 0 1920 265" version="1.1" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink">
				<g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
					<g id="Apple-TV" transform="translate(0.000000, -402.000000)" fill="#FFFFFF">
						<path
							d="M0,439.134243 C175.04074,464.89273 327.944386,477.771974 458.710937,477.771974 C654.860765,477.771974 870.645295,442.632362 1205.9828,410.192501 C1429.54114,388.565926 1667.54687,411.092417 1920,477.771974 L1920,667 L1017.15166,667 L0,667 L0,439.134243 Z"
							id="Path"></path>
					</g>
				</g>
			</svg>

		</div>

		<div class="container">
			<div class="row align-items-center">
				<div class="col-12">
					<div class="row justify-content-center">
						<div class="col-md-7 text-center hero-text">
							<h1 data-aos="fade-up" data-aos-delay=""><%=event.getTitle()%></h1>
							<p class="mb-5 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
								Category:
								<%=event.getCatName()%>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="site-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md-8 blog-content">
					<img src="assets/EventImages/<%=event.getImgUrl()%>" class="img-fluid">
					<p class="lead mt-5">
						<%=event.getDescription()%>
					</p>
				</div>
				<div class="col-md-4 sidebar">
					<div class="sidebar-box">
						<h3>Venue Date</h3>
						<p>
							<%=Formatter.FormatToDateTime(event.getVenueDate())%>
						</p>
						<h3>Venue Address</h3>
						<p>
							<%=event.getAddress()%>
						</p>
						<p>
							<button class="btn btn-primary btn-sm" data-toggle="modal"
								data-target="#exampleModal">Book
								Now</button>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

</main>
<jsp:include page="footer.jsp" />