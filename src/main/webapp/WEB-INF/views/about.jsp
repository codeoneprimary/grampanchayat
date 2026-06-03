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

<spring:message code="header.about" var="pageTitle" />
<c:set var="pageDescription"
	value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

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
			<button class="carousel-control-prev" type="button"
				data-bs-target="#header-carousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden"><spring:message code="msg.next" /></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#header-carousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden"><spring:message
						code="msg.previous" /></span>
			</button>
		</div>
	</div>
	<!-- Carousel End -->



	<!-- About Start -->
	<div class="container-xxl py-5">
		<div class="container" style="text-align: justify;">
			<div class="row g-5">

				<div class="col-lg-12 col-md-12">

					<p>
						<spring:message code="aboutus.introduction" />
					</p>

					<p>
						<spring:message code="aboutus.para1" />
					</p>

					<p>
						<spring:message code="aboutus.para2" />
					</p>

					<p>
						<spring:message code="aboutus.para3" />
					</p>

					<p>
						<spring:message code="aboutus.para4" />
					</p>

					<p>
						<spring:message code="aboutus.para5" />
					</p>

					<p>
						<spring:message code="aboutus.para6" />
					</p>

					<p>
						<spring:message code="aboutus.para7" />
					</p>

<!-- 
					<p>
						<b><spring:message code="aboutus.political_details" /></b>
					</p>

					<p>
						<spring:message code="aboutus.assembly_Constituency" />
					</p>

					<p>
						<spring:message code="aboutus.parliamentary_constituency" />
					</p>

					<p>
						<spring:message code="aboutus.gram_panchayat_details" />
					</p>

					<h4>
						<spring:message code="aboutus.population_details" />
					</h4>

					<p>
						<spring:message code="aboutus.total_population" />
						<spring:message code="aboutus.male_population" />
						<spring:message code="aboutus.female_population" />
						<spring:message code="aboutus.total_households" />
						<spring:message code="aboutus.literacy_rate" />
						<spring:message code="aboutus.sex_ratio" />
					</p>

					<p>
						<spring:message code="aboutus.distance_information" />
					</p>

					<p>
						<spring:message code="aboutus.schools_details" />
					</p>
 -->

				</div>
			</div>
		</div>

	</div>
	<!-- 
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>
 -->


	<%@ include file="footer.jsp"%>
</body>

</html>