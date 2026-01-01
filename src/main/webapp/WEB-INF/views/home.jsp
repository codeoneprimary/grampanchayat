<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title><spring:message code="header.home" /></title>
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
						src="${pageContext.request.contextPath}/resources/img/mantri/punehome.png"
						alt="Image" style="height: 450px; width: 100%;">
				</div>
				<div class="carousel-item">
					<img
						src="${pageContext.request.contextPath}/resources/img/mantri/satarahome.jpg"
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


	<div class="container-fluid ">
		<div class="card shadow-sm mt-3">
			<div class="card-header bg-success text-white">
				📢
				<spring:message code="home.important_announcements" />
			</div>
			<div class="text-scroll-box">
				<div class="text-scroll-track scroll-active">
					<div class="text-scroll-content">
						<span>Important Government Announcement</span> <span>New
							Schemes Available for Citizens</span> <span>Apply Online via
							Official Government Portals</span>
					</div>

					<!-- Duplicate for seamless loop -->
					<div class="text-scroll-content">
						<span>Important Government Announcement</span> <span>New
							Schemes Available for Citizens</span> <span>Apply Online via
							Official Government Portals</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container-xxl py-5">
		<div class="container">
			<div class="row justify-content-center g-5 text-center">


				<div class="col-lg-3 col-md-12 ">
					<div class="row justify-content-center g-5 text-center">

						<div class="" style="text-align: justify;">
							<p class="fw-bold text-primary">
								<spring:message code="header.grampanchayat" />
							</p>
							<h3 class="mb-3">
								<spring:message code="header.village_name" />
							</h3>

							<spring:message code="aboutus.para1" />
							<a aria-label="अधिक वाचा … परिचय" title="अधिक वाचा …"
								href="about"
								class="btn btn-style-outline accent-color accent-border-color"><spring:message
									code="home.more_read_on" /> …</a>
						</div>

					</div>
				</div>



				<div class="col-lg-9 col-md-7 ">

					<div class="row justify-content-center g-5 text-center">

						<!-- Card 1 -->
						<div class="col-lg-4 col-md-6">
							<div class="profile-card">
								<img
									src="${pageContext.request.contextPath}/resources/img/mantri/cm.png"
									class="profile-img">
								<h5 class="mt-3 fw-bold">
									<spring:message code="home.cm_name" />
								</h5>
								<p class="text-muted mb-0">
									<spring:message code="home.cm_details" />
								</p>
							</div>
						</div>

						<!-- Card 2 -->
						<div class="col-lg-4 col-md-6">
							<div class="profile-card">
								<img
									src="${pageContext.request.contextPath}/resources/img/mantri/dcm1.png"
									class="profile-img">
								<h5 class="mt-3 fw-bold">
									<spring:message code="home.dcm_name1" />
								</h5>
								<p class="text-muted mb-0">
									<spring:message code="home.dcm_name1_details" />
								</p>
							</div>
						</div>

						<!-- Card 3 -->
						<div class="col-lg-4 col-md-6">
							<div class="profile-card">
								<img
									src="${pageContext.request.contextPath}/resources/img/mantri/dcm2.png"
									class="profile-img">
								<h5 class="mt-3 fw-bold">
									<spring:message code="home.dcm_name2" />
								</h5>
								<p class="text-muted mb-0">
									<spring:message code="home.dcm_name2_details" />
								</p>
							</div>
						</div>

						<!-- Card 4 -->
						<div class="col-lg-4 col-md-6">
							<div class="profile-card">
								<img
									src="${pageContext.request.contextPath}/resources/img/mantri/minister1.png"
									class="profile-img">
								<h5 class="mt-3 fw-bold">
									<spring:message code="home.minister1" />
								</h5>
								<p class="text-muted mb-0">
									<spring:message code="home.minister1_details" />
								</p>
							</div>
						</div>
						<!-- Card 5 -->
						<div class="col-lg-4 col-md-6">
							<div class="profile-card">
								<img
									src="${pageContext.request.contextPath}/resources/img/mantri/minister2.png"
									class="profile-img">
								<h5 class="mt-3 fw-bold">
									<spring:message code="home.minister2" />
								</h5>
								<p class="text-muted mb-0">
									<spring:message code="home.minister2_details" />
								</p>
							</div>
						</div>

						<div class="col-lg-4 col-md-6">
							<div class="profile-card">
								<img
									src="${pageContext.request.contextPath}/resources/img/mantri/supriyaSule.jpg"
									class="profile-img">
								<h5 class="mt-3 fw-bold">
									<spring:message code="home.mp_name" />
								</h5>
								<p class="text-muted mb-0">
									<spring:message code="home.mp_details" />
								</p>
							</div>
						</div>

						<div class="col-lg-4 col-md-6">
							<div class="profile-card">
								<img
									src="${pageContext.request.contextPath}/resources/img/mantri/kul.jpg"
									class="profile-img">
								<h5 class="mt-3 fw-bold">
									<spring:message code="home.mla_name" />
								</h5>
								<p class="text-muted mb-0">
									<spring:message code="home.mla_details" />
								</p>
							</div>
						</div>
						<!-- Card 6 -->
						<div class="col-lg-4 col-md-6">
							<div class="profile-card">
								<img
									src="${pageContext.request.contextPath}/resources/img/mantri/sarpanch.png"
									class="profile-img">
								<h5 class="mt-3 fw-bold">
									<spring:message code="home.sarpanch_name" />
								</h5>
								<p class="text-muted mb-0">
									<spring:message code="home.sarpanch_name_details" />
								</p>
							</div>
						</div>

						<!-- Card 6 -->
						<div class="col-lg-4 col-md-6">
							<div class="profile-card">
								<img
									src="${pageContext.request.contextPath}/resources/img/mantri/d_sarpanch.jpg"
									class="profile-img">
								<h5 class="mt-3 fw-bold">
									<spring:message code="home.d_sarpanch_name" />
								</h5>
								<p class="text-muted mb-0">
									<spring:message code="home.d_sarpanch_name_details" />
								</p>
							</div>
						</div>
						<!-- Card 7 -->
						<div class="col-lg-4 col-md-6">
							<div class="profile-card">
								<img
									src="${pageContext.request.contextPath}/resources/img/mantri/ceo.jpg"
									class="profile-img">
								<h5 class="mt-3 fw-bold">
									<spring:message code="home.gramsevak_name" />
								</h5>
								<p class="text-muted mb-0">
									<spring:message code="home.gramsevak_details" />
								</p>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>

	<hr class="section-line">

	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-5">

				<div class="col-lg-5">


					<h4 class="mb-3">कार्यक्रम / योजना</h4>
					<ul class="text-dark text-decoration-none">
						<li>२६ जानेवारी २०२६ प्रजासत्ताक दिन ठीक सकाळी ८.०० वा.</li>
						<li>२६ जानेवारी २०२६ ग्रामसभा ठीक सकाळी १०.०० वा.</li>
					</ul>

				</div>
				<div class="col-lg-4">

					<h4 class="mb-3">
						<spring:message code="header.application" />
					</h4>
					<ul class="text-dark text-decoration-none">
						<li><a href="birthCertificateApplication"
							class="dropdown-item"> <spring:message
									code="header.birth_certificate_application" />
						</a></li>
						<li><a href="deathCertificateApplication"
							class="dropdown-item"> <spring:message
									code="header.death_certificate_application" />
						</a></li>
					</ul>

				</div>


				<div class="col-lg-3">

					<h4 class="mb-3">
						<spring:message code="header.department" />
					</h4>
					<ul class="text-dark text-decoration-none">
						<li><a class="dropdown-item" href="healthDepartment"><spring:message
									code="header.health_department" /></a></li>
						<li><a class="dropdown-item " href="administrativeDepartment"><spring:message
									code="header.administrative_department" /></a></li>
						<li><a class="dropdown-item " href="agricultureDepartment"><spring:message
									code="header.agriculture_department" /></a></li>
						<li><a class="dropdown-item "
							href="animalHusbandryDepartment"><spring:message
									code="header.animal_husbandry_department" /></a></li>
						<li><a class="dropdown-item" href="educationDepartment"><spring:message
									code="header.education_department" /></a></li>
						<li><a class="dropdown-item "
							href="ruralWaterSupplyDepartment"><spring:message
									code="header.rural_water_supply_department" /></a></li>
						<li><a class="dropdown-item " href="swachhBharatMission"><spring:message
									code="header.swachh_bharat_mission" /></a></li>
					</ul>

				</div>

			</div>
		</div>
	</div>


	<hr class="section-line">


	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-5">
				<div class="col-lg-5">

					<div class="card shadow-sm">
						<div class="card-header bg-success text-white">
							🗺
							<spring:message code="home.village_location_map" />
						</div>
						<div class="card-body p-0">

							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d60568.412911448206!2d74.33928014445566!3d18.414420510389725!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc31a3f9448e467%3A0xbf73e1428482de9e!2sDeulgaon%20Gada%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1766591784458!5m2!1sen!2sin"
								width="100%" height="300" style="border: 0;" allowfullscreen=""
								loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
						</div>
					</div>

				</div>
				<div class="col-lg-4">
					<h4 class="mb-3">
						<spring:message code="header.helpline" />
					</h4>
					<ul class="text-dark text-decoration-none">
						<spring:message code="home.emergency_contact" />
					</ul>

				</div>
				<div class="col-lg-3">

					<h4 class="mb-3">
						<spring:message code="home.important_links" />
					</h4>
					<ul class="text-dark text-decoration-none">
						<li><a href="https://www.india.gov.in"
							aria-label="भारत सरकार " target="_blank" style=""
							onclick="return confirm('You are being redirected to an external website. Please note that ग्रामपंचायत देऊळगाव गाडा cannot be held responsible for external websites content &amp; privacy policies.');"
							rel="noopener noreferrer" class="dropdown-item"><spring:message
									code="home.government_of_india" /> </a></li>
						<li><a href="https://www.maharashtra.gov.in/"
							aria-label="महाराष्ट्र शासन" target="_blank" style=""
							onclick="return confirm('You are being redirected to an external website. Please note that ग्रामपंचायत देऊळगाव गाडा cannot be held responsible for external websites content &amp; privacy policies.');"
							rel="noopener noreferrer" class="dropdown-item"><spring:message
									code="home.government_of_maharashtra" /> </a></li>
						<li><a href="https://rdd.maharashtra.gov.in/"
							aria-label="ग्रामविकास व पंचायतराज विभाग" style=""
							onclick="return confirm('You are being redirected to an external website. Please note that ग्रामपंचायत देऊळगाव गाडा cannot be held responsible for external websites content &amp; privacy policies.');"
							target="_blank" rel="noopener noreferrer" class="dropdown-item"><spring:message
									code="home.department_of_rural_development_and_panchayat_raj" />
						</a></li>
						<li><a href="https://divcompune.maharashtra.gov.in/"
							aria-label="विभागीय कार्यालय, पुणे" target="_blank" style=""
							onclick="return confirm('You are being redirected to an external website. Please note that ग्रामपंचायत देऊळगाव गाडा cannot be held responsible for external websites content &amp; privacy policies.');"
							rel="noopener noreferrer" class="dropdown-item"><spring:message
									code="home.divisional_office" /> </a></li>
						<li><a href="https://pune.gov.in/"
							aria-label="जिल्हाधिकारी कार्यालय, पुणे" style=""
							onclick="return confirm('You are being redirected to an external website. Please note that ग्रामपंचायत देऊळगाव गाडा cannot be held responsible for external websites content &amp; privacy policies.');"
							target="_blank" rel="noopener noreferrer" class="dropdown-item"><spring:message
									code="home.district_collector_office" /> </a></li>
						<li><a href="http://www.punezpebilling.in/site/login"
							aria-label="इंटेलिजंट वर्क्स मॅनेजमेंट सिस्टम (IWMS)"
							target="_blank" style=""
							onclick="return confirm('You are being redirected to an external website. Please note that ग्रामपंचायत देऊळगाव गाडा cannot be held responsible for external websites content &amp; privacy policies.');"
							rel="noopener noreferrer" class="dropdown-item"><spring:message
									code="home.iwms" /> </a></li>
						<li><a href="https://zppunekamwatap.in/"
							aria-label="सु.बे.अ आणि मजूर सहकारी संस्था कामवाटप सिस्टम"
							target="_blank" style=""
							onclick="return confirm('You are being redirected to an external website. Please note that ग्रामपंचायत देऊळगाव गाडा cannot be held responsible for external websites content &amp; privacy policies.');"
							rel="noopener noreferrer" class="dropdown-item"><spring:message
									code="home.societies_work_distribution_system" /> </a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<hr class="section-line">

	<div class="container-fluid ">
		<div class="card border-0 shadow-sm">
			<div
				class="card-header bg-white text-dark text-center fw-bold border-0">
				🔗
				<spring:message code="home.other_websites" />
			</div>

			<div class="card-body p-2">
				<div class="logo-scroll-box" id="logoScrollBox">
					<div class="logo-scroll-track" id="logoScrollTrack">
						<div class="logo-scroll-content">

							<a href="https://mahadbt.maharashtra.gov.in" target="_blank">
								<img
								src="${pageContext.request.contextPath}/resources/img/digitalLogo/mahadbt.png"
								alt="India.gov.in" class="logo-xlarge">
							</a> <a href="https://india.gov.in" target="_blank"> <img
								src="${pageContext.request.contextPath}/resources/img/digitalLogo/india-gov.png"
								alt="India.gov.in" class="logo-xlarge">
							</a> <a href="https://www.mygov.in" target="_blank"> <img
								src="${pageContext.request.contextPath}/resources/img/digitalLogo/mygov.png"
								alt="MyGov" class="logo-xlarge">
							</a> <a href="https://digitalindia.gov.in" target="_blank"> <img
								src="${pageContext.request.contextPath}/resources/img/digitalLogo/digital-india.png"
								alt="Digital India" class="logo-xlarge">
							</a> <a href="https://web.umang.gov.in" target="_blank"> <img
								src="${pageContext.request.contextPath}/resources/img/digitalLogo/umang.png"
								alt="UMANG" class="logo-xlarge">
							</a> <a href="https://uidai.gov.in" target="_blank"> <img
								src="${pageContext.request.contextPath}/resources/img/digitalLogo/aadhaar.png"
								alt="UIDAI" class="logo-xlarge">
							</a> <a href="https://swachhbharatmission.ddws.gov.in"
								target="_blank"> <img
								src="${pageContext.request.contextPath}/resources/img/digitalLogo/swach-bharat.png"
								alt="swach-bharat" class="logo-xlarge">
							</a> <a href="https://nss.gov.in" target="_blank"> <img
								src="${pageContext.request.contextPath}/resources/img/digitalLogo/national-service-scheme.png"
								alt="nss" class="logo-xlarge">
							</a> <a href="https://aaplesarkar.mahaonline.gov.in" target="_blank">
								<img
								src="${pageContext.request.contextPath}/resources/img/digitalLogo/aaplesarkar.png"
								alt="aaplesarkar" class="logo-xlarge">
							</a> <a href="https://www.digilocker.gov.in" target="_blank"> <img
								src="${pageContext.request.contextPath}/resources/img/digitalLogo/digilocker.png"
								alt="digilocker" class="logo-xlarge">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>


	<%@ include file="footer.jsp"%>
	<script>
		window.addEventListener("load", function() {

			const box = document.getElementById("logoScrollBox");
			const track = document.getElementById("logoScrollTrack");
			const content = track.children[0];

			// Scroll ONLY if icons overflow
			if (content.scrollWidth > box.clientWidth) {

				// Duplicate content for seamless scroll
				track.appendChild(content.cloneNode(true));

				// Enable animation
				track.classList.add("scroll-active");
			}
		});
	</script>


</body>

</html>