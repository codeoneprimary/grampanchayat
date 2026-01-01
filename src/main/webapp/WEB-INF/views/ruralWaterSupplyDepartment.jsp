<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title><spring:message code="header.rural_water_supply_department" /></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- Carousel Start -->
	<div class="container-fluid wow fadeIn" data-wow-delay="0.1s">
		<div id="header-carousel" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="${pageContext.request.contextPath}/resources/img/carousel-1.jpg"
						alt="Image" style="height: 450px; width: 100%;">
				</div>
				<div class="carousel-item">
					<img
						src="${pageContext.request.contextPath}/resources/img/carousel-2.jpg"
						alt="Image" style="height: 450px; width: 100%;">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#header-carousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#header-carousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<!-- Carousel End -->



	<!-- About Start -->
	<div class="container-xxl py-5">
		<div class="container fs-5" style="text-align: justify;">
			<div class="row g-5">

				<div class="col-lg-12 col-md-12">
					<p>
						<b><spring:message code="rural_water_supply_department.title" /></b>
					</p>
					<p>
					<b>	<spring:message code="rural_water_supply_department.para1" /></b>
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para2" />
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para3" />
					</p>
					<p>
						<b><spring:message code="rural_water_supply_department.para4" /></b>
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para5" />
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para6" />
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para7" />
					</p>
					<p>
						<b><spring:message code="rural_water_supply_department.para8" /></b>
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para9" />
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para10" />
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para11" />
					</p>
					<p>
						<b><spring:message code="rural_water_supply_department.para12" /></b>
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para13" />
					</p>
					<p>
						<b><spring:message code="rural_water_supply_department.para14" /></b>
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para15" />
					</p>
					<p>
						<b><spring:message code="rural_water_supply_department.para16" /></b>
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para17" />
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para18" />
					</p>
					<p>
						<b><spring:message code="rural_water_supply_department.para19" /></b>
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para20" />
					</p>
					<p>
						<b><spring:message code="rural_water_supply_department.para21" /></b>
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para22" />
					</p>
					
					<p>
						<b><spring:message code="rural_water_supply_department.para24" /></b>
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para25" />
					</p>
					<p>
						<b><spring:message code="rural_water_supply_department.para26" /></b>
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para27" />
					</p>
					<p>
						<b><spring:message code="rural_water_supply_department.para28" /></b>
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para29" />
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para30" />
					</p>
					<p>
						<spring:message code="rural_water_supply_department.para31" />
					</p>

				</div>
			</div>
		</div>

	</div>
	<!-- About End -->

	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>


	<%@ include file="footer.jsp"%>
</body>

</html>