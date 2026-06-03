<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message
		code="propertyType.upload_property_by_csv" /></title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.card-header {
	font-size: 20px;
	font-weight: 600;
}
</style>
</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="container my-4">

		<div class="card shadow-lg">

			<div class="card-header bg-primary text-white text-center">
				📤
				<spring:message code="propertyType.upload_property_by_csv" />
			</div>

			<div class="card-body">

				<!-- Upload -->
				<form method="post" enctype="multipart/form-data"
					action="${pageContext.request.contextPath}/uploadPropertyCsv">

					<div class="row g-3 align-items-center">

						<div class="col-md-3">
							<a href="${pageContext.request.contextPath}/propertyList"
								class="btn btn-secondary"> ⬅ <spring:message
									code="propertyType.back_to_list" /></a>
						</div>
						<div class="col-md-3">
							<a
								href="${pageContext.request.contextPath}/downloadPropertyTemplate"
								class="btn btn-outline-primary w-100"> ⬇ <spring:message
									code="propertyType.download_template" /></a>
						</div>

						<div class="col-md-3">
							<input type="file" id="file" name="file" class="form-control"
								accept=".csv" required>
						</div>

						<div class="col-md-3">
							<button type="submit" id="uploadBtn"
								class="btn btn-success w-100">
								📂
								<spring:message code="propertyType.upload_csv" />
							</button>
						</div>

					</div>
				</form>
				<div id="resultSection">

					<!-- Summary -->
					<c:if test="${not empty totalCount}">
						<div class="alert alert-info text-center mt-3">
							Total: ${totalCount} |
							<spring:message code="propertyType.csv_success" />
							: ${successCount} |
							<spring:message code="propertyType.csv_failed" />
							: ${failCount}
						</div>
					</c:if>

					<!-- Errors -->
					<c:if test="${not empty errors}">
						<div class="alert alert-danger">
							<ul>
								<c:forEach var="e" items="${errors}">
									<li>${e}</li>
								</c:forEach>
							</ul>
						</div>
					</c:if>

					<!-- Preview -->
					<c:if test="${not empty successList}">
						<div class="card mt-4">
							<div class="card-header bg-success text-white">
								<spring:message code="propertyType.upload_record_preview" />
							</div>

							<div class="table-responsive">
								<table class="table table-bordered text-center">

									<thead>
										<tr>
											<th><spring:message code="propertyType.owner" /></th>
											<th><spring:message code="propertyType.mobile" /></th>
											<th><spring:message code="propertyType.property_no" /></th>
											<th><spring:message code="propertyType.area" /></th>
											<th><spring:message code="propertyType.type" /></th>
											<th>Status</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="p" items="${successList}">
											<tr>
												<td>${p.ownerName}</td>
												<td>${p.mobile}</td>
												<td>${p.propertyNo}</td>
												<td>${p.area}</td>
												<td>${p.propertyType}</td>

												<td
													class="${p.uploadStatus == 'NEW' ? 'text-success' : 'text-warning'}">
													${p.uploadStatus}</td>

											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>
						</div>
					</c:if>

				</div>
			</div>
		</div>

	</div>

	<%@ include file="footer.jsp"%>
	<script>
		document.addEventListener("DOMContentLoaded", function() {

			const fileInput = document.getElementById("file");
			const uploadBtn = document.getElementById("uploadBtn");

			if (fileInput) {
				fileInput.addEventListener("change", clearResults);
			}

			if (uploadBtn) {
				uploadBtn.addEventListener("click", clearResults);
			}

			function clearResults() {
				let section = document.getElementById("resultSection");
				if (section) {
					section.innerHTML = "";
				}
			}

		});
	</script>
</body>
</html>