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

<spring:message code="header.education_department" var="pageTitle" />

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
						src="${pageContext.request.contextPath}/resources/img/school/zpprimarySchool.jpeg"
						alt="Image">
				</div>

				<div class="carousel-item">
					<img
						src="${pageContext.request.contextPath}/resources/img/school/sadguruhighSchool.jpeg"
						alt="Image">
				</div>

				<div class="carousel-item">
					<img
						src="${pageContext.request.contextPath}/resources/img/school/aanganwadi.jpeg"
						alt="Image">
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
			<div class="row g-5">

				<div class="col-lg-12 col-md-12">

					<p>
						<spring:message code="aboutus.schools_details" />
					</p>
				</div>

				<div class="col-lg-12 col-md-12">
					<spring:message code="education_department.teacherDetails" />
				</div>

				<div class="col-lg-12 col-md-12">
					<spring:message code="education_department.teacherNames" />
				</div>
			</div>
		</div>

	</div>


	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-4">

				<c:forEach var="i" begin="1" end="21">

					<div class="col-lg-4 col-md-6 portfolio-item wow fadeInUp">

						<a
							href="${pageContext.request.contextPath}/resources/img/school/${i}.jpeg"
							data-lightbox="portfolio"> <img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/school/${i}.jpeg"
							alt="Gallery Image ${i}">
						</a>

					</div>

				</c:forEach>

			</div>
		</div>
	</div>

	<!-- Back to Top -->
	<!-- 
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>
 -->


	<%@ include file="footer.jsp"%>
</body>

</html>