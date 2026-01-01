<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title><spring:message code="header.history" /></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- Carousel Start -->
	<div class="container-fluid wow fadeIn" data-wow-delay="0.1s">
		<div id="header-carousel" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="${pageContext.request.contextPath}/resources/img/carousel-1.jpg"
						alt="Image" style="height: 450px; width: 100%;">
				</div>
				<div class="carousel-item">
					<img
						src="${pageContext.request.contextPath}/resources/img/carousel-2.jpg"
						alt="Image" style="height: 450px; width: 100%;">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#header-carousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#header-carousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<!-- Carousel End -->

	<div class="container-xxl py-5">
		<div class="container" style="text-align: justify;">
			<div class="row g-5">
				<div class="col-lg-4 col-md-5 wow fadeInUp">
					<img class="img-fluid rounded" data-wow-delay="0.1s"
						src="${pageContext.request.contextPath}/resources/img/about.jpg">
				</div>
				<div class="col-lg-8 col-md-7 wow fadeInUp">

					<h1 class="display-5 mb-4">
						<spring:message code="history.narayan_bet_datta_temple_name" />
					</h1>
					<p>
						<spring:message code="history.narayan_bet_datta_temple_address" />
					</p>

					<p>
						<spring:message code="history.narayan_bet_datta_temple_para1" />
					</p>
					<p>
						<spring:message code="history.narayan_bet_datta_temple_para2" />
					</p>
					<p>
						<spring:message code="history.narayan_bet_datta_temple_para3" />
					</p>
					<p>
						<spring:message code="history.narayan_bet_datta_temple_para4" />
					</p>
					<p>
						<spring:message code="history.narayan_bet_datta_temple_para5" />
					</p>
				</div>

			</div>

			<p>
				<spring:message code="history.narayan_bet_datta_temple_para6" />
			</p>
			<p>
				<spring:message code="history.narayan_bet_datta_temple_para7" />
			</p>
			<p>
				<spring:message code="history.narayan_bet_datta_temple_para8" />
			</p>
		</div>

	</div>

	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>

	<%@ include file="footer.jsp"%>
</body>

</html>