<%@ page import="com.eventmanagement.Environment" %>
<%@page import="com.eventmanagement.modals.Users"%>
<%@page import="com.eventmanagement.dbutil.AccountUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	int AdminID = 0;
	try{
		AdminID = (int)session.getAttribute("AdminID");
	} catch(Exception e){
		AdminID = 0;
	}
	
    AccountUtil accountUtil = new AccountUtil();
    String UserName = null;
    String UserEmail = null;
    try{
    	Users UserDetails =  accountUtil.GetAdminByID(AdminID);
    	UserName = UserDetails.getName();
    	UserEmail = UserDetails.getEmail();
    }catch(Exception e){
    	response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><%= Environment._SoftwareName %> | Dashboard</title>
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
    <!-- Morris chart -->
    <link rel="stylesheet" href="bower_components/morris.js/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">

    <!-- Google Font -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="sidebar-mini skin-blue-light fixed">
    <div class="wrapper">

        <header class="main-header">
            <!-- Logo -->
            <a href="index2.html" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b><%= Environment._SoftwareShortName %></b></span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b><%= Environment._SoftwareName %></b></span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>

                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">

                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                                <span class="hidden-xs"><%= UserName %></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
									
                                    <p>
                                    <%= UserName %>
                                    <small><%= UserEmail %></small>
                                    </p>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="#" class="btn btn-default btn-flat">Sign out</a>
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
                        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p><%= UserName %></p>
                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">MAIN NAVIGATION</li>

                    <li class="active">
                        <a href="categories.jsp">
                            <i class="fa fa-th"></i> <span>Categories</span>
                        </a>
                    </li>
                    <li>
                        <a href="categories.jsp">
                            <i class="fa fa-th"></i> <span>Events</span>
                        </a>
                    </li>
                    <li>
                        <a href="categories.jsp">
                            <i class="fa fa-th"></i> <span>Users</span>
                        </a>
                    </li>
                    <li>
                        <a href="categories.jsp">
                            <i class="fa fa-th"></i> <span>Bookings</span>
                            <span class="pull-right-container">
                                <small class="label pull-right bg-green">6 new</small>
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="contactus.jsp">
                            <i class="fa fa-th"></i> <span>Contact Us</span>
                            <span class="pull-right-container">
                                <small class="label pull-right bg-green">6 new</small>
                            </span>
                        </a>
                    </li>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>