<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title><spring:message code="header.current_Sadasya" /></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- Features Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-5 ">

				<div class="col-lg-2">
				</div>

				<div class="col-lg-8">
					<div class="row g-4 align-items-center">

						<table class="custom-table">
							<spring:message code="current.sadasya_sadasys_name" />

						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Features End -->



	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>

	<%@ include file="footer.jsp"%>

</body>

</html>