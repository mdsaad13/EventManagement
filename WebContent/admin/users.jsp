<%@page import="com.eventmanagement.modals.Users"%>
<%@page import="com.eventmanagement.dbutil.AccountUtil"%>
<%@page import="com.eventmanagement.Formatter"%>
<%@page import="java.util.ArrayList"%>

<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}
AccountUtil accountUtil = new AccountUtil();

ArrayList<Users> list = accountUtil.AllUsers();
String Title = "Abc";
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="All Users" />
    <jsp:param name="UsersActive" value="active" />
</jsp:include>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            All Users
            <small>Admin panel</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">All Users</li>
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
                            <h3 class="box-title">All Users</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="myDataTable" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Mobile</th>
                                        <th>Joined Date</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int i = 1;
                                        for (Users item : list) 
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
                                            <%= item.getMobile() %>
                                        </td>
                                        <td>
                                            <%= Formatter.FormatToDateTime(item.getDateTime()) %>
                                        </td>
                                        <td>
                                            <a href="view-user.jsp?id=<%= item.getID() %>"
                                                class="btn btn-sm btn-info">View</a>
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
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Mobile</th>
                                        <th>Joined Date</th>
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