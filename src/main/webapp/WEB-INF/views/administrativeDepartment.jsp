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

<spring:message code="header.administrative_department" var="pageTitle" />

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
					<div class="table-container">
						<table class="custom-table">
							<spring:message code="house_rent.details" />
						</table>
					</div>
					<br />
					<p>
						<b><spring:message
								code="administrativeDepartment.introduction" /></b>
					</p>
					<p>
						<b><spring:message code="administrativeDepartment.para1" /></b>
					</p>
					<p>
						<spring:message code="administrativeDepartment.para2" />
					</p>
					<p>
						<spring:message code="administrativeDepartment.para3" />
					</p>
					<p>
						<spring:message code="administrativeDepartment.para4" />
					</p>
					<p>
						<spring:message code="administrativeDepartment.para5" />
					</p>
					<p>
						<b><spring:message code="administrativeDepartment.para6" /></b>
					</p>
					<p>
						<spring:message code="administrativeDepartment.para7" />
					</p>
					<p>
						<spring:message code="administrativeDepartment.para8" />
					</p>
					<p>
						<spring:message code="administrativeDepartment.para9" />
					</p>
					<p>
						<spring:message code="administrativeDepartment.para10" />
					</p>
					<p>
						<spring:message code="administrativeDepartment.para11" />
					</p>
					<p>
						<spring:message code="administrativeDepartment.para12" />
					</p>
					<p>
						<spring:message code="administrativeDepartment.para13" />
					</p>
					<p>
						<spring:message code="administrativeDepartment.para14" />
					</p>
					<p>
						<spring:message code="administrativeDepartment.para15" />
					</p>
					<p>
						<spring:message code="administrativeDepartment.para16" />
					</p>
				</div>
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