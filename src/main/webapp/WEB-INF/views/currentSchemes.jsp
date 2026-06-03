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

<spring:message code="header.schemes" var="pageTitle" />

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
						src="${pageContext.request.contextPath}/resources/img/arogyavibhag/arogyavibhag3.jpeg"
						alt="Image">
				</div>

				<div class="carousel-item">
					<img
						src="${pageContext.request.contextPath}/resources/img/arogyavibhag/arogyavibhag1.jpeg"
						alt="Image">
				</div>

				<div class="carousel-item">
					<img
						src="${pageContext.request.contextPath}/resources/img/arogyavibhag/arogyavibhag2.jpeg"
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



	<div class="container-xxl py-5">
		<div class="container" style="text-align: justify;">
			<div class="row g-5">

				<div class="col-lg-12 col-md-12">

					<h3>
						<spring:message code="current_schemes_name_card1" />
					</h3>
					<p>
						<spring:message code="current_schemes_link_card1" />
					</p>
					<p>
						<spring:message code="current_schemes_text_card1" />
					</p>

					<h3>
						<spring:message code="current_schemes_name_card2" />
					</h3>
					<p>
						<spring:message code="current_schemes_link_card2" />
					</p>
					<p>
						<spring:message code="current_schemes_text_card2" />
					</p>

					<h3>
						<spring:message code="current_schemes_name_card3" />
					</h3>
					<p>
						<spring:message code="current_schemes_link_card3" />
					</p>
					<p>
						<spring:message code="current_schemes_text_card3" />
					</p>

					<h3>
						<spring:message code="current_schemes_name_card4" />
					</h3>
					<p>
						<spring:message code="current_schemes_link_card4" />
					</p>
					<p>
						<spring:message code="current_schemes_text_card4" />
					</p>

					<h3>
						<spring:message code="current_schemes_name_card5" />
					</h3>
					<p>
						<spring:message code="current_schemes_link_card5" />
					</p>
					<p>
						<spring:message code="current_schemes_text_card5" />
					</p>

					<h3>
						<spring:message code="current_schemes_name_card6" />
					</h3>
					<p>
						<spring:message code="current_schemes_link_card6" />
					</p>
					<p>
						<spring:message code="current_schemes_text_card6" />
					</p>

					<h3>
						<spring:message code="current_schemes_name_card7" />
					</h3>
					<p>
						<spring:message code="current_schemes_link_card7" />
					</p>
					<p>
						<spring:message code="current_schemes_text_card7" />
					</p>

					<h3>
						<spring:message code="current_schemes_name_card8" />
					</h3>
					<p>
						<spring:message code="current_schemes_link_card8" />
					</p>
					<p>
						<spring:message code="current_schemes_text_card8" />
					</p>

					<h3>
						<spring:message code="current_schemes_name_card9" />
					</h3>
					<p>
						<spring:message code="current_schemes_link_card9" />
					</p>
					<p>
						<spring:message code="current_schemes_text_card9" />
					</p>

					<h3>
						<spring:message code="current_schemes_name_card10" />
					</h3>
					<p>
						<spring:message code="current_schemes_link_card10" />
					</p>
					<p>
						<spring:message code="current_schemes_text_card10" />
					</p>
				</div>
			</div>
		</div>

	</div>


	<div class="container-xxl py-5">
		<div class="container">

			<div class="row g-5 align-items-center">
				<div class="col-lg-6 wow fadeInUp"></div>
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
<style>
</style>
</html>