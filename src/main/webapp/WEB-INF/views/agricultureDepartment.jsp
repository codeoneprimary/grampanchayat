<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title><spring:message code="header.agriculture_department" /></title>
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



	<div class="container-xxl py-5">
		<div class="container" style="text-align: justify;">
			<div class="row">

				<div class="col-lg-12">

					<p class="fs-5">
						<b><spring:message code="agriculture_department.title" /></b>
					</p>

					<p>
						<b><spring:message code="agriculture_department.para1" /></b>
					</p>
					<p>
						<spring:message code="agriculture_department.para2" />
					</p>
					<p>
						<b><spring:message code="agriculture_department.para3" /></b>
					</p>
					<p>
						<spring:message code="agriculture_department.para4" />
					</p>
					<p>
						<spring:message code="agriculture_department.para5" />
					</p>
					<p>
						<b><spring:message code="agriculture_department.para6" /></b>
					</p>
					<p>
						<spring:message code="agriculture_department.para7" />
					</p>
					<p>
						<b><spring:message code="agriculture_department.para8" /></b>
					</p>


					<p>
						<spring:message code="agriculture_department.para9" />
					</p>

					<p>
						<b><spring:message code="agriculture_department.para10" /></b>
					</p>
					<p>
						<spring:message code="agriculture_department.para11" />
					</p>
					<p>
						<b><spring:message code="agriculture_department.para12" /></b>
					</p>
					<p>
						<spring:message code="agriculture_department.para13" />
					</p>

					<p>
						<b><spring:message code="agriculture_department.para14" /></b>
					</p>
					<p>
						<spring:message code="agriculture_department.para15" />
					</p>
					<p>
						<b><spring:message code="agriculture_department.para16" /></b>
					</p>
					<p>
						<spring:message code="agriculture_department.para17" />
					</p>

					<p>
						<b><spring:message code="agriculture_department.para18" /></b>
					</p>
					<p>
						<spring:message code="agriculture_department.para19" />
					</p>
					<p>
						<spring:message code="agriculture_department.para20" />
					</p>

				</div>
			</div>
		</div>

	</div>


	<!-- Facts Start -->
	<div class="container-fluid facts my-5 py-5" data-parallax="scroll"
		data-image-src="${pageContext.request.contextPath}/resources/img/carousel-1.jpg">
		<div class="container py-5">
			<div class="row g-5">
				<div class="col-sm-6 col-lg-3 text-center wow fadeIn"
					data-wow-delay="0.1s">
					<h1 class="display-4 text-white" data-toggle="counter-up">1234</h1>
					<span class="fs-5 fw-semi-bold text-light">Happy Clients</span>
				</div>
				<div class="col-sm-6 col-lg-3 text-center wow fadeIn"
					data-wow-delay="0.3s">
					<h1 class="display-4 text-white" data-toggle="counter-up">1234</h1>
					<span class="fs-5 fw-semi-bold text-light">Garden Complated</span>
				</div>
				<div class="col-sm-6 col-lg-3 text-center wow fadeIn"
					data-wow-delay="0.5s">
					<h1 class="display-4 text-white" data-toggle="counter-up">1234</h1>
					<span class="fs-5 fw-semi-bold text-light">Dedicated Staff</span>
				</div>
				<div class="col-sm-6 col-lg-3 text-center wow fadeIn"
					data-wow-delay="0.7s">
					<h1 class="display-4 text-white" data-toggle="counter-up">1234</h1>
					<span class="fs-5 fw-semi-bold text-light">Awards Achieved</span>
				</div>
			</div>
		</div>
	</div>
	<!-- Facts End -->


	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>


	<%@ include file="footer.jsp"%>
</body>

</html>