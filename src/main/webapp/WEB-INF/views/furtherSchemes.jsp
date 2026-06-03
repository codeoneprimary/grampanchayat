<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<link rel="icon" type="image/png" sizes="32x32"
      href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
      href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<spring:message code="header.home" var="pageTitle" />

<c:set var="pageDescription"
value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<c:set var="pageKeywords"
value="Deulgaon Gada, Deulgaon Gada Gram Panchayat, Maharashtra village, Gram Panchayat services, property tax Deulgaon Gada, देऊळगाव गाडा, देऊळगाव गाडा ग्रामपंचायत" />

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
						src="${pageContext.request.contextPath}/resources/img/topImages/gramImage1.jpeg"
						alt="Image">
				</div>

				<div class="carousel-item">
					<img
						src="${pageContext.request.contextPath}/resources/img/topImages/gramImage2.jpeg"
						alt="Image">
				</div>

			</div>

			<!-- Controls (optional) -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#header-carousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#header-carousel" data-bs-slide="next">
				<span class="carousel-control-next-icon"></span>
			</button>
		</div>
	</div>
	<!-- Projects Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s"
				style="max-width: 500px;">
				<p class="fs-5 fw-bold text-primary">Our Projects</p>
				<h1 class="display-5 mb-5">Some Of Our Wonderful Projects</h1>
			</div>
			<div class="row wow fadeInUp" data-wow-delay="0.3s">
				<div class="col-12 text-center">
					<ul class="list-inline rounded mb-5" id="portfolio-flters">
						<li class="mx-2 active" data-filter="*">All</li>
						<li class="mx-2" data-filter=".first">Complete Projects</li>
						<li class="mx-2" data-filter=".second">Ongoing Projects</li>
					</ul>
				</div>
			</div>
			<div class="row g-4 portfolio-container">
				<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp"
					data-wow-delay="0.1s">
					<div class="portfolio-inner rounded">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/service-1.jpg"
							alt="">
						<div class="portfolio-text">
							<h4 class="text-white mb-4">Landscaping</h4>
							<div class="d-flex">
								<a class="btn btn-lg-square rounded-circle mx-2"
									href="${pageContext.request.contextPath}/resources/img/service-1.jpg"
									data-lightbox="portfolio"><i class="fa fa-eye"></i></a> <a
									class="btn btn-lg-square rounded-circle mx-2" href=""><i
									class="fa fa-link"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp"
					data-wow-delay="0.3s">
					<div class="portfolio-inner rounded">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/service-2.jpg"
							alt="">
						<div class="portfolio-text">
							<h4 class="text-white mb-4">Pruning plants</h4>
							<div class="d-flex">
								<a class="btn btn-lg-square rounded-circle mx-2"
									href="${pageContext.request.contextPath}/resources/img/service-2.jpg"
									data-lightbox="portfolio"><i class="fa fa-eye"></i></a> <a
									class="btn btn-lg-square rounded-circle mx-2" href=""><i
									class="fa fa-link"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp"
					data-wow-delay="0.5s">
					<div class="portfolio-inner rounded">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/service-3.jpg"
							alt="">
						<div class="portfolio-text">
							<h4 class="text-white mb-4">Irrigation & Drainage</h4>
							<div class="d-flex">
								<a class="btn btn-lg-square rounded-circle mx-2"
									href="${pageContext.request.contextPath}/resources/img/service-3.jpg"
									data-lightbox="portfolio"><i class="fa fa-eye"></i></a> <a
									class="btn btn-lg-square rounded-circle mx-2" href=""><i
									class="fa fa-link"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp"
					data-wow-delay="0.1s">
					<div class="portfolio-inner rounded">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/service-4.jpg"
							alt="">
						<div class="portfolio-text">
							<h4 class="text-white mb-4">Garden Maintenance</h4>
							<div class="d-flex">
								<a class="btn btn-lg-square rounded-circle mx-2"
									href="${pageContext.request.contextPath}/resources/img/service-4.jpg"
									data-lightbox="portfolio"><i class="fa fa-eye"></i></a> <a
									class="btn btn-lg-square rounded-circle mx-2" href=""><i
									class="fa fa-link"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp"
					data-wow-delay="0.3s">
					<div class="portfolio-inner rounded">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/service-5.jpg"
							alt="">
						<div class="portfolio-text">
							<h4 class="text-white mb-4">Green Technology</h4>
							<div class="d-flex">
								<a class="btn btn-lg-square rounded-circle mx-2"
									href="${pageContext.request.contextPath}/resources/img/service-5.jpg"
									data-lightbox="portfolio"><i class="fa fa-eye"></i></a> <a
									class="btn btn-lg-square rounded-circle mx-2" href=""><i
									class="fa fa-link"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp"
					data-wow-delay="0.5s">
					<div class="portfolio-inner rounded">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/service-6.jpg"
							alt="">
						<div class="portfolio-text">
							<h4 class="text-white mb-4">Urban Gardening</h4>
							<div class="d-flex">
								<a class="btn btn-lg-square rounded-circle mx-2"
									href="${pageContext.request.contextPath}/resources/img/service-6.jpg"
									data-lightbox="portfolio"><i class="fa fa-eye"></i></a> <a
									class="btn btn-lg-square rounded-circle mx-2" href=""><i
									class="fa fa-link"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Projects End -->

	<!-- Back to Top -->
	<!-- 
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>
 -->

	<%@ include file="footer.jsp"%>

</body>

</html>