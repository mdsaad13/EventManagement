<%@page import="com.eventmanagement.Formatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.eventmanagement.modals.Categories"%>
<%@page import="com.eventmanagement.dbutil.AdminUtil"%>
<%
if(session.getAttribute("AdminID") == null){
	response.sendRedirect("login.jsp");
	return;
}

AdminUtil adminUtil = new AdminUtil();
ArrayList<Categories> list = adminUtil.AllCategories();

String Message = null;
Message = request.getParameter("message");
%>
<jsp:include page="header.jsp">
  <jsp:param name="Title" value="Categories" />
  <jsp:param name="CategoriesActive" value="active" />
</jsp:include>
<!-- Add modal -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
            aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Category</h4>
      </div>
      <div class="modal-body">
        <form action="AddCategory" method="post">
          <div class="form-group">
            <label for="name">Category Name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter category name" required
              data-validation="required" data-validation-error-msg="Enter valid category name">
          </div>
          <div class="form-group" style="margin:2rem">
            <button class="btn btn-primary btn-block" type="submit">Add</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Edit modal -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
            aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="updateModalLabel">Update Category</h4>
      </div>
      <div class="modal-body">
        <form action="EditCategory" method="post">
          <input type="hidden" name="id" id="id">
          <div class="form-group">
            <label for="name">Category Name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter category name" required
              data-validation="required" data-validation-error-msg="Enter valid category name">
          </div>
          <div class="form-group" style="margin:2rem">
            <button class="btn btn-primary btn-block" type="submit">Update</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      All Categories
      <small>Admin panel</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">All Categories</li>
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
      Category added successfully!
    </div>
    <% } else if(Message.equals("AddFailed")){ %>
    <div class="alert alert-danger alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
      <h4><i class="icon fa fa-check"></i> Alert!</h4>
      Category add failed!
    </div>
    <% } else if(Message.equals("UpdateSuccess")){ %>
    <div class="alert alert-success alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
      <h4><i class="icon fa fa-check"></i> Alert!</h4>
      Category updated successfully!
    </div>
    <% } else if(Message.equals("UpdateFailed")){ %>
    <div class="alert alert-danger alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
      <h4><i class="icon fa fa-check"></i> Alert!</h4>
      Category update failed!
    </div>
    <% }
  %>
    <div class="">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Add
                Category</button>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="myDataTable" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <%
              int i = 1;
              for (Categories item : list) 
              { %>
                  <tr>
                    <td>
                      <%= i %>
                    </td>
                    <td>
                      <%= item.getName() %>
                    </td>
                    <td>
                      <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#updateModal"
                        data-id="<%= item.getID() %>" data-name="<%= item.getName() %>">Edit</button>
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

  $('#updateModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var id = button.data('id');
    var name = button.data('name');
    var modal = $(this);
    modal.find('.modal-title').text('Update Category - ' + name);
    modal.find('.modal-body #id').val(id);
    modal.find('.modal-body #name').val(name);
  });
</script>