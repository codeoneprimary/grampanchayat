<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title><spring:message code="propertyType.tax_details" /></title>
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<style>
.action-btn {
	max-width: 260px; /* control button width */
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.custom-btn {
	height: 36px;
	display: flex;
	align-items: center;
	gap: 5px;
}
</style>
</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="container my-4">

		<div class="card shadow-lg border-0 rounded-3">

			<!-- Header -->
			<div class="card-header bg-primary text-white text-center">
				📋
				<spring:message code="propertyType.tax_details" />
			</div>

			<div class="card-body">

				<c:set var="isAdmin"
					value="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}" />

				<!-- 🔥 Toolbar -->
				<div class="card p-3 shadow-sm mb-3 search-box">

					<div
						class="d-flex flex-column flex-md-row gap-2 align-items-md-center">

						<!-- 🔍 Search -->
						<form method="get"
							action="${pageContext.request.contextPath}/taxHome"
							class="d-flex flex-column flex-md-row gap-2 w-100">

							<spring:message code="propertyType.search_by_name_or_property_no"
								var="searchText" />

							<input type="text" name="keyword" value="${param.keyword}"
								class="form-control" style="min-width: 260px;"
								placeholder="🔍 ${searchText}" required />

							<button type="submit" class="btn btn-success" style="min-width: 20%;">
								🔎
								<spring:message code="propertyType.search" />
							</button>

							<button type="button" class="btn btn-outline-secondary" style="min-width: 20%;"
								onclick="window.location.href='${pageContext.request.contextPath}/taxHome'">
								🔄
								<spring:message code="propertyType.reset" />
							</button>

						</form>

						<!-- ⚙ Actions -->

						<div class="d-flex flex-column flex-md-row gap-2 w-100 w-md-auto">

							<a href="${pageContext.request.contextPath}/uploadPropertyTax"
								class="btn btn-warning btn-sm custom-btn text-dark text-truncate">
								⬆️ <spring:message code="propertyType.upload_property_tax" />
							</a>
							<form method="get"
								action="${pageContext.request.contextPath}/exportPropertyTax"
								class="d-flex gap-2 align-items-center">
								<!-- Year Dropdown -->
								<select name="year" id="year" class="form-select"
									style="max-width: 200px;">
									<option value="">📅
										<spring:message code="propertyType.all_years" /></option>
									<c:forEach items="${financialYears}" var="y">
										<option value="${y}">${y}</option>
									</c:forEach>
								</select>
								<button type="submit"
									class="btn btn-info btn-sm custom-btn text-white text-truncate"
									style="width: 250px;">
									⬇
									<spring:message code="propertyType.export_property_tax" />
								</button>

							</form>
						</div>

					</div>
				</div>

				<div id="msgBox" class="mt-3"></div>
				<div class="table-responsive mt-3">
					<table class="table table-hover table-bordered align-middle">

						<thead>
							<tr>
								<th><spring:message code="propertyType.owner" /></th>
								<th><spring:message code="propertyType.mobile" /></th>
								<th><spring:message code="propertyType.property_no" /></th>
								<th><spring:message code="propertyType.ward_no" /></th>
								<th><spring:message code="propertyType.area" /></th>
								<th><spring:message code="propertyType.type" /></th>
								<th><spring:message code="propertyType.remaining_balance" /></th>
								<th><spring:message code="propertyType.action" /></th>
							</tr>
						</thead>

						<tbody>

							<c:forEach var="p" items="${properties}">
								<tr>

									<td>${p[1]}</td>
									<td>${p[2]}</td>
									<td>${p[3]}</td>
									<td>${p[4]}</td>
									<td>${p[5]}</td>
									<td>${p[6]}</td>

									<!-- Amount -->
									<td><span
										class="badge ${p[7] > 0 ? 'bg-danger' : 'bg-success'}">
											₹ ${p[7]} </span></td>

									<!-- Actions -->
									<td>
										<div class="d-flex justify-content-center gap-1 flex-wrap">

											<a
												href="${pageContext.request.contextPath}/propertyTaxDetails/${p[0]}"
												class="btn btn-sm btn-info text-white"> 👁 <spring:message
													code="propertyType.view" /></a>

											<c:if test="${isAdmin}">
												<a
													href="${pageContext.request.contextPath}/editProperty/${p[0]}"
													class="btn btn-sm btn-warning"> ✏️ <spring:message
														code="propertyType.edit" /></a>
												<a href="javascript:void(0);"
													onclick="sendMessage('${p[0]}', '${p[7]}',this)"
													class="btn btn-sm btn-success"> 📩 </a>
												<a
													href="${pageContext.request.contextPath}/deleteProperty/${p[0]}"
													class="btn btn-sm btn-danger"
													onclick="return confirm('Are you sure to delete?')"> 🗑<spring:message
														code="propertyType.delete" />
												</a>
											</c:if>

										</div>
									</td>

								</tr>
							</c:forEach>

							<c:if test="${empty properties}">
								<tr>
									<td colspan="7" class="text-center text-danger">❌ <spring:message
											code="propertyType.no_records_found" />
									</td>
								</tr>
							</c:if>

						</tbody>
					</table>
				</div>

				<!-- 📄 Pagination -->
				<c:if test="${totalPages > 1}">
					<nav class="mt-4">
						<ul class="pagination justify-content-center shadow-sm">

							<c:if test="${currentPage > 0}">
								<li class="page-item"><a class="page-link"
									href="?page=${currentPage - 1}&keyword=${keyword}">⬅ Prev</a></li>
							</c:if>

							<c:forEach begin="0" end="${totalPages - 1}" var="i">
								<li class="page-item ${i == currentPage ? 'active' : ''}">
									<a class="page-link" href="?page=${i}&keyword=${keyword}">
										${i + 1} </a>
								</li>
							</c:forEach>

							<c:if test="${currentPage < totalPages - 1}">
								<li class="page-item"><a class="page-link"
									href="?page=${currentPage + 1}&keyword=${keyword}">Next ➡</a></li>
							</c:if>

						</ul>
					</nav>
				</c:if>

			</div>
		</div>

	</div>

	<%@ include file="footer.jsp"%>
	<script>
	

	function sendMessage(id, amount, btn) {
console.log("amount ="+amount);
	    btn.disabled = true;
	    btn.innerText = "Sending...";

	    fetch('${pageContext.request.contextPath}/sendMessageToPropertyOwner', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/x-www-form-urlencoded'
	        },
	        body: 'id=' + encodeURIComponent(id) + '&amount=' + encodeURIComponent(amount)
	    })
	    .then(response => response.text())
	    .then(data => {

	        document.getElementById("msgBox").innerHTML =
	            '<div class="alert alert-success">✅ Message sent successfully!</div>';

	        btn.innerText = "Sent";

			setTimeout(() => {
			    msgBox.innerHTML = "";
			}, 3000);
	    })
	    .catch(error => {

	        document.getElementById("msgBox").innerHTML =
	            '<div class="alert alert-danger">❌ Failed to send message</div>';

	        btn.disabled = false;
	        btn.innerText = "📩";
	    });
	}
	
		$(document).ready(function() {
			$('#propertyNo').select2({
				placeholder : "Search Property No",
				width : '100%'
			});
		});
	</script>
</body>
</html>
