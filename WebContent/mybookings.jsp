<%@page import="com.eventmanagement.modals.Bookings"%>
<%@page import="com.eventmanagement.Formatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.eventmanagement.dbutil.AdminUtil"%>
<%
if(session.getAttribute("UserID") == null){
	response.sendRedirect("login.jsp");
	return;
}

int UserID = (int) session.getAttribute("UserID");
AdminUtil adminUtil = new AdminUtil();
ArrayList<Bookings> list = adminUtil.UsersBookings(UserID);

Boolean DisplayEvents = false;
if (list.size() > 0) {
	DisplayEvents = true;
}

String Message = null;
Message = request.getParameter("message");
%>
<jsp:include page="header.jsp">
  <jsp:param name="Title" value="My Bookings" />
  <jsp:param name="BookingsActive" value="active" />
</jsp:include>
<style>
  .btn-sm {
    padding: .5rem !important;
    font-size: 13px !important;
    line-height: 1.5;
    border-radius: .2rem;
  }
</style>
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
              <h1 data-aos="fade-up" data-aos-delay="">My Bookings</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="site-section" id="maincontent">
    <div class="container">

      <%
    if(Message != null)
  if(Message.equals("BookingSuccess")){ %>
      <div class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
        <h4><i class="icon fa fa-check"></i> Alert!</h4>
        Booking added successfully!
      </div>
      <% } else if(Message.equals("BookingFailed")){ %>
      <div class="alert alert-danger alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
        <h4><i class="icon fa fa-check"></i> Alert!</h4>
        Booking add failed!
      </div>
      <% } else if(Message.equals("DeleteSuccess")){ %>
      <div class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
        <h4><i class="icon fa fa-check"></i> Alert!</h4>
        Booking deleted successfully!
      </div>
      <% } else if(Message.equals("DeleteFailed")){ %>
      <div class="alert alert-danger alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
        <h4><i class="icon fa fa-check"></i> Alert!</h4>
        Booking delete failed!
      </div>
      <% }
  %>

      <div class="row">
        <div class="col-12" data-aos="fade-up">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Booking ID</th>
                <th scope="col">Event</th>
                <th scope="col">Members</th>
                <th scope="col">Status</th>
                <th scope="col">Date of Booking</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
              <% for (Bookings item : list) { %>
              <tr>
                <td>
                  B-<%= item.getID() %>
                </td>
                <td>
                  <a href="view-event.jsp?id=<%= item.getEventID() %>">
                    <%= item.getEventTitle() %>
                  </a>
                </td>
                <td>
                  <%= item.getMembers() %>
                </td>
                <td class="font-weight-bold">
                  <%
                if(item.getStatus() == 0){ %>
                  <span class="text-warning">Pending</span>
                  <% } else { %>
                  <span class="text-success">Accepted</span>
                  <% }
                %>
                </td>
                <td>
                  <%= Formatter.FormatToDate(item.getDateOfBooking()) %>
                </td>
                <td>
                  <%
                  if(item.getStatus() == 0){ %>
                  <button type="button" onclick="DeleteThis('<%= item.getID() %>', '<%= UserID %>')"
                    class="btn btn-danger btn-sm">Delete Booking</button>
                  <% } else { %>
                  <span class="text-muted">No Action required</span>
                  <% }
                  %>
                </td>
              </tr>
              <% } %>
            </tbody>
          </table>
        </div>

      </div>
    </div>
  </div>

</main>
<jsp:include page="footer.jsp" />

<script>
  function DeleteThis(BookingID, UserID) {
    if (confirm('Are you sure you want to delete this booking?')) {
      //DeleteBooking
      window.location.replace('DeleteBooking?bookingid=' + BookingID + '&userid=' + UserID);
    }
  }
</script>