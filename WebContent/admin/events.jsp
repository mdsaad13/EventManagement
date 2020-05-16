<%@page import="com.eventmanagement.Formatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.eventmanagement.modals.Events"%>
<%@page import="com.eventmanagement.dbutil.AdminUtil"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

AdminUtil adminUtil = new AdminUtil();
ArrayList<Events> list = adminUtil.AllEvents();

String Message = null;
Message = request.getParameter("message");
%>
<jsp:include page="header.jsp">
  <jsp:param name="Title" value="All Event" />
  <jsp:param name="EventsActive" value="active" />
</jsp:include>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      All Event
      <small>Admin panel</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">All Event</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <%
    if(Message != null)
  if(Message.equals("AddSuccess")){ %>
    <div class="alert alert-success alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
      <h4><i class="icon fa fa-check"></i> Alert!</h4>
      Event added successfully!
    </div>
    <% } else if(Message.equals("AddFailed")){ %>
    <div class="alert alert-danger alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
      <h4><i class="icon fa fa-check"></i> Alert!</h4>
      Event add failed!
    </div>
    <% } else if(Message.equals("DeleteSuccess")){ %>
    <div class="alert alert-success alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
      <h4><i class="icon fa fa-check"></i> Alert!</h4>
      Event deleted successfully!
    </div>
    <% } else if(Message.equals("DeleteFailed")){ %>
    <div class="alert alert-danger alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
      <h4><i class="icon fa fa-check"></i> Alert!</h4>
      Event delete failed!
    </div>
    <% } %>
    <div class="">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <a href="add-event.jsp" class="btn btn-primary">Add Event</a>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="myDataTable" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Image</th>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Added Date</th>
                    <th>Venue Date</th>
                    <th>Address</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <%
              int i = 1;
              for (Events item : list) 
              { %>
                  <tr>
                    <td>
                      <%= i %>
                    </td>
                    <td>
                      <img src="../assets/EventImages/<%= item.getImgUrl() %>" height="100" alt="">
                    </td>
                    <td>
                      <%= item.getTitle() %>
                    </td>
                    <td>
                      <%= item.getCatName() %>
                    </td>
                    <td>
                      <%= item.getDescription() %>
                    </td>
                    <td>
                      <%= Formatter.FormatToDateTime(item.getDateTime()) %>
                    </td>
                    <td>
                      <%= Formatter.FormatToDateTime(item.getVenueDate()) %>
                    </td>
                    <td>
                      <%= item.getAddress() %>
                    </td>
                    <td>
                      <a href="view-event.jsp?id=<%= item.getID() %>" class="btn btn-info btn-sm">View</a>
                    </td>
                  </tr>
                  <%  i++;
              }
              %>
                </tbody>
                <tfoot>
                  <tr>
                    <th>#</th>
                    <th>Image</th>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Added Date</th>
                    <th>Venue Date</th>
                    <th>Address</th>
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
  $(document).ready(function () {
    $('#myDataTable').DataTable({
      responsive: true
    });
  });
</script>