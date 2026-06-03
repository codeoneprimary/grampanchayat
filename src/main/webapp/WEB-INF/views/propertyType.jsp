<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title><spring:message code="header.propertyType" /></title>
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.card-header {
	font-size: 20px;
	font-weight: 600;
}

.table th {
	background-color: #0d6efd;
	color: white;
	text-align: center;
}

.table td {
	vertical-align: middle;
	text-align: center;
}

.search-box {
	background: #f8f9fa;
	padding: 15px;
	border-radius: 10px;
}
</style>

</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="page-bg"></div>

	<div class="container mt-4">

		<div class="card p-3 shadow">
			<h5>
				➕
				<spring:message code="propertyType.add_property_type" />
			</h5>

			<form action="savePropertyType" method="post">

				<!-- hidden id for update -->
				<input type="hidden" name="id" value="${propertyType.id}">

				<div class="row g-3">

					<div class="col-md-5">
						<label><spring:message code="propertyType.property_type" /></label>
						<input type="text" name="propertyType" class="form-control"
							value="${propertyType.propertyType}" required>
					</div>

					<div class="col-md-5">
						<label><spring:message code="propertyType.rate" /></label> <input
							type="text" name="rate"
							class="form-control" value="${propertyType.rate}" required>
					</div>

					<div class="col-md-2 d-flex align-items-end">
						<button type="submit" class="btn btn-primary w-100">
							${propertyType.id == 0 ? 'Save' : 'Update'}</button>
					</div>

				</div>
			</form>
			<br />
			<div id="msgBox">
				<c:if test="${not empty message}">
					<div class="alert alert-success">${message}</div>
				</c:if>
			</div>
		</div>

		<!-- 🔹 List -->
		<div class="card mt-4 p-3 shadow">
			<div class="table-responsive mt-4">
				<div class="card-header bg-primary text-white text-center">
					📋
					<spring:message code="propertyType.property_type_list" />
				</div>
				<table class="table table-bordered table-hover shadow-sm">
					<thead>
						<tr>
							<th><spring:message code="propertyType.property_type" /></th>
							<th><spring:message code="propertyType.rate" /></th>
							<th><spring:message code="propertyType.action" /></th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="p" items="${list}">
							<tr>
								<td>${p.propertyType}</td>
								<td>${p.rate}</td>
								<td>
									<div class="d-flex gap-2">

										<!-- ✏️ Edit -->
										<a href="editPropertyType?id=${p.id}"
											class="btn btn-sm btn-warning"> ✏️ </a>

										<!-- 🗑 Delete -->
										<button class="btn btn-sm btn-danger"
											onclick="deletePropertyType(${p.id}, this)">🗑</button>

									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</div>

	</div>
	<%@ include file="footer.jsp"%>
	<script>
		function deletePropertyType(id, btn) {
		
		    if (!confirm("Are you sure to delete?")) return;
		
		    fetch('deletePropertyType', {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded'
		        },
		        body: 'id=' + id
		    })
		    .then(res => res.text())
		    .then(data => {
		
		        // remove row
		        btn.closest("tr").remove();
		
		        // show success message
		        document.getElementById("msgBox").innerHTML =
		            '<div class="alert alert-success">✅ Deleted successfully</div>';
		
		    })
		    .catch(err => {
		        document.getElementById("msgBox").innerHTML =
		            '<div class="alert alert-danger">❌ Delete failed</div>';
		    });
		}
		
		setTimeout(function() {
		    let msg = document.getElementById("msgBox");
		    if(msg) msg.innerHTML = "";
		}, 3000);
	</script>
</body>
</html>
