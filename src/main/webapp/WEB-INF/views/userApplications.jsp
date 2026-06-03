<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title><spring:message code="header.application_list" /></title>
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- About Start -->
	<div class="container-xxl py-5">
		<div class="container" style="text-align: justify;">
			<div class="row g-5">

				<div class="col-lg-12 col-md-12">
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
							</tbody>
						</table>
					</div>
				</div>


				<div class="col-lg-12 col-md-12">
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
									<th><spring:message
											code="death.application.cause_of_death" /></th>
									<th><spring:message code="application_list.status" /></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="deathApplication"
									items="${deathApplicationList}" varStatus="status">
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
							</tbody>
						</table>
					</div>
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