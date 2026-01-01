<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title><spring:message code="header.health_department" /></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="container-fluid wow fadeIn" data-wow-delay="0.1s">
		<div id="header-carousel" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="${pageContext.request.contextPath}/resources/img/arogyavibhag/arogyavibhag1.jpg"
						alt="Image" style="height: 450px; width: 100%;">
				</div>

				<div class="carousel-item ">
					<img
						src="${pageContext.request.contextPath}/resources/img/arogyavibhag/arogyavibhag2.jpg"
						alt="Image" style="height: 450px; width: 100%;">
				</div>

				<div class="carousel-item ">
					<img
						src="${pageContext.request.contextPath}/resources/img/arogyavibhag/arogyavibhag3.jpg"
						alt="Image" style="height: 450px; width: 100%;">
				</div>

				<div class="carousel-item">
					<img
						src="${pageContext.request.contextPath}/resources/img/arogyavibhag/arogyavibhag4.jpg"
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



	<div class="container-xxl py-5">
		<div class="container" style="text-align: justify;">
			<div class="row g-5">

				<div class="col-lg-12 col-md-12">

					<p>
						<b><spring:message code="health_department.introduction" /></b>
					</p>
					<p>
						<spring:message code="health_department.para1" />
					</p>
					<p>
						<spring:message code="health_department.para2" />
					</p>
					<p>
						<spring:message code="health_department.para3" />
					</p>
					<p>
						<b><spring:message code="health_department.para4" /></b>
					</p>
					<p>
						<spring:message code="health_department.para5" />
					</p>
					<p>
						<spring:message code="health_department.para6" />
					</p>
					<p>
						<b><spring:message code="health_department.para7" /></b>
					</p>
					<p>
						<spring:message code="health_department.para8" />
					</p>
					<p>
						<b><spring:message code="health_department.para9" /></b>
					</p>
					<p>
						<spring:message code="health_department.para10" />
					</p>
					<p>
						<b><spring:message code="health_department.para11" /></b>
					</p>
					<p>
						<spring:message code="health_department.para12" />
					</p>
					<p>
						<b><spring:message code="health_department.para13" /></b>
					</p>
					<p>
						<spring:message code="health_department.para14" />
					</p>
					<p>
						<spring:message code="health_department.para15" />
					</p>
					<p>
						<b> <spring:message code="health_department.para16" /></b>
					</p>

					<p>
						<spring:message code="health_department.para17" />
					</p>
					<p>
						<spring:message code="health_department.para18" />
					</p>
					<p>
						<spring:message code="health_department.para19" />
					</p>
				</div>
			</div>
		</div>

	</div>



























	<div class="container-fluid py-5">
		<div class="container">
			<div class="row gx-0">

				<div class="col-lg-4 wow fadeIn" data-wow-delay="0.5s">
					<div class="bg-white shadow d-flex align-items-center h-100 px-5"
						style="min-height: 160px;">
						<div class="d-flex">
							<div class="flex-shrink-0 btn-lg-square rounded-circle bg-light">
								<i class="fa fa-user-md text-primary"></i>
							</div>
							<div class="ps-3">
								<h4>दैनंदिन ओपीडी</h4>
								<span> सकाळी 10 ते दुपारी 1</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 wow fadeIn" data-wow-delay="0.1s">
					<div class="bg-white shadow d-flex align-items-center h-100 px-5"
						style="min-height: 160px;">
						<div class="d-flex">
							<div class="flex-shrink-0 btn-lg-square rounded-circle bg-light">
								<i class="fa fa-syringe text-primary"></i>
							</div>
							<div class="ps-3">
								<h4>नियमित लसीकरण</h4>
								<span>दर महिन्याच्या पहिल्या सोमवार</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 wow fadeIn" data-wow-delay="0.3s">
					<div class="bg-white shadow d-flex align-items-center h-100 px-5"
						style="min-height: 160px;">
						<div class="d-flex">
							<div class="flex-shrink-0 btn-lg-square rounded-circle bg-light">
								<i class="fa fa-notes-medical text-primary"></i>
							</div>
							<div class="ps-3">
								<h4>एनसीडी शिबिर</h4>
								<span>आठवड्यातून एकदा</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 wow fadeIn" data-wow-delay="0.5s">
					<div class="bg-white shadow d-flex align-items-center h-100 px-5"
						style="min-height: 160px;">
						<div class="d-flex">
							<div class="flex-shrink-0 btn-lg-square rounded-circle bg-light">
								<i class="fas fa-eye text-primary"></i>
							</div>
							<div class="ps-3">
								<h4>नेत्र तपासणी शिबिर</h4>
								<span>महिन्यातून एकदा</span>
							</div>
						</div>
					</div>
				</div>


				<div class="col-lg-4 wow fadeIn" data-wow-delay="0.5s">
					<div class="bg-white shadow d-flex align-items-center h-100 px-5"
						style="min-height: 160px;">
						<div class="d-flex">
							<div class="flex-shrink-0 btn-lg-square rounded-circle bg-light">
								<i class="fas fa-stethoscope text-primary"></i>
							</div>
							<div class="ps-3">
								<h4>एएनसी शिबिर</h4>
								<span>महिन्यातून एकदा</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Features Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-5 ">


				<div class="col-lg-6">
					<div class="row g-4 align-items-center">

						<table class="custom-table">
							<caption>
								<spring:message code="health_department.available_services" />
							</caption>
							<spring:message code="health_department.available_services_list" />

						</table>

					</div>
				</div>

				<div class="col-lg-6">
					<div class="row g-4 align-items-center">

						<table class="custom-table">
							<caption>
								<spring:message code="health_department.staff" />
							</caption>
							<spring:message code="health_department.staff_list" />

						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Features End -->





	<!-- Features Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-5 align-items-center">
				<div class="col-lg-12">
					<div class="row g-4 align-items-center">

						<div class="row g-4">
							<div class="col-4 wow fadeIn" data-wow-delay="0.3s">
								<div class="text-center rounded py-5 px-4"
									style="box-shadow: 0 0 45px rgba(0, 0, 0, .08);">
									<div class="btn-square bg-light rounded-circle mx-auto mb-4"
										style="width: 90px; height: 90px;">
										<i class="fa fa-check fa-3x text-primary"></i>
									</div>
									<h4 class="mb-0">100% Satisfaction</h4>
								</div>
							</div>
							<div class="col-4 wow fadeIn" data-wow-delay="0.5s">
								<div class="text-center rounded py-5 px-4"
									style="box-shadow: 0 0 45px rgba(0, 0, 0, .08);">
									<div class="btn-square bg-light rounded-circle mx-auto mb-4"
										style="width: 90px; height: 90px;">
										<i class="fa fa-users fa-3x text-primary"></i>
									</div>
									<h4 class="mb-0">Dedicated Team</h4>
								</div>
							</div>

							<div class="col-4 wow fadeIn" data-wow-delay="0.5s">
								<div class="text-center rounded py-5 px-4"
									style="box-shadow: 0 0 45px rgba(0, 0, 0, .08);">
									<div class="btn-square bg-light rounded-circle mx-auto mb-4"
										style="width: 90px; height: 90px;">
										<i class="fa fa-tools fa-3x text-primary"></i>
									</div>
									<h4 class="mb-0">Modern Equipment</h4>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container-xxl py-5">
		<div class="container">

			<div class="row g-5 align-items-center">
				<div class="col-lg-6 wow fadeInUp"></div>
			</div>

		</div>
	</div>
	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>


	<%@ include file="footer.jsp"%>

</body>
<style>
</style>
</html>