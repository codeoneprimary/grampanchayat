<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title><spring:message code="uploadPdf.details" /></title>
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

	<div class="container my-4">
		<div class="row justify-content-center">
			<div class="col-lg-12 col-md-11 col-12">

				<div class="card shadow-lg border-0 rounded-3">

					<!-- Header -->
					<div class="card-header bg-primary text-white text-center">
						📋 <spring:message code="uploadPdf.details" /></div>

					<div class="card-body">
						<form id="pdfForm" action="uploadPdf" method="post"
							enctype="multipart/form-data">

							<!-- FILE -->
							<div class="mb-3">
								<label class="form-label"><spring:message code="uploadPdf.select_pdf" /></label> <input type="file"
									id="file" name="file" class="form-control"
									accept="application/pdf"> <small id="fileError"
									class="text-danger"></small>
							</div>

							<!-- TEXT -->
							<div class="mb-3">
								<label class="form-label"><spring:message code="uploadPdf.text_to_add" /></label> <input type="text"
									id="text" name="text" class="form-control"> <small
									id="textError" class="text-danger"></small>
							</div>

							<button type="submit" class="btn btn-primary"><spring:message code="uploadPdf.uploaded_pdfs_button" /></button>

						</form>

						<hr>

						<h5><spring:message code="uploadPdf.uploaded_pdfs" /></h5>

						<table class="table table-bordered">
							<tr>
								<th><spring:message code="uploadPdf.file_name" /></th>
								<th><spring:message code="uploadPdf.actions" /></th>
							</tr>

							<c:forEach var="pdf" items="${pdfList}">
								<tr>
									<td>${pdf}</td>
									<td><a href="${pageContext.request.contextPath}/viewPdf?name=${pdf}"
										class="btn btn-success btn-sm"><spring:message code="uploadPdf.view" /></a> <a
										href="${pageContext.request.contextPath}/deletePdf?name=${pdf}" class="btn btn-danger btn-sm"><spring:message code="uploadPdf.delete" /></a>
									</td>
								</tr>
							</c:forEach>
						</table>

					</div>
				</div>

			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	<script>
		document
				.getElementById("pdfForm")
				.addEventListener(
						"submit",
						function(e) {

							let isValid = true;

							const fileInput = document.getElementById("file");
							const textInput = document.getElementById("text");

							const fileError = document
									.getElementById("fileError");
							const textError = document
									.getElementById("textError");

							fileError.innerText = "";
							textError.innerText = "";

							/* FILE VALIDATION */
							if (fileInput.files.length === 0) {
								fileError.innerText = "Please select a PDF file";
								isValid = false;
							} else {
								const file = fileInput.files[0];

								if (file.type !== "application/pdf") {
									fileError.innerText = "Only PDF files are allowed";
									fileInput.value = "";
									isValid = false;
								}

								// Optional: file size check (5MB)
								if (file.size > 5 * 1024 * 1024) {
									fileError.innerText = "File size must be less than 5MB";
									fileInput.value = "";
									isValid = false;
								}
							}

							/* TEXT VALIDATION */
							if (textInput.value.trim() === "") {
								textError.innerText = "Text is required";
								isValid = false;
							}

							/* STOP FORM */
							if (!isValid) {
								e.preventDefault();
							}

						});
	</script>
</body>
</html>
