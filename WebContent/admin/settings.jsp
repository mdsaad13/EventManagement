<%@page import="com.eventmanagement.modals.Users"%>
<%@page import="com.eventmanagement.dbutil.AccountUtil"%>
<%
	if (session.getAttribute("AdminID") == null) {
	response.sendRedirect("login.jsp");
	return;
}

AccountUtil accountUtil = new AccountUtil();
Users user = accountUtil.GetAdminByID((int) session.getAttribute("AdminID"));

String Message = null;
Message = request.getParameter("message");
%>
<jsp:include page="header.jsp">
	<jsp:param name="Title" value="Settings" />
</jsp:include>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Settings <small>Admin panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Settings</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<%
			if (Message != null)
			if (Message.equals("UpdateSuccess")) {
		%>
		<div class="alert alert-success alert-dismissible">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">X</button>
			<h4>
				<i class="icon fa fa-check"></i> Alert!
			</h4>
			Profile updated successfully!
		</div>
		<%
			} else if (Message.equals("UpdateFailed")) {
		%>
		<div class="alert alert-danger alert-dismissible">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">X</button>
			<h4>
				<i class="icon fa fa-check"></i> Alert!
			</h4>
			Profile update failed!
		</div>
		<%
			} else if (Message.equals("PasswordChangeSuccess")) {
		%>
		<div class="alert alert-success alert-dismissible">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">X</button>
			<h4>
				<i class="icon fa fa-check"></i> Alert!
			</h4>
			Password changed successfully!
		</div>
		<%
			} else if (Message.equals("PasswordChangeFailed")) {
		%>
		<div class="alert alert-danger alert-dismissible">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">X</button>
			<h4>
				<i class="icon fa fa-check"></i> Alert!
			</h4>
			Password change failed!
		</div>
		<%
			} else if (Message.equals("IncorrectPassword")) {
		%>
		<div class="alert alert-danger alert-dismissible">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">X</button>
			<h4>
				<i class="icon fa fa-check"></i> Alert!
			</h4>
			Incorrect password entered! Kindly enter correct password.
		</div>
		<%
			}
		%>
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-md-6">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">General Details</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form role="form" method="post" action="Settings">
						<div class="box-body">
							<div class="form-group">
								<label for="name">Name</label> <input type="text"
									class="form-control" id="name" name="name"
									placeholder="Enter name" value="<%= user.getName() %>">
							</div>
							<div class="form-group">
								<label for="email">Email</label> <input type="email"
									class="form-control" id="email" name="email"
									placeholder="Enter email" value="<%= user.getEmail() %>">
							</div>
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">Update
								Profile</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-6">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Change Password</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form role="form" method="post" action="ChangePassword">
						<div class="box-body">
							<div class="form-group">
								<label for="password">Current Password</label> <input
									type="password" class="form-control" name="password"
									id="password" />
							</div>
							<div class="form-group">
								<label for="new_password">New Password</label> <input
									type="password" class="form-control" name="new_password"
									id="new_password" />
							</div>
							<div class="form-group">
								<label for="re_new_password">Re-Enter New Password</label> <input
									type="password" class="form-control" name="re_new_password"
									id="re_new_password" />
							</div>
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">Change
								Password</button>
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