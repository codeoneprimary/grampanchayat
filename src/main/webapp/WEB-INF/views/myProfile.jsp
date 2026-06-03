<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<spring:message code="userRegistration.profile" var="pageTitle" />

<c:set var="pageDescription"
value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<c:set var="pageKeywords"
value="Deulgaon Gada, Deulgaon Gada Gram Panchayat, Maharashtra village, Gram Panchayat services, property tax Deulgaon Gada, देऊळगाव गाडा, देऊळगाव गाडा ग्रामपंचायत" />


<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<style>
.card {
	border-radius: 12px;
}

.card-header {
	font-weight: bold;
	text-align: center;
	font-size: 18px;
}

body {
	font-family: Arial, sans-serif;
	background: #f4f6f9;
}

.profile-card {
	width: 420px;
	margin: 60px auto;
	background: #fff;
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.profile-header {
	text-align: center;
	margin-bottom: 20px;
}

.profile-header h2 {
	margin: 0;
	color: #333;
}

.profile-item {
	margin: 15px 0;
}

.label {
	font-size: 13px;
	color: #777;
}

.value {
	font-size: 16px;
	font-weight: bold;
	color: #222;
	margin-top: 3px;
}

.role-badge {
	display: inline-block;
	padding: 5px 10px;
	border-radius: 20px;
	background: #007bff;
	color: #fff;
	font-size: 12px;
}

.footer {
	text-align: center;
	margin-top: 20px;
}

.footer a {
	text-decoration: none;
	color: #007bff;
}

.page-center {
	min-height: 80vh;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>

</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="page-bg"></div>

	<div class="container page-center">
		<div class="row justify-content-center w-100">
			<div class="col-lg-5 col-md-7 col-11">

				<div class="card shadow">

					<!-- 🔹 Header -->
					<div class="card-header">👤 My Profile</div>

					<!-- 🔹 Form -->
					<div class="card-body">

						<div class="profile-item">
							<div class="label">Full Name</div>
							<div class="value">${user.fullName}</div>
						</div>

						<div class="profile-item">
							<div class="label">Mobile Number</div>
							<div class="value">${user.mobileNo}</div>
						</div>

						<div class="profile-item">
							<div class="label">Email</div>
							<div class="value">${user.email}</div>
						</div>

						<div class="profile-item">
							<div class="label">Role</div>
							<div class="value">
								<span class="role-badge">${user.userRole}</span>
							</div>
						</div>

						<div class="footer">
							<a href="${pageContext.request.contextPath}/home">🏠 Back to
								Home</a>
						</div>

					</div>

				</div>

			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
	<script>
		
	</script>
</body>
</html>