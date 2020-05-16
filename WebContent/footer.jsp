<%@ page import="com.eventmanagement.*" %>

<footer class="footer" role="contentinfo">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mb-6 mb-md-0">
                <h3><%= Environment._SoftwareName %></h3>
                <p>
                    <%= Environment._OwnerAddress %>
                </p>
                <p class="social">
                    <a href="<%= Environment._TwitterURL %>"><span class="icofont-twitter"></span></a>
                    <a href="<%= Environment._FBURL %>"><span class="icofont-facebook"></span></a>
                    <a href="<%= Environment._InstaURL %>"><span class="icofont-instagram"></span></a>
                </p>
            </div>
            <div class="col-md-6 ">
                <div class="row site-section pt-0">
                    <div class="col-12 mb-md-0">
                        <h3>Navigation</h3>
                        <ul class="list-unstyled">
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="events.jsp">Events</a></li>
                            <li><a href="contact.jsp">Contact Us</a></li>
                            <li><a href="register.jsp">Register</a></li>
                            <li><a href="login.jsp">Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center text-center">
            <div class="col-md-7">
                <p class="copyright">&copy; Copyright <%= Environment._SoftwareName %>. All Rights Reserved</p>
                <div class="credits">
                    Designed by <a href="#"><%= Environment._OwnerName %></a>
                </div>
            </div>
        </div>

    </div>
</footer>
</div> <!-- .site-wrap -->

<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

<!-- Vendor JS Files -->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/jquery/jquery-migrate.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/easing/easing.min.js"></script>
<script src="assets/vendor/sticky/sticky.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>


<!-- Validator -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>

    $.validate({
        modules: 'location, date, security, file',
        onModulesLoaded: function () {
            $('#country').suggestCountry();
        }
    });

    // Restrict presentation length
    $('#presentation').restrictLength($('#pres-max-length'));
</script>

</body>

</html>