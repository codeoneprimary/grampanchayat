<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title><spring:message code="propertyType.property_details" /></title>
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="page-bg"></div>


	<div class="container my-5">

		<!-- 🏠 Property Info -->
		<div class="card shadow mb-4">
			<div
				class="card-header bg-primary text-white d-flex justify-content-between align-items-center">

				<span> 🏠 <spring:message
						code="propertyType.property_details" />
				</span>

				<c:if
					test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
					<a
						href="${pageContext.request.contextPath}/editProperty/${property.id}"
						class="btn btn-sm btn-warning"> ✏️ <spring:message
							code="propertyType.edit" />
					</a>
				</c:if>
			</div>

			<div class="card-body">

				<div class="row">
					<div class="col-md-4">
						<b><spring:message code="propertyType.owner" /> : </b>
						${property.ownerName}
					</div>
					<div class="col-md-4">
						<b><spring:message code="propertyType.mobile" /> : </b>
						${property.mobile}
					</div>
					<div class="col-md-4">
						<b><spring:message code="propertyType.property_no" /> : </b>
						${property.propertyNo}
					</div>

					<div class="col-md-4">
						<b><spring:message code="propertyType.area" /> : </b>
						${property.area}
					</div>
					<div class="col-md-4">
						<b><spring:message code="propertyType.type" /> : </b>
						${property.propertyType}
					</div>
					<div class="col-md-4">
						<b><spring:message code="propertyType.ward_no" /> : </b>
						${property.wardNo}
					</div>

					<div class="col-md-12 mt-2">
						<b><spring:message code="propertyType.address" /> : </b>
						${property.address}
					</div>
				</div>

			</div>
		</div>

		<!-- 📊 Tax Table -->
		<div class="card shadow">
			<div class="card-header bg-success text-white">
				📊
				<spring:message code="propertyType.tax_history" />
			</div>

			<div class="card-body">

				<div class="table-responsive">
					<table class="table table-bordered text-center">

						<thead>
							<tr>
								<th><spring:message code="propertyType.year" /></th>
								<th><spring:message code="propertyType.previous_dues" /></th>
								<th><spring:message code="propertyType.penalty" /></th>
								<th><spring:message code="propertyType.current_year_tax" /></th>
								<th><spring:message code="propertyType.total_payable" /></th>
								<th><spring:message code="propertyType.paid" /></th>
								<th><spring:message code="propertyType.remaining_balance" /></th>
								<th><spring:message code="propertyType.status" /></th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="t" items="${taxList}">
								<tr id="row-${t.id}">

									<td>${t.financialYear}</td>

									<td><span id="pendingText-${t.id}" class="text-danger">
											₹ ${t.pendingTax} </span> <input type="text"
										id="pendingInput-${t.id}" value="${t.pendingTax}"
										class="form-control d-none" /></td>

									<td><span id="penaltyText-${t.id}" class="text-danger">
											₹ ${t.penalty} </span> <input type="text" id="penaltyInput-${t.id}"
										value="${t.penalty}" class="form-control d-none" /></td>

									<td><span id="currentTaxText-${t.id}" class="text-danger">
											₹ ${t.currentTax} </span> <input type="text"
										id="currentTaxInput-${t.id}" value="${t.currentTax}"
										class="form-control d-none" /></td>

									<td id="totalText-${t.id}">₹ ${t.totalTax}</td>

									<!-- PAID -->
									<td class="text-success">₹ ${t.paidAmount}</td>

									<td id="balanceText-${t.id}">₹ ${t.balanceAmount}</td>

									<!-- STATUS -->
									<td><span
										class="badge 
								            ${t.status == 'PAID' ? 'bg-success' : 
								              t.status == 'PARTIAL' ? 'bg-warning' : 'bg-danger'}">
											${t.status} </span></td>

								</tr>
							</c:forEach>

							<c:if test="${empty taxList}">
								<tr>
									<td colspan="5" class="text-danger">❌ <spring:message
											code="propertyType.no_records_found" />
									</td>
								</tr>
							</c:if>

						</tbody>

					</table>
				</div>
				<div class="d-flex justify-content-between mb-3">

					<!-- ⬅ Back Button -->
					<a href="${pageContext.request.contextPath}/propertyList"
						class="btn btn-secondary"> ⬅ <spring:message
							code="propertyType.back_to_list" /></a>
					<c:if
						test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
						<!-- 💰 Pay Tax Button -->
						<a
							href="${pageContext.request.contextPath}/payPropertyTax/${property.id}"
							class="btn btn-success"> 💰 <spring:message
								code="propertyType.pay_tax" /></a>
					</c:if>

				</div>
			</div>
		</div>

	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
