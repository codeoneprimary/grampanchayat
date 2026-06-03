<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title><spring:message code="propertyType.tax_view" /></title>
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="page-bg"></div>

	<div class="container my-4">
		<div class="row justify-content-center">
			<div class="col-lg-12 col-md-11 col-12">

				<div class="card shadow">
					<div class="card-header">
						<spring:message
							code="<spring:message code="propertyType.tax_view" />" />
					</div>
					<div class="card-body">

						<h2>
							<spring:message code="propertyType.property_tax_details" />
						</h2>

						<spring:message code="propertyType.owner" />
						: ${data.property.ownerName} <br>
						<spring:message code="propertyType.property_no" />
						: ${data.property.propertyNo} <br>
						<spring:message code="propertyType.total" />
						: ${data.totalAmount} <br> Paid: ${data.paidAmount} <br>
						<spring:message code="propertyType.pending" />
						: ${data.pendingTax} <br>
						<spring:message code="propertyType.status" />
						: ${data.status} <br>
					</div>



				</div>

			</div>
		</div>
	</div>


	<%@ include file="footer.jsp"%>

</body>
</html>
