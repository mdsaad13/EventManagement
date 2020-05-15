<%@page import="com.eventmanagement.Formatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.eventmanagement.modals.Enquiries"%>
<%@page import="com.eventmanagement.dbutil.AdminUtil"%>

<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

AdminUtil adminUtil = new AdminUtil();
ArrayList<Enquiries> list = adminUtil.AllEnquiries();
String Title = "Abc";
%>
<jsp:include page="header.jsp">
  <jsp:param name="Title" value="Contact us" />
  <jsp:param name="ContactActive" value="active" />
</jsp:include>
<% adminUtil.UpdateEnquiriesToSeen(); %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Contact us enquires
      <small>Admin panel</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Contact us enquires</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">All Contact us enquires</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="myDataTable" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Message</th>
                    <th>Date</th>
                  </tr>
                </thead>
                <tbody>
                  <%
              int i = 1;
              for (Enquiries item : list) 
              { %>
                  <tr>
                    <td>
                      <%= i %>
                    </td>
                    <td>
                      <%= item.getName() %>
                    </td>
                    <td>
                      <%= item.getEmail() %>
                    </td>
                    <td>
                      <%= item.getSubject() %>
                    </td>
                    <td>
                      <%= item.getMessage() %>
                    </td>
                    <td>
                      <%= Formatter.FormatToDateTime(item.getDateTime()) %>
                    </td>
                  </tr>
                  <%  i++;
              }
              %>
                </tbody>
                <tfoot>
                  <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Message</th>
                    <th>Date</th>
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