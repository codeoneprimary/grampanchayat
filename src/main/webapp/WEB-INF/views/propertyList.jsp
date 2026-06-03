<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="header.propertyList" /></title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.card-header {
	font-size: 20px;
	font-weight: 600;
}

.table th {
	background: linear-gradient(45deg, #0d6efd, #3c8df5);
	color: white;
	text-align: center;
}

.table td {
	text-align: center;
	vertical-align: middle;
}

.table-hover tbody tr:hover {
	background-color: #f1f7ff;
}

.search-box {
	background: #f8f9fa;
	border-radius: 10px;
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
				<spring:message code="header.propertyList" />
			</div>

			<div class="card-body">

				<c:set var="isAdmin"
					value="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}" />

				<!-- 🔥 Toolbar -->
				<div class="card p-3 shadow-sm mb-3 search-box">

					<div
						class="d-flex flex-wrap justify-content-between align-items-center gap-2">

						<!-- 🔍 Search -->
						<form method="get"
							action="${pageContext.request.contextPath}/propertyList"
							class="d-flex flex-wrap gap-2">

							<spring:message code="propertyType.search_by_name_or_property_no"
								var="searchText" />

							<input type="text" name="keyword" value="${param.keyword}"
								class="form-control" style="min-width: 260px;"
								placeholder="🔍 ${searchText}" required />

							<button type="submit" class="btn btn-success">
								🔎
								<spring:message code="propertyType.search" />
							</button>

							<button type="button" class="btn btn-outline-secondary"
								onclick="window.location.href='${pageContext.request.contextPath}/propertyList'">
								🔄
								<spring:message code="propertyType.reset" />
							</button>

						</form>

						<!-- ⚙ Actions -->
						<c:if
							test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
							<div class="d-flex gap-2">

								<a href="${pageContext.request.contextPath}/addProperty"
									class="btn btn-success shadow-sm"> ➕ <spring:message
										code="propertyType.add_property" />
								</a> <a href="${pageContext.request.contextPath}/uploadProperty"
									class="btn btn-warning shadow-sm text-dark"> ⬆️ <spring:message
										code="propertyType.upload_property" />
								</a> <a href="${pageContext.request.contextPath}/exportProperty"
									class="btn btn-info shadow-sm text-white"> ⬇️ <spring:message
										code="propertyType.export_property" />
								</a>

							</div>
						</c:if>

					</div>
				</div>
				<c:if test="${not empty keyword || sessionScope.userRole eq 'ADMIN'}">
					<!-- 📊 Table -->
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
													href="${pageContext.request.contextPath}/propertyDetails/${p[0]}"
													class="btn btn-sm btn-info text-white"> 👁 <spring:message
														code="propertyType.view" /></a>

												<c:if test="${isAdmin}">
													<a
														href="${pageContext.request.contextPath}/editProperty/${p[0]}"
														class="btn btn-sm btn-warning"> ✏️ <spring:message
															code="propertyType.edit" /></a>

													<a
														href="${pageContext.request.contextPath}/deleteProperty/${p[0]}"
														class="btn btn-sm btn-danger"
														onclick="return confirm('Are you sure to delete?')">
														🗑<spring:message code="propertyType.delete" />
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
				</c:if>
			</div>
		</div>

	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>