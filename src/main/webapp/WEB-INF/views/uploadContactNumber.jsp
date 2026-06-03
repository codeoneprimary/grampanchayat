<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title><spring:message code="header.uploadContactNumber" /></title>
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<style>
.pagination-container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	gap: 5px;
	margin-top: 20px;
}

.page-btn {
	padding: 6px 12px;
	border: 1px solid #ccc;
	text-decoration: none;
	color: #333;
	background-color: #fff;
	border-radius: 4px;
	font-size: 14px;
	transition: 0.3s;
}

.page-btn:hover {
	background-color: #f1f1f1;
}

.page-btn.active {
	background-color: #0d6efd;
	color: #fff;
	font-weight: bold;
	border-color: #0d6efd;
}

.page-btn.disabled {
	color: #aaa;
	pointer-events: none;
	background-color: #f9f9f9;
}
</style>
</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="page-bg"></div>

	<div class="container my-4">
		<div class="row justify-content-center">
			<div class="col-lg-12 col-md-11 col-12">

				<div class="card shadow">
					<div class="card-header">
						<spring:message code="header.uploadContactNumber" />
					</div>
					<div class="card-body">
						<div class="row g-3">
							<div class="col-md-3">

								<a href="download-template" class="btn btn-success"> <spring:message
										code="uploadContactNumber.template" />
								</a>
							</div>
							<div class="col-md-3">
								<input type="file" id="excelFile" accept=".xls,.xlsx"
									class="form-control" />

							</div>
							<div class="col-md-3">
								<button type="button" onclick="uploadExcel()"
									class="btn btn-primary">
									<spring:message code="uploadContactNumber.upload" />
								</button>
							</div>

						</div>
						<div id="result"></div>
					</div>

					<div class="card-body">
						<div class="col-lg-12 col-md-12">

							<div class="table-container">
								<table class="custom-table">
									<caption>
										<spring:message code="uploadContactNumber.list" />
									</caption>
									<thead>
										<tr>
											<th><spring:message code="uploadContactNumber.name" /></th>
											<th><spring:message code="uploadContactNumber.mobile" /></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="contactNumber" items="${contactNumberList}">
											<tr>
												<td>${contactNumber.name}</td>
												<td>${contactNumber.contact}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- Pagination -->
							<div class="pagination-container">

								<!-- Previous -->
								<c:choose>
									<c:when test="${currentPage gt 0}">
										<a class="page-btn" href="?page=${currentPage - 1}">&laquo;
											Prev</a>
									</c:when>
									<c:otherwise>
										<span class="page-btn disabled">&laquo; Prev</span>
									</c:otherwise>
								</c:choose>

								<!-- Page Numbers -->
								<c:forEach begin="0" end="${totalPages - 1}" var="i">
									<c:choose>
										<c:when test="${i eq currentPage}">
											<span class="page-btn active">${i + 1}</span>
										</c:when>
										<c:otherwise>
											<a class="page-btn" href="?page=${i}">${i + 1}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<!-- Next -->
								<c:choose>
									<c:when test="${currentPage lt totalPages - 1}">
										<a class="page-btn" href="?page=${currentPage + 1}">Next
											&raquo;</a>
									</c:when>
									<c:otherwise>
										<span class="page-btn disabled">Next &raquo;</span>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>


	<%@ include file="footer.jsp"%>
	<script>
function uploadExcel() {
	debugger;
    const fileInput = document.getElementById("excelFile");
    if (!fileInput) {
        alert("File input not found!");
        return;
    }

    const file = fileInput.files[0];
    if (!file) {
        alert("Please select an Excel file");
        return;
    }

    const formData = new FormData();
    formData.append("file", file);

    fetch('<%=request.getContextPath()%>/uploadContactNumber', {
        method: "POST",
        body: formData
    })
    .then(response => response.json())
    .then(data => {
    	location.reload();
    })
    .catch(error => {
        console.error("Upload failed:", error);
        alert("Upload failed");
    });
}
</script>


</body>
</html>
