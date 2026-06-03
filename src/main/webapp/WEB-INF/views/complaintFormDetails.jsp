<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<spring:message code="complaintForm.header" var="pageTitle" />

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

.video-card {
	position: relative;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.video-thumb {
	width: 100%;
	height: 300px;
	object-fit: cover;
	display: block;
}

/* Overlay */
.video-overlay {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	background: rgba(0, 0, 0, 0.4);
	opacity: 0;
	transition: 0.3s;
}

.video-overlay i {
	font-size: 40px;
	color: white;
	background: #007bff;
	padding: 15px;
	border-radius: 50%;
}

/* Hover Effect */
.video-card:hover .video-overlay {
	opacity: 1;
}

.video-overlay {
	pointer-events: none; /* allow click to pass to video */
}
</style>
</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="container py-5">

		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">

				<h3 class="mb-4 text-center">
					<spring:message code="complaintForm.header" />
				</h3>

				<!-- DETAILS TABLE -->
				<table class="table table-bordered detail-table">
					<tr>
						<th><spring:message code="complaintForm.name" /></th>
						<td>${complaintForm.fullName}</td>
					</tr>
					<tr>
						<th><spring:message code="admin_registration.mobile_no" /></th>
						<td>${complaintForm.mobile}</td>
					</tr>
					<tr>
						<th><spring:message code="admin_registration.email_id" /></th>
						<td>${complaintForm.email}</td>
					</tr>
					<tr>
						<th><spring:message code="complaintForm.type" /></th>
						<td>${complaintForm.complaintType}</td>
					</tr>
					<tr>
						<th><spring:message code="complaintForm.details" /></th>
						<td>${complaintForm.details}</td>
					</tr>
					<tr>
						<th><spring:message code="application_list.status" /></th>
						<td><span
							class="badge 
                                ${complaintForm.status == 'APPROVED' ? 'bg-success' :
                                  complaintForm.status == 'REJECTED' ? 'bg-danger' :
                                  'bg-warning'}">
								${complaintForm.status} </span></td>
					</tr>

				</table>

				<!-- STATUS UPDATE FORM (ADMIN) -->

				<div class="container-xxl py-5">
					<div class="container">
						<div class="row g-4">
							<div class="col-lg-5 col-md-6 portfolio-item wow fadeInUp">

								<a
									href="${pageContext.request.contextPath}/complaintImages/${complaintForm.imagePath}"
									data-lightbox="portfolio"> <img class="img-fluid"
									src="${pageContext.request.contextPath}/complaintImages/${complaintForm.imagePath}"
									alt="Gallery Image ${i}">
								</a>

							</div>

							<div class="col-lg-6 col-md-6">
								<div class="video-card">

									<video class="video-thumb" controls preload="metadata">
										<source
											src="${pageContext.request.contextPath}/complaintImages/${complaintForm.videoPath}"
											type="video/mp4">
									</video>

								</div>
							</div>

						</div>

					</div>
				</div>
				<c:if
					test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
					<div class="card mt-4">
						<div class="card-body">
							<h5 class="card-title mb-3">
								<spring:message
									code="application_details.update_application_status" />
							</h5>
							<form action="updateComplaintFormStatus" method="post">

								<input type="hidden" name="applicationId"
									value="${complaintForm.id}" />

								<div class="mb-3">
									<label class="form-label"><spring:message
											code="application_details.select_status" /></label> <select
										name="status" class="form-select" required>
										<option value="PENDING"
											${complaintForm.status == 'PENDING' ? 'selected' : ''}>Pending</option>
										<option value="APPROVED"
											${complaintForm.status == 'APPROVED' ? 'selected' : ''}>Approved</option>
										<option value="REJECTED"
											${complaintForm.status == 'REJECTED' ? 'selected' : ''}>Rejected</option>
									</select>
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
	<script>
		$('.portfolio-text a').magnificPopup({
			type : 'iframe'
		});
	</script>
</body>
</html>
