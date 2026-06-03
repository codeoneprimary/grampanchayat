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

<spring:message code="header.administrative_structure" var="pageTitle" />

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
			<div class="row">

				<div class="col-lg-12">

					<p class="fs-5">
						<b><spring:message code="header.administrative_structure" /></b>
					</p>

					<p>
						<b><spring:message
								code="administrativeDepartment.introduction" /></b>
					</p>

					<p>
						<spring:message code="administrativeStructure.para1" />
					</p>
					<p>
						<spring:message code="administrativeStructure.para2" />
					</p>
					<p>
						<spring:message code="administrativeStructure.para3" />
					</p>
					<br />

					<%-- 
					<p class="fs-5 text-center">
						<b><spring:message code="administrativeStructure.para4" /></b>
					</p>

 --%>

				</div>

				<c:set var="currentlanguage"
					value="${pageContext.response.locale.language}" />

				<c:choose>
					<c:when test="${currentLang eq 'mr'}">

						<c:forEach var="i" begin="1" end="4">
							<div class="col-lg-6 col-md-6 ">
								<img class="img-fluid"
									src="${pageContext.request.contextPath}/resources/img/adminiStru/${i}.png"
									alt="Gallery Image ${i}">
							</div>
						</c:forEach>
					</c:when>

					<c:otherwise>

						<c:forEach var="i" begin="5" end="8">
							<div class="col-lg-6 col-md-6 ">
								<img class="img-fluid"
									src="${pageContext.request.contextPath}/resources/img/adminiStru/${i}.jpeg"
									alt="Gallery Image ${i}">
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</div>

			<p>
				<b><spring:message code="administrativeStructure.para5" /></b>
			</p>
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