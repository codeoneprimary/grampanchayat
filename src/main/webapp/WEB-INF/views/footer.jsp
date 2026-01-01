<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>

<!-- Footer Start -->
<div class="container-fluid bg-dark text-light footer">
	<div class="container py-5">
		<div class="row g-5">
			<div class="col-lg-4 col-md-6">
				<h4 class="text-white mb-4">
					<spring:message code="header.village_name" />
				</h4>
				<spring:message code="header.grampanchayat" />
				<p class="mb-2">
					<i class="fa fa-map-marker-alt me-3"></i>
					<spring:message code="header.grampanchayat_address" />
				</p>
				<p class="mb-2">
					<i class="fa fa-phone-alt me-3"></i>+012 345 67890
				</p>
				<p class="mb-2">
					<i class="fa fa-envelope me-3"></i>info@example.com
				</p>


				<div class="d-flex pt-2">
					<a class="btn btn-square btn-outline-light rounded-circle me-2"
						href=""><i class="fab fa-twitter"></i></a> <a
						class="btn btn-square btn-outline-light rounded-circle me-2"
						href=""><i class="fab fa-facebook-f"></i></a> <a
						class="btn btn-square btn-outline-light rounded-circle me-2"
						href=""><i class="fab fa-youtube"></i></a> <a
						class="btn btn-square btn-outline-light rounded-circle me-2"
						href=""><i class="fab fa-linkedin-in"></i></a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">

				<h4 class="text-white mb-4">
					<spring:message code="header.department" />
				</h4>

				<a class="dropdown-item" href="healthDepartment"><spring:message
						code="header.health_department" /></a> <a class="dropdown-item "
					href="administrativeDepartment"><spring:message
						code="header.administrative_department" /></a> <a
					class="dropdown-item " href="agricultureDepartment"><spring:message
						code="header.agriculture_department" /></a> <a class="dropdown-item "
					href="animalHusbandryDepartment"><spring:message
						code="header.animal_husbandry_department" /></a> <a
					class="dropdown-item" href="educationDepartment"><spring:message
						code="header.education_department" /></a> <a class="dropdown-item "
					href="ruralWaterSupplyDepartment"><spring:message
						code="header.rural_water_supply_department" /></a> <a
					class="dropdown-item " href="swachhBharatMission"><spring:message
						code="header.swachh_bharat_mission" /></a>

			</div>
			<div class="col-lg-4 col-md-6">
				<h4 class="text-white mb-4">Other link</h4>
				<a class="dropdown-item" href="about"><spring:message
						code="header.parichay" /></a> <a class="dropdown-item "
					href="visionAndMission"><spring:message
						code="header.vision_mission" /></a> <a class="dropdown-item "
					href="objectivesAndFunctions"><spring:message
						code="header.objectives_functions" /></a> <a class="dropdown-item "
					href="administrativeStructure"><spring:message
						code="header.administrative_structure" /></a><a
					class="dropdown-item " href="contact"><spring:message
						code="header.contact" /></a>
			</div>
		</div>
	</div>
</div>
<!-- Footer End -->


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/lib/wow/wow.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/lib/easing/easing.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/lib/counterup/counterup.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/lib/parallax/parallax.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/lib/isotope/isotope.pkgd.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/lib/lightbox/js/lightbox.min.js"></script>

<!-- Template Javascript -->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>