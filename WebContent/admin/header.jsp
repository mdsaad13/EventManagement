<%@page import="com.eventmanagement.dbutil.GeneralUtil"%>
<%@ page import="com.eventmanagement.Environment"%>
<%@page import="com.eventmanagement.modals.Users"%>
<%@page import="com.eventmanagement.dbutil.AccountUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	int AdminID = 0;
try {
	AdminID = (int) session.getAttribute("AdminID");
} catch (Exception e) {
	AdminID = 0;
}

AccountUtil accountUtil = new AccountUtil();
GeneralUtil generalUtil = new GeneralUtil();

String UserName = null;
String UserEmail = null;
try {
	Users UserDetails = accountUtil.GetAdminByID(AdminID);
	UserName = UserDetails.getName();
	UserEmail = UserDetails.getEmail();
} catch (Exception e) {
	response.sendRedirect("login.jsp");
}

int ContactCount = 0;
int BookingCount = 0;
try{
	ContactCount = generalUtil.CountByArgs("contact_us", "seen = 0");
} catch (Exception e){
	ContactCount = 0;
}

try{
	BookingCount = generalUtil.CountByArgs("bookings", "seen = 0");
} catch (Exception e){
	ContactCount = 0;
}

%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><%=Environment._SoftwareName%> | ${param.Title}</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- Datatables -->
    <link rel="stylesheet" href="bower_components/DataTables/datatables.min.css">
    <!-- Google Font -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        
        <link href="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/theme-default.min.css" rel="stylesheet"
        type="text/css" />
</head>

<body class="sidebar-mini skin-blue-light fixed">
    <div class="wrapper">

        <header class="main-header">
            <!-- Logo -->
            <a href="index2.html" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b><%=Environment._SoftwareShortName%></b></span>
                <!-- logo for regular state and mobile devices --> <span
                    class="logo-lg"><b><%=Environment._SoftwareName%></b></span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"> <span class="sr-only">Toggle
                        navigation</span>
                </a>

                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">

                        <li class="dropdown user user-menu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="dist/img/user-white.svg" class="user-image" alt="User Image"> <span
                                    class="hidden-xs"><%=UserName%></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header"><img src="dist/img/user-white.svg" class="img-circle"
                                        alt="User Image">

                                    <p>
                                        <%=UserName%>
                                        <small><%=UserEmail%></small>
                                    </p>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="settings.jsp" class="btn btn-default btn-flat">Settings</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="logout.jsp" class="btn btn-default btn-flat">Logout</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="dist/img/user.svg" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p><%=UserName%></p>
                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">MAIN NAVIGATION</li>

                    <li class="${param.IndexActive}">
                        <a href="index.jsp"> <i class="fa fa-dashboard"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="${param.CategoriesActive}">
                        <a href="categories.jsp"> <i class="fa fa-th"></i>
                            <span>Categories</span>
                        </a>
                    </li>
                    <li class="${param.EventsActive}">
                        <a href="events.jsp"> <i class="fa fa-calendar-o"></i> <span>Events</span>
                        </a>
                    </li>
                    <li class="${param.UsersActive}">
                        <a href="users.jsp"> <i class="fa fa-users"></i> <span>Users</span>
                        </a>
                    </li>
                    <li class="${param.BookingsActive}">
                        <a href="bookings.jsp"> <i class="fa fa-credit-card"></i> <span>Bookings</span>
                            <%
					if(BookingCount > 0){ %>
                            <span class="pull-right-container"> <small
                                    class="label pull-right bg-green"><%= BookingCount %> new</small>
                            </span>
                            <% } %>
                        </a>
                    </li>
                    <li class="${param.ContactActive}">
                        <a href="contactus.jsp"> <i class="fa fa-phone"></i> <span>Contact Us</span>
                            <%
					if(ContactCount > 0){ %>
                            <span class="pull-right-container"> <small
                                    class="label pull-right bg-green"><%= ContactCount %> new</small>
                            </span>
                            <% } %>
                        </a>
                    </li>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>