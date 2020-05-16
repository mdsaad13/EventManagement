<%@page import="com.eventmanagement.modals.Bookings"%>
<%@page import="com.eventmanagement.Formatter"%>
<%@page import="com.eventmanagement.modals.Events"%>
<%@page import="com.eventmanagement.dbutil.AdminUtil"%>
<%@page import="java.util.ArrayList"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

String Title = "View Event";

String Message = null;
Message = request.getParameter("message");

int EventID = 0;
EventID = Integer.parseInt(request.getParameter("id"));

AdminUtil adminUtil = new AdminUtil();
Events event = adminUtil.GetEventByID(EventID);

ArrayList<Bookings> list = adminUtil.AllBookings();

%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="<%= Title %>" />
    <jsp:param name="EventsActive" value="active" />
</jsp:include>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <%= Title %>
            <small>Control panel</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="events.jsp"><i class="fa fa-dashboard"></i> All Events</a></li>
            <li class="active"><%= Title %></li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
            <%
    if(Message != null)
  if(Message.equals("UpdateSuccess")){ %>
        <div class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
            <h4><i class="icon fa fa-check"></i> Alert!</h4>
            Event updated successfully!
        </div>
        <% } else if(Message.equals("UpdateFailed")){ %>
        <div class="alert alert-danger alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
            <h4><i class="icon fa fa-check"></i> Alert!</h4>
            Event update failed!
        </div>
        <% } else if(Message.equals("BookingUpdateSuccess")){ %>
        <div class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
            <h4><i class="icon fa fa-check"></i> Alert!</h4>
            Booking status updated successfully!
        </div>
        <% } else if(Message.equals("BookingUpdateFailed")){ %>
        <div class="alert alert-danger alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
            <h4><i class="icon fa fa-check"></i> Alert!</h4>
            Booking status update failed!
        </div>
        <% } %>
        <!-- Small boxes (Stat box) -->
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">
                        	<i class="fa fa-tag"></i> <%= event.getTitle() %>
                        	<a href="edit-event.jsp?id=<%= event.getID() %>" class="btn btn-primary btn-sm">Edit</a>
                        	<button onclick="DeleteThis('<%= event.getID() %>')" class="btn btn-danger btn-sm">Delete</button>
                        </h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-6">
                                <table class="table">
                                    <tr>
                                        <th>
                                            Title
                                        </th>
                                        <td>
                                            <%= event.getTitle() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Description
                                        </th>
                                        <td>
                                            <%= event.getDescription() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Category
                                        </th>
                                        <td>
                                            <%= event.getCatName() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Visibility
                                        </th>
                                        <td>
                                        <%
                                        if(event.getVisibility() == 1){
                                        	out.println("Show on home page");
                                        }else{
                                        	out.println("Hidden on home page");
                                        }
                                        %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Added Date
                                        </th>
                                        <td>
                                            <%= Formatter.FormatToDateTime(event.getDateTime()) %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Venue Date
                                        </th>
                                        <td>
                                        <%= Formatter.FormatToDateTime(event.getVenueDate()) %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            Venue Address
                                        </th>
                                        <td>
                                            <%= event.getAddress() %>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <img src="../assets/EventImages/<%= event.getImgUrl() %>" class="img-responsive" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
            </div>
        </div>
        <!-- /.row -->
        
        <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <%= Title %>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="myDataTable" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Booking ID</th>
                                        <th>Event</th>
                                        <th>User</th>
                                        <th>Booked for</th>
                                        <th>Status</th>
                                        <th>Date of booking</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
              int i = 1;
              for (Bookings item : list) 
              { %>
                                    <tr>
                                        <td>
                                            <%= i %>
                                        </td>
                                        <td>
                                            <%= item.getID() %>
                                        </td>
                                        <td>
                                            <a href="view-event.jsp?id=<%= item.getEventID() %>">
                                                <%= item.getEventTitle() %>
                                            </a>
                                        </td>
                                        <td>
                                            <%= item.getUserName()%>
                                        </td>
                                        <td>
                                            <%= item.getMembers() %> Member(s)
                                        </td>
                                        <th>
                                            <%
                                        if(item.getStatus() == 0){
                                        	out.println("Pending");
                                        }else{
                                        	out.println("Accepted");
                                        }
                                        %>
                                        </th>
                                        <td>
                                            <%= Formatter.FormatToDateTime(item.getDateOfBooking()) %>
                                        </td>
                                        <td>
                                            <%
                                            if(item.getStatus() == 0){ %>
                                            <a href="UpdateBookingStatus?bookingid=<%= item.getID() %>&returnurl=view-event.jsp?id=<%= event.getID() %>"
                                                class="btn btn-success btn-sm">
                                                Accept
                                            </a>
                                            <% }else{
                                                out.println("No Action required");
                                            }
                                            %>
                                        </td>
                                    </tr>
                                    <%  i++;
              }
              %>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>#</th>
                                        <th>Booking ID</th>
                                        <th>Event</th>
                                        <th>User</th>
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
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<jsp:include page="footer.jsp" />
<script>
  function DeleteThis(EventID) {
    if (confirm('Are you sure you want to delete this event?')) {
      //DeleteBooking
      window.location.replace('DeleteEvent?eventid=' + EventID);
    }
  }
</script>
