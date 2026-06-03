<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">

<spring:message code="header.gallery" var="pageTitle" />

<c:set var="pageDescription"
value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<c:set var="pageKeywords"
value="Deulgaon Gada, Deulgaon Gada Gram Panchayat, Maharashtra village, Gram Panchayat services, property tax Deulgaon Gada, देऊळगाव गाडा, देऊळगाव गाडा ग्रामपंचायत" />

<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<meta content="width=device-width, initial-scale=1.0" name="viewport">

</head>

<body>

	<%@ include file="header.jsp"%>

	<%
	int currentPage = 1;
	int recordsPerPage = 9;
	int totalImages = 70;

	if (request.getParameter("page") != null) {
		currentPage = Integer.parseInt(request.getParameter("page"));
	}

	int start = (currentPage - 1) * recordsPerPage + 1;
	int end = start + recordsPerPage - 1;

	if (end > totalImages) {
		end = totalImages;
	}
	%>

	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-4">

				<c:forEach var="i" begin="<%=start%>" end="<%=end%>">
					<div class="col-lg-4 col-md-6 portfolio-item wow fadeInUp">

						<a
							href="${pageContext.request.contextPath}/resources/img/gallery/${i}.JPG"
							data-lightbox="portfolio"> <img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/gallery/${i}.JPG"
							alt="Gallery Image ${i}">
						</a>

					</div>
				</c:forEach>

			</div>

			<!-- Pagination -->
			<div class="text-center mt-5">

				<%
				int totalPages = (int) Math.ceil((double) totalImages / recordsPerPage);

				// Previous Button
				if (currentPage > 1) {
				%>
				<a href="?page=<%=currentPage - 1%>" class="btn btn-primary m-1">Previous</a>
				<%
				}

				// Page Numbers
				for (int i = 1; i <= totalPages; i++) {
				%>
				<a href="?page=<%=i%>" class="btn btn-secondary m-1"><%=i%></a>
				<%
				}

				// Next Button
				if (currentPage < totalPages) {
				%>
				<a href="?page=<%=currentPage + 1%>" class="btn btn-primary m-1">Next</a>
				<%
				}
				%>

			</div>

		</div>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>