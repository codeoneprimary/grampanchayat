<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="currentPage" value="${pageContext.request.requestURI}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="mr">
<head>
<meta charset="UTF-8">
<spring:message code="header.applicationAcknowledgment" var="pageTitle" />

<c:set var="pageDescription"
	value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f4f6f9;
}

.receipt-card {
	max-width: 850px;
	margin: auto;
	background: #ffffff;
	border: 2px solid #000;
	padding: 25px;
}

.govt-header {
	text-align: center;
	border-bottom: 2px solid #000;
	padding-bottom: 10px;
	margin-bottom: 20px;
}

.govt-header h5 {
	font-weight: bold;
	margin: 0;
}

.receipt-table th {
	width: 35%;
	background-color: #f1f1f1;
}

.govt-header {
	border-bottom: 2px solid #000;
	padding-bottom: 10px;
	margin-bottom: 20px;
}

.header-logo img {
	max-height: 70px;
}

.header-text h5 {
	font-weight: bold;
	margin: 0;
}

.header-text h6 {
	margin: 3px 0;
}

/* PRINT FIX */
@media print {
	.header-logo img {
		max-height: 60px;
	}
}

/* PRINT STYLES */
@media print {
	body {
		background: none;
	}
	.no-print {
		display: none !important;
	}
	.receipt-card {
		border: none;
		padding: 0;
	}
	.header-logo img {
		max-height: 60px;
	}
}

@media ( max-width : 576px) {
	.govt-header {
		flex-direction: column;
		text-align: center;
	}
	.header-logo {
		margin-bottom: 8px;
	}
}
</style>
</head>

<body>

	<div class="container my-4">

		<div class="receipt-card">

			<!-- ================= HEADER WITH LOGOS ================= -->
			<div
				class="govt-header d-flex align-items-center justify-content-between">

				<!-- LEFT LOGO -->
				<div class="header-logo" style="margin-left: 10px;">
					<img
						src="${pageContext.request.contextPath}/resources/img/satyamevJayateSymbol.jpg"
						alt="Government Logo" class="img-fluid">
				</div>

				<!-- CENTER TEXT -->
				<div class="header-text text-center">
					<h5>भारत सरकार / Government of India</h5>
					<h6>मृत्यू नोंदणी विभाग / Death Registration Department</h6>
					<p class="mb-0">
						<spring:message
							code="acknowledgment.death_certificate_application" />
					</p>
				</div>

				<!-- RIGHT LOGO -->
				<div class="header-logo" style="margin-right: 10px;">
					<img
						src="${pageContext.request.contextPath}/resources/img/digitalIndiaLogo.jpg"
						alt="Department Logo" class="img-fluid">
				</div>

			</div>


			<!-- ================= APPLICATION INFO ================= -->
			<table class="table table-bordered receipt-table">
				<tr>
					<th><spring:message code="acknowledgment.application_number" /></th>
					<td><strong>${deathApplication.applicationId}</strong></td>
				</tr>
				<tr>
					<th><spring:message code="acknowledgment.application_date" /></th>
					<td>${applicationDate}</td>
				</tr>
				<tr>
					<th><spring:message code="acknowledgment.status" /></th>
					<td><span class="badge bg-success">${deathApplication.status}</span></td>
				</tr>
			</table>

			<!-- ================= CHILD DETAILS ================= -->
			<h6 class="mt-4">Details</h6>

			<table class="table table-bordered receipt-table">
				<tr>
					<th><spring:message code="death.application.name_of_deceased" /></th>
					<td>${deathApplication.deceasedName}</td>
				</tr>
				<tr>
					<th><spring:message code="death.application.date_of_death" /></th>
					<td>${deathApplication.dateOfDeath}</td>
				</tr>
				<tr>
					<th><spring:message code="death.application.cause_of_death" /></th>
					<td>${deathApplication.causeOfDeath}</td>
				</tr>
				<tr>
					<th><spring:message code="death.application.place_of_death" /></th>
					<td>${deathApplication.placeOfDeath}</td>
				</tr>
			</table>

			<!-- ================= SUCCESS MESSAGE ================= -->
			<div class="alert alert-success mt-3">
				<spring:message code="acknowledgment.success_massage" />
			</div>

			<!-- ================= INSTRUCTIONS ================= -->
			<h6 class="mt-4">
				<spring:message code="acknowledgment.instructions" />
				:
			</h6>
			<ul>
				<spring:message code="acknowledgment.success_massage_instructions" />
			</ul>

			<!-- ================= ACTION BUTTONS ================= -->
			<div class="text-center mt-4 no-print">
				<button type="button" class="btn btn-primary px-4"
					onclick="window.print()">
					<spring:message code="acknowledgment.print" />
				</button>

				<a href="<c:url value='/' />" class="btn btn-secondary px-4 ms-2">
					<spring:message code="header.home" />
				</a>
			</div>

		</div>

	</div>

</body>
</html>
