<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<spring:message code="uploadPdf.downloads" var="pageTitle" />

<c:set var="pageDescription"
	value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<c:set var="pageKeywords"
	value="Deulgaon Gada, Deulgaon Gada Gram Panchayat, Maharashtra village, Gram Panchayat services, property tax Deulgaon Gada, देऊळगाव गाडा, देऊळगाव गाडा ग्रामपंचायत" />

<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
	rel="stylesheet">
<style>
/* SEARCH BOX STYLE */
.search-box {
	border-radius: 20px;
	padding: 8px 15px;
	border: 1px solid #ccc;
	font-size: 14px;
}

.search-box:focus {
	border-color: #2f69b0;
	box-shadow: 0 0 0 0.1rem rgba(47, 105, 176, 0.2);
}

/* MAIN BOX */
.notice-section {
	border: 1px solid #ddd;
	border-radius: 10px;
	overflow: hidden;
	background: #fff;
	margin-top: 10px;
}

/* HEADER */
.notice-header {
	background: #2f69b0;
	color: #fff;
	padding: 10px 15px;
}

/* ICON */
.icon-box {
	background: #ff7a00;
	padding: 6px 8px;
	border-radius: 5px;
	color: #fff;
}

/* VIEW ALL */
.view-all-btn {
	background: #6c757d;
	color: #fff;
	padding: 4px 12px;
	border-radius: 20px;
	font-size: 12px;
	text-decoration: none;
}

/* BODY */
.notice-body {
	padding: 10px;
}

/* ITEM */
.notice-item {
	background: #f2f2f2;
	padding: 12px;
	border-radius: 8px;
	margin-bottom: 10px;
	display: flex;
	align-items: center;
	gap: 10px;
	position: relative;
}

/* NEW BADGE */
.new-badge {
	position: relative;
	width: 40px;
	height: 40px;
	background: #ff6b00;
	color: #fff;
	font-size: 10px;
	font-weight: bold;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	line-height: 1;
	clip-path: polygon(50% 0%, 60% 20%, 80% 10%, 75% 30%, 100% 35%, 80% 50%, 100% 65%,
		75% 70%, 80% 90%, 60% 80%, 50% 100%, 40% 80%, 20% 90%, 25% 70%, 0% 65%
		, 20% 50%, 0% 35%, 25% 30%, 20% 10%, 40% 20%);
	flex-shrink: 0;
}

/* TEXT */
.notice-text {
	flex: 1; /* ⭐ ADD THIS */
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}
/* DOWNLOAD BUTTON */
.download-btn {
	background: #2f69b0;
	color: #fff;
	border-radius: 50%;
	padding: 6px 8px;
}

/* MOBILE FIX */
@media ( max-width : 576px) {
	.notice-text {
		font-size: 13px;
	}
}

.pdf-actions {
	display: flex;
	gap: 6px;
	margin-left: auto; /* ⭐ PUSH TO RIGHT */
}

/* make buttons round and equal */
.pdf-actions .btn {
	width: 32px;
	height: 32px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 0;
}

.notice-item {
	flex-wrap: nowrap;
}
</style>
</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="page-bg"></div>

	<div class="container mt-4">

		<div class="notice-section">
			<input type="text" id="searchInput"
				class="form-control search-box mb-3"
				placeholder="<spring:message code='uploadPdf.search_documents' />..." />
			<!-- HEADER -->
			<div
				class="notice-header d-flex justify-content-between align-items-center">

				<div class="d-flex align-items-center gap-2">
					<div class="icon-box">
						<i class="bi bi-file-earmark-text"></i>
					</div>

					<h5 class="mb-0 fw-bold">
						<spring:message code="uploadPdf.downloads" />
					</h5>
				</div>

			</div>

			<div class="notice-body ">

				<c:forEach var="pdf" items="${pdfList}" varStatus="status">

					<div class="notice-item">

						<div class="icon-box">
							<i class="bi bi-file-earmark-text"></i>
						</div>
						<div class="notice-text">${pdf}</div>
						<div class="pdf-actions">
							<a href="${pageContext.request.contextPath}/viewPdf?name=${pdf}"
								target="_blank" class="btn btn-light btn-sm me-2"> <i
								class="bi bi-eye"></i>
							</a> <a href="${pageContext.request.contextPath}/files/${pdf}"
								class="download-btn"> <i class="bi bi-download"></i>
							</a>
						</div>
					</div>

				</c:forEach>

			</div>
		</div>


	</div>

	<%@ include file="footer.jsp"%>
	<script>
		document.getElementById("searchInput").addEventListener(
				"keyup",
				function() {
					let value = this.value.toLowerCase();
					let items = document.querySelectorAll(".notice-item");

					items.forEach(function(item) {
						let text = item.querySelector(".notice-text").innerText
								.toLowerCase();

						if (text.includes(value)) {
							item.style.display = "flex";
						} else {
							item.style.display = "none";
						}
					});
				});
	</script>
</body>
</html>