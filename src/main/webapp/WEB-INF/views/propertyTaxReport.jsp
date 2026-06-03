<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title><spring:message
		code="propertyType.tax_report_Page_header" /></title>
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
.table td, .table th {
	vertical-align: middle;
}
</style>
</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="container mt-4">
		<h4 class="fw-bold text-primary mb-3">
			📊
			<spring:message code="propertyType.tax_report_Page_header" />
		</h4>
		<!-- 🔷 FILTER CARD -->
		<div class="card p-3 mb-3 shadow-sm">

			<form method="get"
				action="${pageContext.request.contextPath}/propertyTaxReport"
				class="row g-2">

				<!-- Year -->
				<div class="col-md-2">
					<select name="year" class="form-select">
						<option value="">📅
							<spring:message code="propertyType.all_years" /></option>
						<c:forEach items="${financialYears}" var="y">
							<option value="${y}" ${y == year ? 'selected' : ''}>
								${y}</option>
						</c:forEach>
					</select>
				</div>

				<!-- Search -->
				<div class="col-md-3">
					<input type="text" name="keyword" value="${keyword}"
						class="form-control"
						placeholder="🔍 <spring:message code='propertyType.search_by_name_or_property_no' />">
				</div>

				<!-- Status -->
				<div class="col-md-2">
					<select name="status" class="form-select">
						<option value=""><spring:message
								code="propertyType.all_status" /></option>
						<option value="PAID" ${status eq 'PAID' ? 'selected' : ''}><spring:message
								code="propertyType.paid" /></option>
						<option value="PARTIAL" ${status eq 'PARTIAL' ? 'selected' : ''}><spring:message
								code="propertyType.partial" /></option>
						<option value="PENDING" ${status eq 'PENDING' ? 'selected' : ''}><spring:message
								code="propertyType.pending" /></option>
					</select>
				</div>

				<!-- Buttons -->
				<div class="col-md-5 d-flex gap-2">

					<button type="submit" id="searchBtn" class="btn btn-primary">
						<span class="btn-text">🔍 <spring:message
								code="propertyType.search" /></span> <span
							class="spinner-border spinner-border-sm d-none"></span>
					</button>

					<button type="button" id="csvBtn" onclick="exportCsv()"
						class="btn btn-success">
						<span class="btn-text">⬇ <spring:message
								code="propertyType.csv" /></span> <span
							class="spinner-border spinner-border-sm d-none"></span>
					</button>

					<button type="button" id="pdfBtn" onclick="exportPdf()"
						class="btn btn-danger">
						<span class="btn-text">📄 <spring:message
								code="propertyType.pdf" /></span> <span
							class="spinner-border spinner-border-sm d-none"></span>
					</button>

					<button type="button" class="btn btn-outline-secondary"
						onclick="window.location.href='${pageContext.request.contextPath}/propertyTaxReport'">
						🔄
						<spring:message code="propertyType.reset" />
					</button>
				</div>

			</form>

		</div>

		<!-- 🔷 TABLE -->
		<div class="card shadow-sm">
			<div class="card-body">

				<div class="table-responsive mt-3">
					<table class="table table-bordered table-hover text-center">

						<thead class="table-dark">
							<tr>
								<th><spring:message code="propertyType.year" /></th>
								<th><spring:message code="propertyType.property_no" /></th>
								<th><spring:message code="propertyType.owner" /></th>
								<th><spring:message code="propertyType.mobile" /></th>
								<th><spring:message code="propertyType.total_payable" /></th>
								<th><spring:message code="propertyType.paid" /></th>
								<th><spring:message code="propertyType.remaining_balance" /></th>
								<th><spring:message code="propertyType.status" /></th>
								<th><spring:message code="propertyType.action" /></th>
							</tr>
						</thead>

						<tbody>

							<c:choose>

								<%-- No Data --%>
								<c:when test="${empty reportPage.content}">
									<tr>
										<td colspan="8" class="text-danger fw-bold"><spring:message
												code="propertyType.no_records_found" /></td>
									</tr>
								</c:when>

								<%-- Data --%>
								<c:otherwise>
									<c:forEach items="${reportPage.content}" var="r">
										<tr>
											<td>${r.financialYear}</td>
											<td>${r.propertyNo}</td>
											<td>${r.ownerName}</td>
											<td>${r.mobile}</td>
											<td>${r.totalTax}</td>
											<td>${r.paidAmount}</td>
											<td>${r.balanceAmount}</td>

											<td><c:choose>
													<c:when test="${r.status == 'PAID'}">
														<span class="badge bg-success"><spring:message
																code="propertyType.paid" /></span>
													</c:when>
													<c:when test="${r.status == 'PENDING'}">
														<span class="badge bg-danger"><spring:message
																code="propertyType.pending" /></span>
													</c:when>
													<c:otherwise>
														<span class="badge bg-warning text-dark"><spring:message
																code="propertyType.partial" /></span>
													</c:otherwise>
												</c:choose></td>
											<td>
												<button class="btn btn-sm btn-info"
													onclick="loadHistory('${r.propertyNo}')">
													📜
													<spring:message code="propertyType.payment_history" />
												</button>
											</td>

										</tr>
									</c:forEach>
								</c:otherwise>

							</c:choose>

						</tbody>

					</table>
				</div>
			</div>
		</div>

		<!-- 🔷 PAGINATION -->
		<nav class="mt-3">
			<c:if test="${reportPage.totalPages > 0}">
				<ul class="pagination justify-content-center">

					<!-- Previous -->
					<li class="page-item ${reportPage.first ? 'disabled' : ''}"><a
						class="page-link"
						href="?page=${reportPage.number-1}&year=${year}&keyword=${keyword}&status=${status}">
							◀ </a></li>

					<!-- Pages -->
					<c:forEach begin="0" end="${reportPage.totalPages - 1}" var="i">
						<li class="page-item ${i==reportPage.number?'active':''}"><a
							class="page-link"
							href="?page=${i}&year=${year}&keyword=${keyword}&status=${status}">
								${i+1} </a></li>
					</c:forEach>

					<!-- Next -->
					<li class="page-item ${reportPage.last ? 'disabled' : ''}"><a
						class="page-link"
						href="?page=${reportPage.number+1}&year=${year}&keyword=${keyword}&status=${status}">
							▶ </a></li>

				</ul>
			</c:if>
		</nav>

	</div>
	<div class="modal fade" id="historyModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-header">
					<h5>
						<spring:message code="propertyType.payment_history" />
					</h5>
					<button class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body" id="historyContent">Loading...</div>

			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	<script>
		function showLoader(btnId) {
		    let btn = document.getElementById(btnId);
		    btn.disabled = true;
		    btn.querySelector(".btn-text").classList.add("d-none");
		    btn.querySelector(".spinner-border").classList.remove("d-none");
		}
	
		function hideLoader(btnId) {
		    let btn = document.getElementById(btnId);
		    btn.disabled = false;
		    btn.querySelector(".btn-text").classList.remove("d-none");
		    btn.querySelector(".spinner-border").classList.add("d-none");
		}
		document.querySelector("form").addEventListener("submit", function () {
		    showLoader("searchBtn");
		});
		function getFilters() {
			return {
				year : document.querySelector("select[name='year']").value,
				keyword : document.querySelector("input[name='keyword']").value,
				status : document.querySelector("select[name='status']").value
			};
		}

		// CSV EXPORT
		function exportCsv() {
		
		    let f = getFilters();
		
		    showLoader("csvBtn");
		
		    let url = "${pageContext.request.contextPath}/exportCsvPropertyTaxReport"
		        + "?year=" + encodeURIComponent(f.year)
		        + "&keyword=" + encodeURIComponent(f.keyword)
		        + "&status=" + encodeURIComponent(f.status);
		
		    window.location.href = url;
		    setTimeout(() => {
		        hideLoader("csvBtn");
		    }, 2000);
		}
		
		function exportPdf() {
		
		    let f = getFilters();
		
		    showLoader("pdfBtn");
		
		    let url = "${pageContext.request.contextPath}/exportPdfPropertyTaxReport"
		        + "?year=" + encodeURIComponent(f.year)
		        + "&keyword=" + encodeURIComponent(f.keyword)
		        + "&status=" + encodeURIComponent(f.status);

		    window.open(url, "_blank");
		    setTimeout(() => {
		        hideLoader("csvBtn");
		    }, 2000);
		}
		function loadHistory(propertyNo, page = 0) {

		    $("#historyModal").modal("show");

		    $("#historyContent").html("Loading...");

		    fetch("${pageContext.request.contextPath}/getPaymentHistory?propertyNo="
		        + encodeURIComponent(propertyNo)
		        + "&page=" + page)

		    .then(res => res.text())
		    .then(html => {
		        $("#historyContent").html(html);
		    });
		}
	</script>

</body>
</html>
