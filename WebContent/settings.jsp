<%@page import="com.eventmanagement.modals.Users"%>
<%@page import="com.eventmanagement.dbutil.AccountUtil"%>
<%
if(session.getAttribute("UserID") == null){
	response.sendRedirect("login.jsp");
	return;
}

AccountUtil accountUtil = new AccountUtil();
Users user = accountUtil.GetUserByID((int) session.getAttribute("UserID"));

String Message = null;
Message = request.getParameter("message");
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="Settings" />
    <jsp:param name="SettingsActive" value="active" />
</jsp:include>
<main id="main">
    <div class="hero-section inner-page reduceHeight">
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
                            <h1 data-aos="fade-up" data-aos-delay="">Settings</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="pb-4">
        <div class="container">
            <%
            if(Message != null)
                if(Message.equals("UpdateSuccess")){ %>
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
                <h4><i class="icon fa fa-check"></i> Alert!</h4>
                Profile updated successfully!
            </div>
            <% } else if(Message.equals("UpdateFailed")){ %>
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
                <h4><i class="icon fa fa-check"></i> Alert!</h4>
                Profile update failed!
            </div>
            <% } else if(Message.equals("PasswordChangeSuccess")){ %>
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
                <h4><i class="icon fa fa-check"></i> Alert!</h4>
                Password changed successfully!
            </div>
            <% } else if(Message.equals("PasswordChangeFailed")){ %>
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
                <h4><i class="icon fa fa-check"></i> Alert!</h4>
                Password change failed!
            </div>
            <% } else if(Message.equals("IncorrectPassword")){ %>
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
                <h4><i class="icon fa fa-check"></i> Alert!</h4>
                Incorrect password entered! Kindly enter correct password.
            </div>
            <% } %>
            <div class="row">

                <div class="col-md-6" data-aos="fade-up">
                    <form action="SettingsServlet" method="post" role="form">
                        <h3 class="text-center mb-4 mt-2">General Details</h3>
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" name="name" id="name"
                                    value="<%= user.getName() %>" />
                            </div>
                            <div class="col-md-12 form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" name="email" id="email"
                                    value="<%= user.getEmail() %>" />
                            </div>
                            <div class="col-md-12 form-group">
                                <label for="mobile">Mobile</label>
                                <input type="text" class="form-control" name="mobile" id="mobile"
                                    value="<%= user.getMobile() %>" />
                            </div>
                            <div class="col-md-12 form-group">
                                <input type="submit" class="btn btn-primary d-block w-100" value="Update">
                            </div>
                        </div>

                    </form>
                </div>
                <div class="col-md-6" data-aos="fade-up">
                    <form action="ChangePasswordServlet" method="post" role="form">
                        <h3 class="text-center mb-4 mt-2">Change Password</h3>
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label for="password">Current Password</label>
                                <input type="password" class="form-control" name="password" id="password" />
                            </div>
                            <div class="col-md-12 form-group">
                                <label for="new_password">New Password</label>
                                <input type="password" class="form-control" name="new_password" id="new_password" />
                            </div>
                            <div class="col-md-12 form-group">
                                <label for="re_new_password">Re-Enter New Password</label>
                                <input type="password" class="form-control" name="re_new_password"
                                    id="re_new_password" />
                            </div>
                            <div class="col-md-12 form-group">
                                <input type="submit" class="btn btn-primary d-block w-100" value="Change Password">
                            </div>
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>

</main>
<jsp:include page="footer.jsp" />