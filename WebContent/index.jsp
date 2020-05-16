<%@page import="com.eventmanagement.Formatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.eventmanagement.modals.Events"%>
<%@page import="com.eventmanagement.dbutil.AdminUtil"%>
<%
	AdminUtil adminUtil = new AdminUtil();
ArrayList<Events> list = adminUtil.OnlyHomeEvents();

Boolean DisplayEvents = false;
if (list.size() > 0) {
	DisplayEvents = true;
}
%>
<jsp:include page="header.jsp">
<jsp:param name="Title" value="Home" />
  <jsp:param name="IndexActive" value="active" />
</jsp:include>
<main id="main">
    <div class="hero-section">
        <div class="wave">

            <svg width="100%" height="355px" viewBox="0 0 1920 355" version="1.1" xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink">
                <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <g id="Apple-TV" transform="translate(0.000000, -402.000000)" fill="#FFFFFF">
                        <path
                            d="M0,439.134243 C175.04074,464.89273 327.944386,477.771974 458.710937,477.771974 C654.860765,477.771974 870.645295,442.632362 1205.9828,410.192501 C1429.54114,388.565926 1667.54687,411.092417 1920,477.771974 L1920,757 L1017.15166,757 L0,757 L0,439.134243 Z"
                            id="Path"></path>
                    </g>
                </g>
            </svg>

        </div>

        <div class="container">
            <div class="row align-items-center">
                <div class="col-12 hero-text-image">
                    <div class="row">
                        <div class="col-lg-7 text-center text-lg-left">
                            <h1 data-aos="fade-right">Promote Your App with SoftLand</h1>
                            <p class="mb-5" data-aos="fade-right" data-aos-delay="100">Lorem
                                ipsum dolor sit amet, consectetur adipisicing elit.</p>
                            <p data-aos="fade-right" data-aos-delay="200" data-aos-offset="-500">
                                <a href="#" class="btn btn-outline-white">Get started</a>
                            </p>
                        </div>
                        <div class="col-lg-5 iphone-wrap">
                            <img src="assets/img/hero.jpg" alt="Image" class="phone-1" data-aos="fade-right"
                                style="width: 100%;"> <img src="assets/img/hero1.webp" alt="Image" class="phone-2"
                                data-aos="fade-right" data-aos-delay="200" style="width: 100%;">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="site-section">
        <div class="container">

            <div class="row justify-content-center text-center mb-5">
                <div class="col-md-5" data-aos="fade-up">
                    <h2 class="section-heading">Save your time to using SoftLand</h2>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="">
                    <div class="feature-1 text-center">
                        <div class="wrap-icon icon-1">
                            <span class="icon la la-users"></span>
                        </div>
                        <h3 class="mb-3">Explore Your Team</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                            Rem, optio.</p>
                    </div>
                </div>
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="feature-1 text-center">
                        <div class="wrap-icon icon-1">
                            <span class="icon la la-toggle-off"></span>
                        </div>
                        <h3 class="mb-3">Digital Whiteboard</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                            Rem, optio.</p>
                    </div>
                </div>
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="feature-1 text-center">
                        <div class="wrap-icon icon-1">
                            <span class="icon la la-umbrella"></span>
                        </div>
                        <h3 class="mb-3">Design To Development</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                            Rem, optio.</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- .site-section -->

    <%
		if (DisplayEvents) {
	%>
    <div class="site-section">
        <div class="container">
            <div class="row justify-content-center text-center mb-5">
                <div class="col-md-5" data-aos="fade-up">
                    <h2 class="section-heading">Events</h2>
                </div>
            </div>
            <div class="row">
                <% for (Events item : list) { %>
                <div class="col-md-4">
                    <div class="post-entry">
                        <a href="blog-single.html" class="d-block mb-4"> <img
                                src="assets/EventImages/<%= item.getImgUrl() %>" alt="Image" class="img-fluid">
                        </a>
                        <div class="post-text">
                            <span class="post-meta">Venue Date:
                                <%= Formatter.FormatToDate(item.getVenueDate()) %></span>
                            <h3>
                                <a href="#"><%= item.getTitle()%></a>
                            </h3>
                            <p><%= item.getTitle() %></p>
                            <p>
                                <a href="view-event.jsp?id=<%= item.getID() %>" class="readmore">More Details</a>
                            </p>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <a href="events.jsp" class="btn btn-default btn-block">View All</a>
        </div>
    </div>
    <%
		}
	%>

    <div class="site-section cta-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 mr-auto text-center text-md-left mb-5 mb-md-0">
                    <h2>Have any queries?</h2>
                </div>
                <div class="col-md-5 text-center text-md-right">
                    <p>
                        <a href="contact.jsp" class="btn"><span class="icofont-phone mr-3"></span>Contact Us</a>
                    </p>
                </div>
            </div>
        </div>
    </div>


</main>

<jsp:include page="footer.jsp" />