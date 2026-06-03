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
					<i class="fa fa-envelope me-3"></i>deulgaongadagram@gmail.com
				</p>

				<div class="d-flex pt-2">
					<a class="btn btn-square btn-outline-light rounded-circle me-2"
						href="https://x.com/tutordotcom"><i class="fab fa-twitter"></i></a> <a
						class="btn btn-square btn-outline-light rounded-circle me-2"
						href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a> <a
						class="btn btn-square btn-outline-light rounded-circle me-2"
						href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a> 
				</div>

				<div class="d-flex pt-2">
					<div style="text-align: center; margin-top: 10px;">
					<i id="eyeIcon" class="fa fa-eye"></i> <spring:message code="total_visitors" />:<%@ include file="visitorCount.jsp"%>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">

				<h4 class="text-white mb-4">
					<spring:message code="header.department" />
				</h4>

				<a class="dropdown-item" href="${pageContext.request.contextPath}/healthDepartment"><spring:message
						code="header.health_department" /></a> <a class="dropdown-item "
					href="${pageContext.request.contextPath}/administrativeDepartment"><spring:message
						code="header.administrative_department" /></a> <a
					class="dropdown-item " href="${pageContext.request.contextPath}/agricultureDepartment"><spring:message
						code="header.agriculture_department" /></a> <a class="dropdown-item "
					href="${pageContext.request.contextPath}/animalHusbandryDepartment"><spring:message
						code="header.animal_husbandry_department" /></a> <a
					class="dropdown-item" href="${pageContext.request.contextPath}/educationDepartment"><spring:message
						code="header.education_department" /></a> <a class="dropdown-item "
					href="${pageContext.request.contextPath}/ruralWaterSupplyDepartment"><spring:message
						code="header.rural_water_supply_department" /></a> <a
					class="dropdown-item " href="${pageContext.request.contextPath}/swachhBharatMission"><spring:message
						code="header.swachh_bharat_mission" /></a>

			</div>
			<div class="col-lg-4 col-md-6">
				<h4 class="text-white mb-4"><spring:message code="other_link" /></h4>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/about"><spring:message
						code="header.parichay" /></a> <a class="dropdown-item "
					href="${pageContext.request.contextPath}/visionAndMission"><spring:message
						code="header.vision_mission" /></a> <a class="dropdown-item "
					href="${pageContext.request.contextPath}/objectivesAndFunctions"><spring:message
						code="header.objectives_functions" /></a> <a class="dropdown-item "
					href="${pageContext.request.contextPath}/administrativeStructure"><spring:message
						code="header.administrative_structure" /></a><a
					class="dropdown-item " href="${pageContext.request.contextPath}/contact"><spring:message
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