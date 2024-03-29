<%@page import="com.eventmanagement.Formatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.eventmanagement.modals.Events"%>
<%@page import="com.eventmanagement.dbutil.AdminUtil"%>
<%
	AdminUtil adminUtil = new AdminUtil();
ArrayList<Events> list = adminUtil.AllEvents();

Boolean DisplayEvents = false;
if (list.size() > 0) {
	DisplayEvents = true;
}
%>
<jsp:include page="header.jsp">
  <jsp:param name="Title" value="All Events" />
  <jsp:param name="EventsActive" value="active" />
</jsp:include>
<main id="main">
      <div class="hero-section inner-page">
        <div class="wave">
          
          <svg width="1920px" height="265px" viewBox="0 0 1920 265" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
              <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g id="Apple-TV" transform="translate(0.000000, -402.000000)" fill="#FFFFFF">
                      <path d="M0,439.134243 C175.04074,464.89273 327.944386,477.771974 458.710937,477.771974 C654.860765,477.771974 870.645295,442.632362 1205.9828,410.192501 C1429.54114,388.565926 1667.54687,411.092417 1920,477.771974 L1920,667 L1017.15166,667 L0,667 L0,439.134243 Z" id="Path"></path>
                  </g>
              </g>
          </svg>

        </div>

        <div class="container">
          <div class="row align-items-center">
            <div class="col-12">
              <div class="row justify-content-center">
                <div class="col-md-7 text-center hero-text">
                  <h1 data-aos="fade-up" data-aos-delay="">All Events</h1>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="site-section">
        <div class="container">
          <div class="row mb-5">
          
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
        </div>
      </div>

    </main>
<jsp:include page="footer.jsp" />