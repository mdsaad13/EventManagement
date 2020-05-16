<%@page import="com.eventmanagement.dbutil.AccountUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.eventmanagement.*" %>
<%
String Name = null;
if(session.getAttribute("UserID") != null){
	AccountUtil accountUtil = new AccountUtil();
	Name = accountUtil.GetUserByID((int) session.getAttribute("UserID")).getName();
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title><%= Environment._SoftwareName %> | ${param.Title}</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,700|Roboto:300,400,700&display=swap"
        rel="stylesheet">

    <!-- Bootstrap CSS File -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
    <link href="assets/vendor/line-awesome/css/line-awesome.min.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <link href="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/theme-default.min.css" rel="stylesheet"
        type="text/css" />
</head>

<body>

    <div class="site-wrap">

        <div class="site-mobile-menu site-navbar-target">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close mt-3">
                    <span class="icofont-close js-menu-toggle"></span>
                </div>
            </div>
            <div class="site-mobile-menu-body"></div>
        </div>

        <header class="site-navbar js-sticky-header site-navbar-target" role="banner">

            <div class="container">
                <div class="row align-items-center">

                    <div class="col-6 col-lg-2">
                        <h1 class="mb-0 site-logo"><a href="index.jsp" class="mb-0"><%= Environment._SoftwareName %></a>
                        </h1>
                    </div>

                    <div class="col-12 col-md-10 d-none d-lg-block">
                        <nav class="site-navigation position-relative text-right" role="navigation">

                            <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                                <li class="${param.IndexActive}"><a href="index.jsp" class="nav-link">Home</a></li>
                                <li class="${param.EventsActive}"><a href="events.jsp" class="nav-link">Events</a></li>
                                <li class="${param.ContactActive}"><a href="contact.jsp" class="nav-link">Contact</a>
                                </li>
                                <%
			                        if(session.getAttribute("UserID") == null){ %>
                                <li class="${param.LoginActive}"><a href="login.jsp" class="nav-link">Login</a></li>
                                <li class="${param.RegisterActive}"><a href="register.jsp" class="nav-link">Register</a>
                                </li>
                                <% } else { %>
                                <li class="has-children ${param.BookingsActive} ${param.SettingsActive}">
                                    <a href="blog.html" class="nav-link">Welcome <%= Name %></a>
                                    <ul class="dropdown">
                                        <li class=""><a href="mybookings.jsp"
                                                class="nav-link ${param.BookingsActive}">My Bookings</a></li>
                                        <li class=""><a href="settings.jsp"
                                                class="nav-link ${param.SettingsActive}">Settings</a></li>
                                        <li class=""><a href="logout.jsp" class="nav-link">Logout</a></li>
                                    </ul>
                                </li>
                                <% } %>


                            </ul>
                        </nav>
                    </div>

                    <div class="col-6 d-inline-block d-lg-none ml-md-0 py-3" style="position: relative; top: 3px;">
                        <a href="#" class="burger site-menu-toggle js-menu-toggle" data-toggle="collapse"
                            data-target="#main-navbar">
                            <span></span>
                        </a>
                    </div>

                </div>
            </div>

        </header>