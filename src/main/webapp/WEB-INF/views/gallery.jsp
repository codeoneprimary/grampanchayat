<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title><spring:message code="header.home" /></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- Projects Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s"
				style="max-width: 500px;">
				<p class="fs-5 fw-bold text-primary">Our Projects</p>
				<h1 class="display-5 mb-5">Some Of Our Wonderful Projects</h1>
			</div>
	

			<div class="row g-4 portfolio-container">
				<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp"
					data-wow-delay="0.1s">
					<div class="portfolio-inner rounded">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/service-1.jpg"
							alt="">
						<div class="portfolio-text">
							<h4 class="text-white mb-4">Landscaping</h4>
							<div class="d-flex">
								<a class="btn btn-lg-square rounded-circle mx-2"
									href="${pageContext.request.contextPath}/resources/img/service-1.jpg"
									data-lightbox="portfolio"><i class="fa fa-eye"></i></a> <a
									class="btn btn-lg-square rounded-circle mx-2" href=""><i
									class="fa fa-link"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp"
					data-wow-delay="0.3s">
					<div class="portfolio-inner rounded">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/service-2.jpg"
							alt="">
						<div class="portfolio-text">
							<h4 class="text-white mb-4">Pruning plants</h4>
							<div class="d-flex">
								<a class="btn btn-lg-square rounded-circle mx-2"
									href="${pageContext.request.contextPath}/resources/img/service-2.jpg"
									data-lightbox="portfolio"><i class="fa fa-eye"></i></a> <a
									class="btn btn-lg-square rounded-circle mx-2" href=""><i
									class="fa fa-link"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp"
					data-wow-delay="0.5s">
					<div class="portfolio-inner rounded">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/service-3.jpg"
							alt="">
						<div class="portfolio-text">
							<h4 class="text-white mb-4">Irrigation & Drainage</h4>
							<div class="d-flex">
								<a class="btn btn-lg-square rounded-circle mx-2"
									href="${pageContext.request.contextPath}/resources/img/service-3.jpg"
									data-lightbox="portfolio"><i class="fa fa-eye"></i></a> <a
									class="btn btn-lg-square rounded-circle mx-2" href=""><i
									class="fa fa-link"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp"
					data-wow-delay="0.1s">
					<div class="portfolio-inner rounded">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/service-4.jpg"
							alt="">
						<div class="portfolio-text">
							<h4 class="text-white mb-4">Garden Maintenance</h4>
							<div class="d-flex">
								<a class="btn btn-lg-square rounded-circle mx-2"
									href="${pageContext.request.contextPath}/resources/img/service-4.jpg"
									data-lightbox="portfolio"><i class="fa fa-eye"></i></a> <a
									class="btn btn-lg-square rounded-circle mx-2" href=""><i
									class="fa fa-link"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp"
					data-wow-delay="0.3s">
					<div class="portfolio-inner rounded">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/service-5.jpg"
							alt="">
						<div class="portfolio-text">
							<h4 class="text-white mb-4">Green Technology</h4>
							<div class="d-flex">
								<a class="btn btn-lg-square rounded-circle mx-2"
									href="${pageContext.request.contextPath}/resources/img/service-5.jpg"
									data-lightbox="portfolio"><i class="fa fa-eye"></i></a> <a
									class="btn btn-lg-square rounded-circle mx-2" href=""><i
									class="fa fa-link"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp"
					data-wow-delay="0.5s">
					<div class="portfolio-inner rounded">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/img/service-6.jpg"
							alt="">
						<div class="portfolio-text">
							<h4 class="text-white mb-4">Urban Gardening</h4>
							<div class="d-flex">
								<a class="btn btn-lg-square rounded-circle mx-2"
									href="${pageContext.request.contextPath}/resources/img/service-6.jpg"
									data-lightbox="portfolio"><i class="fa fa-eye"></i></a> <a
									class="btn btn-lg-square rounded-circle mx-2" href=""><i
									class="fa fa-link"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Projects End -->


	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>

	<%@ include file="footer.jsp"%>

</body>

</html>