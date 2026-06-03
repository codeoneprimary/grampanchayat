<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<spring:message code="complaintForm.complaint_list" var="pageTitle" />

<c:set var="pageDescription"
	value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<c:set var="pageKeywords"
	value="Deulgaon Gada, Deulgaon Gada Gram Panchayat, Maharashtra village, Gram Panchayat services, property tax Deulgaon Gada, देऊळगाव गाडा, देऊळगाव गाडा ग्रामपंचायत" />


<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

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
						<spring:message code="complaintForm.header" />
					</caption>

					<thead>
						<tr>
							<th><spring:message code="complaintForm.name" /></th>
							<th><spring:message code="admin_registration.email_id" /></th>
							<th><spring:message code="admin_registration.mobile_no" /></th>
							<th><spring:message code="complaintForm.type" /></th>
							<th><spring:message code="application_list.status" /></th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="complaint" items="${complaintFormList}">
							<tr style="cursor: pointer"
								onclick="window.location.href='complaintFormDetails?applicationId=${complaint.id}'">
								<td>${complaint.fullName}</td>
								<td>${complaint.email}</td>
								<td>${complaint.mobile}</td>
								<td>${complaint.complaintType}</td>
								<td>${complaint.status}</td>
							</tr>
						</c:forEach>

						<c:if test="${empty complaintFormList}">
							<tr>
								<td colspan="5" style="text-align: center;">No Data Found</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<!-- 🔷 Pagination -->
			<c:if test="${not empty complaintFormList}">

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

					<c:forEach begin="0" end="${totalPages - 1}" var="i">
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
						<c:when test="${currentPage lt totalPages - 1}">
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

	<%@ include file="footer.jsp"%>

</body>
</html>
