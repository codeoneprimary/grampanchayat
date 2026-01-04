<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title><spring:message code="header.important_announcement" /></title>
</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="page-bg"></div>

	<div class="container my-4">
		<div class="row justify-content-center">
			<div class="col-lg-12 col-md-11 col-12">

				<div class="card shadow">
					<div class="card-header">
						<spring:message code="important_announcement.add_news" />
					</div>
					<div class="card-body">
						<form action="saveNews" method="post">
							<div class="row g-3">
								<div class="col-md-3">
									<label for="childName" class="form-label"><spring:message
											code="important_announcement.title" /> </label> <input type="text"
										id="title" name="title" class="form-control" required>
								</div>
								<div class="col-md-4">
									<label for="childName" class="form-label"><spring:message
											code="important_announcement.description" /> </label>
									<textarea name="description" class="form-control" required></textarea>
								</div>
								<div class="col-md-2">
									<label for="publishFrom" class="form-label"><spring:message
											code="important_announcement.publish_from" /> </label> <input
										type="date" id="publishFrom" name="publishFrom"
										class="form-control" required>
								</div>
								<div class="col-md-2">
									<label for="publishTo" class="form-label"><spring:message
											code="important_announcement.publish_to" /> </label> <input
										type="date" id="publishTo" name="publishTo"
										class="form-control" required>
								</div>
								<div class="col-md-1">
									<div class="text-center mt-4">
										<button type="submit" class="btn btn-primary">
											<spring:message code="msg.submit" />
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>


					<div class="card-body">
						<div class="col-lg-12 col-md-12">
							<table class="custom-table">
								<caption>
									<spring:message code="home.important_announcement" />
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
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dailyNews" items="${dailyNewsList}"
										varStatus="status">
										<tr style="cursor: pointer"
											onclick="window.location.href='dobApplicationDetails?applicationId=${dailyNews.id}'">
											<td>${dailyNews.title}</td>
											<td>${dailyNews.description}</td>
											<td>${dailyNews.publishFrom}</td>
											<td>${dailyNews.publishTo}</td>
											<td>${dailyNews.status}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>

				</div>

			</div>
		</div>
	</div>


	<%@ include file="footer.jsp"%>

</body>
</html>
