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

<spring:message code="header.agriculture_department" var="pageTitle" />

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
						src="${pageContext.request.contextPath}/resources/img/krushivibhag/kriushivibhag01.jpeg"
						alt="Image">
				</div>

				<div class="carousel-item">
					<img
						src="${pageContext.request.contextPath}/resources/img/krushivibhag/kriushivibhag02.jpeg"
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


	<!-- Back to Top -->
	<!-- 
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>
 -->


	<%@ include file="footer.jsp"%>
</body>

</html>