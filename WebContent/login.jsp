<%
if(session.getAttribute("UserID") != null){
	response.sendRedirect("mybookings.jsp");
	return;
}
%>
<jsp:include page="header.jsp">
    <jsp:param name="Title" value="Login" />
    <jsp:param name="LoginActive" value="active" />
</jsp:include>
<% 
String Email = (String) request.getAttribute("Email");
%>
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
                            <h1 data-aos="fade-up" data-aos-delay="">Login</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="pb-4">
        <div class="container">

            <div class="row">

                <div class="col-md-6 m-auto mb-5 mb-md-0" data-aos="fade-up">
                    <%
                        String msg = "";
                        msg = (String) request.getAttribute("msg");
                    %> <%
                        if (msg == "RegisterSuccess") {
                    %>
                    <div class="alert alert-success" role="alert">
                        <strong>Account successfully registered!</strong><br>
                        Kindly login
                    </div>
                    <%
                        } else if(msg == "InvalidCreds") {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <strong>Incorrect email or password!</strong>
                    </div>
                    <% } %>

                    <form action="LoginServlet" method="post" role="form">

                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" name="email" id="email" data-validation="email"
                                    data-validation-error-msg="Enter valid email"
                                    value="<%= (Email != null)?Email:"" %>" />
                            </div>
                            <div class="col-md-12 form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" name="password" id="password"
                                    data-validation="required" data-validation-error-msg="Enter valid password" />
                            </div>
                            <div class="col-md-12 mt-3 mb-3">
                                <p>
                                    <a href="register.jsp">Not yet registered?</a>
                                </p>
                            </div>
                            <div class="col-md-12 form-group">
                                <input type="submit" class="btn btn-primary d-block w-100" value="Login">
                            </div>
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>

</main>
<jsp:include page="footer.jsp" />