<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>View News</title>

<style>
.card {
	border: 1px solid #dcdcdc;
	border-radius: 6px;
}

.card-header {
	background-color: #0d6efd;
	color: white;
	font-weight: 600;
}

.label {
	font-weight: 600;
	color: #333;
}

.value {
	background: #f8f9fa;
	padding: 8px;
	border-radius: 4px;
}

.btn-back {
	margin-top: 15px;
}
</style>

</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="container my-4">

		<div class="card shadow">

			<!-- 🔹 Header -->
			<div class="card-header">📢 <spring:message code="header.important_announcement" /></div>

			<!-- 🔹 Body -->
			<div class="card-body">

				<div class="row mb-3">
					<div class="col-md-3 label"><spring:message code="important_announcement.title" /></div>
					<div class="col-md-9 value">${news.title}</div>
				</div>

				<div class="row mb-3">
					<div class="col-md-3 label"><spring:message code="important_announcement.description" /></div>
					<div class="col-md-9 value">${news.description}</div>
				</div>

				<div class="row mb-3">
					<div class="col-md-3 label"><spring:message code="important_announcement.publish_from" /></div>
					<div class="col-md-9 value">${news.publishFrom}</div>
				</div>

				<div class="row mb-3">
					<div class="col-md-3 label"><spring:message code="important_announcement.publish_to" /></div>
					<div class="col-md-9 value">${news.publishTo}</div>
				</div>

				<div class="row mb-3">
					<div class="col-md-3 label"><spring:message code="application_list.status" /></div>
					<div class="col-md-9 value">
						<span
							style="color: ${news.status == 'Active' ? 'green' : 'red'}; font-weight: 600;">
							${news.status} </span>
					</div>
				</div>

				<div class="mt-3 d-flex gap-2">

					<!-- Back -->
					<a href="${pageContext.request.contextPath}/addsNews" class="btn btn-secondary"> ⬅
						Back </a>

					<!-- Send Message -->
					<button type="button" class="btn btn-success"
						onclick="sendMessage(${news.id})">📩 Send Message</button>

				</div>

				<!-- Success Message -->
				<div id="msgBox" class="mt-3"></div>

			</div>

		</div>

	</div>

	<%@ include file="footer.jsp"%>
	<script>
		function sendMessage(newsId) {
		
		    fetch('sendMessageToUsers', {
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
		    })
		    .catch(error => {
		        document.getElementById("msgBox").innerHTML =
		            '<div class="alert alert-danger">❌ Failed to send message</div>';
		    });
		}
	</script>
</body>
</html>