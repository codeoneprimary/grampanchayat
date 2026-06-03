<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<spring:message code="header.important_announcement" var="pageTitle" />

<c:set var="pageDescription"
	value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<!-- ✅ Styling -->
<style>
.card {
	border: 1px solid #dcdcdc;
	border-radius: 6px;
}

.card-header {
	background-color: #0d6efd;
	color: white;
	font-weight: 600;
	font-size: 16px;
}

.form-label {
	font-weight: 500;
	margin-bottom: 4px;
}

.form-control {
	border-radius: 4px;
	font-size: 14px;
}

textarea.form-control {
	resize: none;
}

.btn-primary {
	width: 100%;
	font-weight: 500;
}

/* Table Styling */
.custom-table {
	width: 100%;
	border-collapse: collapse;
}

.custom-table th {
	background: #f1f5f9;
	padding: 10px;
	font-weight: 600;
	text-align: left;
}

.custom-table td {
	padding: 10px;
	border-top: 1px solid #ddd;
}

.custom-table tr:hover {
	background-color: #f9f9f9;
}

/* Status badge */
.badge-status {
	padding: 5px 10px;
	border-radius: 4px;
	font-size: 12px;
}

.badge-active {
	background-color: #198754;
	color: white;
}

.badge-inactive {
	background-color: #dc3545;
	color: white;
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

					<!-- 🔹 Header -->
					<div class="card-header">
						<spring:message code="important_announcement.add_news" />
					</div>

					<!-- 🔹 Form -->
					<div class="card-body">
						<form action="saveNews" method="post">
							<div class="row g-3">

								<div class="col-md-3">
									<label class="form-label"> <spring:message
											code="important_announcement.title" />
									</label> <input type="text" name="title" class="form-control" required>
								</div>

								<div class="col-md-4">
									<label class="form-label"> <spring:message
											code="important_announcement.description" />
									</label>
									<textarea name="description" class="form-control" rows="2"
										required></textarea>
								</div>

								<div class="col-md-2">
									<label class="form-label"> <spring:message
											code="important_announcement.publish_from" />
									</label> <input type="date" name="publishFrom" class="form-control"
										required>
								</div>

								<div class="col-md-2">
									<label class="form-label"> <spring:message
											code="important_announcement.publish_to" />
									</label> <input type="date" name="publishTo" class="form-control"
										required>
								</div>

								<div class="col-md-1 d-flex align-items-end">
									<button type="submit" class="btn btn-primary">
										<spring:message code="msg.submit" />
									</button>
								</div>

							</div>
						</form>
					</div>

					<!-- 🔹 Table -->
					<div class="card-body">
						<div id="msgBox" class="mt-3"></div>
						<div class="col-lg-12 col-md-12">
							<div class="table-container">
								<table class="custom-table">
									<caption>
										<spring:message code="header.important_announcement" />
									</caption>

									<thead>
										<tr>
											<th><spring:message code="important_announcement.title" /></th>
											<th><spring:message
													code="important_announcement.description" /></th>
											<th><spring:message
													code="important_announcement.publish_from" /></th>
											<th><spring:message
													code="important_announcement.publish_to" /></th>
											<th><spring:message code="application_list.status" /></th>
											<th>Action</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="dailyNews" items="${dailyNewsList}">
											<tr>

												<td>${dailyNews.title}</td>
												<td>${dailyNews.description}</td>
												<td>${dailyNews.publishFrom}</td>
												<td>${dailyNews.publishTo}</td>

												<td><span
													class="badge-status ${dailyNews.status == 'Active' ? 'badge-active' : 'badge-inactive'}">
														${dailyNews.status} </span></td>
												<td><a href="${pageContext.request.contextPath}/viewNews?id=${dailyNews.id}"
													class="btn btn-sm btn-info text-white"> 👁 View </a>
													<button type="button" class="btn btn-sm btn-success"
														onclick="sendMessage(${dailyNews.id}, this)">📩</button>
													<button type="button" class="btn btn-sm btn-danger"
														onclick="deleteNews(${dailyNews.id}, this)">🗑</button></td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
								<div class="table-container"></div>
							</div>

						</div>

					</div>
				</div>
			</div>

			<%@ include file="footer.jsp"%>
			<script>
function sendMessage(newsId, btn) {

    btn.disabled = true;
    btn.innerText = "Sending...";

    fetch('${pageContext.request.contextPath}/sendMessageToUsers', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'newsId=' + newsId
    })
    .then(response => response.text())
    .then(data => {

        document.getElementById("msgBox").innerHTML =
            '<div class="alert alert-success">✅ Message sent successfully!</div>';

        btn.innerText = "Sent";
    })
    .catch(error => {

        document.getElementById("msgBox").innerHTML =
            '<div class="alert alert-danger">❌ Failed to send message</div>';

        btn.disabled = false;
        btn.innerText = "📩";
    });
}
function deleteNews(id, btn) {

    if (!confirm("Are you sure you want to delete this record?")) {
        return;
    }

    btn.disabled = true;
    btn.innerText = "Deleting...";

    fetch('deleteNews', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'id=' + id
    })
    .then(response => response.text())
    .then(data => {

        // Remove row from table
        let row = btn.closest("tr");
        row.remove();

        document.getElementById("msgBox").innerHTML =
            '<div class="alert alert-success">✅ Record deleted successfully!</div>';

    })
    .catch(error => {

        document.getElementById("msgBox").innerHTML =
            '<div class="alert alert-danger">❌ Failed to delete</div>';

        btn.disabled = false;
        btn.innerText = "🗑";
    });
}
</script>
</body>
</html>