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

<spring:message code="header.application_list" var="pageTitle" />

<c:set var="pageDescription"
	value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<c:set var="pageKeywords"
	value="Deulgaon Gada, Deulgaon Gada Gram Panchayat, Maharashtra village, Gram Panchayat services, property tax Deulgaon Gada, देऊळगाव गाडा, देऊळगाव गाडा ग्रामपंचायत" />


<style>
/* Tabs */
.status-tabs {
	margin-bottom: 15px;
	text-align: center;
}

.status-tabs a {
	padding: 8px 15px;
	margin: 3px;
	border: 1px solid #ccc;
	text-decoration: none;
	color: #333;
	border-radius: 4px;
}

.status-tabs a.active {
	background-color: #0d6efd;
	color: white;
	font-weight: bold;
}

/* Table */
.custom-table {
	width: 100%;
	border-collapse: collapse;
}

.custom-table th, .custom-table td {
	border: 1px solid #ddd;
	padding: 8px;
}

.custom-table tr:hover {
	background-color: #f5f5f5;
}

/* Pagination */
.pagination-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.page-btn {
	padding: 6px 12px;
	margin: 2px;
	border: 1px solid #ccc;
	text-decoration: none;
	color: #333;
	border-radius: 4px;
}

.page-btn:hover {
	background-color: #eee;
}

.page-btn.active {
	background-color: #0d6efd;
	color: white;
	font-weight: bold;
}

.page-btn.disabled {
	color: #aaa;
	pointer-events: none;
}
</style>

</head>

<body>

	<%@ include file="header.jsp"%>
	<div class="container-xxl py-5">
		<div class="container">

			<!-- 🔷 Status Tabs -->
			<div class="status-tabs">
				<a href="?status=PENDING"
					class="${status eq 'PENDING' ? 'active' : ''}"><spring:message
						code="complaintForm.pending" /></a> <a href="?status=APPROVED"
					class="${status eq 'APPROVED' ? 'active' : ''}"><spring:message
						code="complaintForm.approved" /></a> <a href="?status=REJECTED"
					class="${status eq 'REJECTED' ? 'active' : ''}"><spring:message
						code="complaintForm.rejected" /></a>
			</div>

			<!-- 🔷 Table -->
			<div class="table-container">
				<table class="custom-table">
					<caption>
						<spring:message code="application_list.dob_application" />
					</caption>
					<thead>
						<tr>
							<th><spring:message code="application_list.application_id" /></th>
							<th><spring:message code="dob.application.child_name" /></th>
							<th><spring:message code="dob.application.father_name" /></th>
							<th><spring:message code="dob.application.date_of_birth" /></th>
							<th><spring:message code="application_list.status" /></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dobApplication" items="${dobApplicationList}"
							varStatus="status">
							<tr style="cursor: pointer"
								onclick="window.location.href='dobApplicationDetails?applicationId=${dobApplication.applicationId}'">
								<td>${dobApplication.applicationId}</td>
								<td>${dobApplication.childName}</td>
								<td>${dobApplication.fatherName}</td>
								<td>${dobApplication.dateOfBirth}</td>
								<td>${dobApplication.status}</td>
							</tr>
						</c:forEach>

						<c:if test="${empty dobApplicationList}">
							<tr>
								<td colspan="5" style="text-align: center;">No Data Found</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<!-- 🔷 Pagination -->
			<c:if test="${not empty dobApplicationList}">

				<div class="pagination-container">

					<c:choose>
						<c:when test="${currentPage gt 0}">
							<a class="page-btn"
								href="?status=${status}&page=${currentPage - 1}">Prev</a>
						</c:when>
						<c:otherwise>
							<span class="page-btn disabled">Prev</span>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="0" end="${dobTotalPages - 1}" var="i">
						<c:choose>
							<c:when test="${i eq currentPage}">
								<span class="page-btn active">${i + 1}</span>
							</c:when>
							<c:otherwise>
								<a class="page-btn" href="?status=${status}&page=${i}">${i + 1}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${currentPage lt dobTotalPages - 1}">
							<a class="page-btn"
								href="?status=${status}&page=${currentPage + 1}">Next</a>
						</c:when>
						<c:otherwise>
							<span class="page-btn disabled">Next</span>
						</c:otherwise>
					</c:choose>

				</div>

			</c:if>




			<!-- 🔷 Table -->
			<div class="table-container">
				<table class="custom-table">
					<caption>
						<spring:message code="application_list.death_application" />
					</caption>

					<thead>
						<tr>
							<th><spring:message code="application_list.application_id" /></th>
							<th><spring:message
									code="death.application.name_of_deceased" /></th>
							<th><spring:message code="dob.application.gender" /></th>
							<th><spring:message code="death.application.date_of_death" /></th>
							<th><spring:message code="death.application.cause_of_death" /></th>
							<th><spring:message code="application_list.status" /></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="deathApplication" items="${deathApplicationList}"
							varStatus="status">
							<tr style="cursor: pointer"
								onclick="window.location.href='deathApplicationDetails?applicationId=${deathApplication.applicationId}'">
								<td>${deathApplication.applicationId}</td>
								<td>${deathApplication.deceasedName}</td>
								<td>${deathApplication.gender}</td>
								<td>${deathApplication.dateOfDeath}</td>
								<td>${deathApplication.causeOfDeath}</td>
								<td>${deathApplication.status}</td>
							</tr>
						</c:forEach>
						<c:if test="${empty dobApplicationList}">
							<tr>
								<td colspan="5" style="text-align: center;">No Data Found</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<!-- 🔷 Pagination -->
			<c:if test="${not empty deathApplicationList}">

				<div class="pagination-container">

					<c:choose>
						<c:when test="${currentPage gt 0}">
							<a class="page-btn"
								href="?status=${status}&page=${currentPage - 1}">Prev</a>
						</c:when>
						<c:otherwise>
							<span class="page-btn disabled">Prev</span>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="0" end="${deathTotalPages - 1}" var="i">
						<c:choose>
							<c:when test="${i eq currentPage}">
								<span class="page-btn active">${i + 1}</span>
							</c:when>
							<c:otherwise>
								<a class="page-btn" href="?status=${status}&page=${i}">${i + 1}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${currentPage lt deathTotalPages - 1}">
							<a class="page-btn"
								href="?status=${status}&page=${currentPage + 1}">Next</a>
						</c:when>
						<c:otherwise>
							<span class="page-btn disabled">Next</span>
						</c:otherwise>
					</c:choose>

				</div>

			</c:if>

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