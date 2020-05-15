<%@page import="com.eventmanagement.modals.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.eventmanagement.dbutil.AdminUtil"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

AdminUtil adminUtil = new AdminUtil();

ArrayList<Categories> AllCats = adminUtil.AllCategories();
%>
<jsp:include page="header.jsp">
  <jsp:param name="Title" value="Add Event" />
  <jsp:param name="EventsActive" value="active" />
</jsp:include>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Add Event
      <small>Control panel</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
      <li><a href="events.jsp"><i class="fa fa-dashboard"></i> All Events</a></li>
      <li class="active">Add Event</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row">
      <div class="col-md-12">
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Add Event</h3>
          </div>
          <!-- /.box-header -->
          <!-- form start -->
          <form role="form" method="POST" action="AddEvent" enctype="multipart/form-data">
            <div class="box-body">
              <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" name="title" id="title" placeholder="Enter title">
              </div>
              <div class="form-group">
                <label for="title">Description</label>
                <textarea class="form-control" name="description" id="description" cols="30" rows="10"></textarea>
              </div>
              <div class="form-group">
                <label>Category</label>
                <select class="form-control" name="catid">
                  <%
                  for(Categories singleCat : AllCats){ %>
                  <option value="<%=singleCat.getID()%>"><%=singleCat.getName()%></option>
                  <% }
                  %>
                </select>
              </div>
              <div class="form-group">
                <label>Visibility</label>
                <select class="form-control" name="event_visibility">
                  <option value="2">Hide on home page</option>
                  <option value="1">Show on home page</option>
                </select>
              </div>
              <div class="form-group">
                <label for="venueDate">Venue Date</label>
                <input type="text" class="form-control" name="venueDate" id="venueDate" placeholder="Enter venue date">
              </div>
              <div class="form-group">
                <label for="address">Address</label>
                <textarea class="form-control" name="address" id="address" cols="10" rows="5"></textarea>
              </div>
              <div class="form-group">
                <label for="exampleInputFile">File input</label>
                <input type="file" id="exampleInputFile" name="file">
              </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
              <button type="submit" class="btn btn-primary">Submit</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<jsp:include page="footer.jsp" />

<script>
  $(function () {
    //Date range picker with time picker
    $('#venueDate').daterangepicker({
      singleDatePicker: true,
      timePicker: true,
      minDate: new Date,
      drops:'up',
      locale: {
        format: 'YYYY/MM/DD HH:mm'
      }
    })
  });
</script>