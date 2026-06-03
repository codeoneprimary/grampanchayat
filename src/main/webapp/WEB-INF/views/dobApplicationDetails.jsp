<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<spring:message code="header.birth_certificate_application"
	var="pageTitle" />

<c:set var="pageDescription"
	value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<c:set var="pageKeywords"
	value="Deulgaon Gada, Deulgaon Gada Gram Panchayat, Maharashtra village, Gram Panchayat services, property tax Deulgaon Gada, देऊळगाव गाडा, देऊळगाव गाडा ग्रामपंचायत" />

<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap (if already included in header.jsp, you can remove this) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.detail-table th {
	width: 30%;
	background-color: #f8f9fa;
}

.table.detail-table th, .table.detail-table td {
	border: none !important;
}

.table.detail-table {
	border: 3px solid #000 !important;
}
</style>
</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="container py-5">

		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">

				<h3 class="mb-4 text-center">
					<spring:message code="header.birth_certificate_application" />
				</h3>

				<!-- DETAILS TABLE -->
				<table class="table table-bordered detail-table">
					<tr>
						<th><spring:message code="application_list.application_id" /></th>
						<td>${application.applicationId}</td>
					</tr>
					<tr>
						<th><spring:message code="dob.application.child_name" /></th>
						<td>${application.childName}</td>
						<th><spring:message code="dob.application.gender" /></th>
						<td>${application.gender}</td>
					</tr>
					<tr>
						<th><spring:message code="dob.application.date_of_birth" /></th>
						<td>${application.dateOfBirth}</td>
						<th><spring:message code="dob.application.place_of_birth" /></th>
						<td>${application.placeOfBirth}</td>
					</tr>

					<tr>
						<th><spring:message code="dob.application.hospital_name" /></th>
						<td>${application.hospitalName}</td>
					</tr>

				</table>

				<table class="table table-bordered detail-table">

					<tr>
						<th><spring:message code="dob.application.father_name" /></th>
						<td>${application.fatherName}</td>
						<th><spring:message code="dob.application.mother_name" /></th>
						<td>${application.motherName}</td>
					</tr>
					<tr>
						<th><spring:message code="dob.application.mobile_no" /></th>
						<td>${application.mobileNo}</td>
						<th><spring:message code="dob.application.email" /></th>
						<td>${application.email}</td>
					</tr>


					<tr>
						<th><spring:message code="dob.application.address_details" /></th>
						<td>${application.address},${application.district}</td>
						<td>${application.state}</td>
						<td>${application.pincode}</td>
					</tr>

					<tr>
						<th><spring:message code="application_list.status" /></th>
						<td><span
							class="badge 
                                ${application.status == 'APPROVED' ? 'bg-success' :
                                  application.status == 'REJECTED' ? 'bg-danger' :
                                  'bg-warning'}">
								${application.status} </span></td>
					</tr>

					<tr>
						<th><spring:message code="application_details.admin_remark" /></th>
						<td>${application.statusRemark}</td>
					</tr>
				</table>

				<!-- STATUS UPDATE FORM (ADMIN) -->

				<c:if
					test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
					<div class="card mt-4">
						<div class="card-body">
							<h5 class="card-title mb-3">
								<spring:message
									code="application_details.update_application_status" />
							</h5>
							<form action="updateDobApplicationStatus" method="post">

								<input type="hidden" name="applicationId"
									value="${application.applicationId}" />

								<div class="mb-3">
									<label class="form-label"><spring:message
											code="application_details.select_status" /></label> <select
										name="status" class="form-select" required>
										<option value="PENDING"
											${application.status == 'PENDING' ? 'selected' : ''}>Pending</option>
										<option value="APPROVED"
											${application.status == 'APPROVED' ? 'selected' : ''}>Approved</option>
										<option value="REJECTED"
											${application.status == 'REJECTED' ? 'selected' : ''}>Rejected</option>
									</select>
								</div>

								<!-- COMMENT -->
								<div class="mb-3">
									<label class="form-label"><spring:message
											code="application_details.admin_remark" /></label>
									<textarea name="adminComment" class="form-control" rows="3"
										placeholder="Enter comment if any...">${application.statusRemark}</textarea>
								</div>

								<button type="submit" class="btn btn-success">
									<spring:message
										code="application_details.update_application_status_button" />
								</button>

							</form>

						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>
