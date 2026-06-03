<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="currentPath" value="${pageContext.request.requestURI}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle}</title>
<meta name="description"
content="देऊळगाव गाडा ग्रामपंचायत,स्थानिक प्रशासन, महाराष्ट्र. कर भरणा, प्रमाणपत्रे, योजना व नागरिक सेवा उपलब्ध. Deulgaon Gada Gram Panchayat offers property tax, certificates and rural development services, Rural Development and Panchayat Raj Department">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="canonical" href="https://deulgaongada.com/">

<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="${pageContext.request.contextPath}/resources/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/css/commonstyle.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXX"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'G-XXXXXXX');
</script>
<script>
	(function() {
		const isProduction = window.location.hostname === 'deulgaongada.com'
				|| window.location.hostname === 'www.deulgaongada.com';

		// If NOT production, block indexing (for testing environments only)
		if (!isProduction) {
			let existingMeta = document.querySelector('meta[name="robots"]');
			if (!existingMeta) {
				const robotsMeta = document.createElement('meta');
				robotsMeta.name = 'robots';
				robotsMeta.content = 'noindex, nofollow';
				document.head.appendChild(robotsMeta);
			}
		}
	})();

	window.addEventListener('popstate', function() {
		const isProduction = window.location.hostname === 'deulgaongada.com'
				|| window.location.hostname === 'www.deulgaongada.com';

		if (!isProduction) {
			let existingMeta = document.querySelector('meta[name="robots"]');
			if (!existingMeta) {
				const robotsMeta = document.createElement('meta');
				robotsMeta.name = 'robots';
				robotsMeta.content = 'noindex, nofollow';
				document.head.appendChild(robotsMeta);
			}
		}
	});
</script>

<style type="text/css">
/* Prevent horizontal scroll */
body {
	overflow-x: hidden;
}

/* Navbar items stay in one line */
.navbar-nav {
	flex-wrap: wrap !important;
	white-space: nowrap;
}

/* Reduce spacing */
.navbar-nav .nav-link {
	font-size: clamp(11px, 0.9vw, 15px);
	padding: 6px 8px;
}

/* Auto shrink text when screen tight */
@media ( max-width : 1400px) {
	.navbar-nav .nav-link {
		font-size: 13px;
	}
}

@media ( max-width : 1200px) {
	.navbar-nav .nav-link {
		font-size: 12px;
	}
}

/* Control logo size */
.nav-logo-left, .nav-logo-right {
	max-height: 50px;
}

/* Title shrink */
.nav-title h2 {
	font-size: 18px;
}

@media ( max-width : 1200px) {
	.nav-title h2 {
		font-size: 16px;
	}
}
</style>
</head>

<body>

	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-primary" role="status"
			style="width: 3rem; height: 3rem;"></div>
	</div>
	<!-- Spinner End -->

	<!-- Topbar Start -->
	<div class="topbar1 clearfix">
		<div class="topbar1-left">महाराष्ट्र शासन | GOVERNMENT OF
			MAHARASHTRA</div>
		<div class="topbar1-right">
			<!-- Language Switch -->
			<c:set var="currentLang"
				value="${pageContext.response.locale.language}" />

			<form method="get" action="" style="display: inline;">
				<select name="lang" onchange="this.form.submit()">

					<c:choose>
						<c:when test="${currentLang eq 'mr'}">
							<option value="mr" selected>Marathi</option>
							<option value="en">English</option>
						</c:when>

						<c:otherwise>
							<option value="en" selected>English</option>
							<option value="mr">Marathi</option>
						</c:otherwise>
					</c:choose>

				</select>
			</form>

			<!-- User Login Icon -->
			<div class="nav-item dropdown d-inline">
				<a href="#" class="nav-link dropdown-toggle d-inline"
					data-bs-toggle="dropdown"> <i class="fas fa-user-circle"></i>
				</a>
				<div class="dropdown-menu dropdown-menu-end">

					<ul class="navbar-nav mx-auto">

						<c:if test="${not empty sessionScope.regUserId}">
							<li class="nav-item"><a
								class="dropdown-item ${fn:contains(currentPath,'myProfile')?'active':''}"
								href="${pageContext.request.contextPath}/myProfile"><i
									class="fas fa-user me-2"></i> <spring:message
										code="userRegistration.profile" /></a></li>

							<li class="nav-item"><a
								class="dropdown-item ${fn:contains(currentPath,'logout')?'active':''}"
								href="${pageContext.request.contextPath}/logout"><i
									class="fas fa-sign-out-alt me-2"></i> <spring:message
										code="userRegistration.logout" /></a></li>

							<c:if
								test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
								<li class="nav-item"><a
									class="dropdown-item ${fn:contains(currentPath,'adminRegistration')?'active':''}"
									href="${pageContext.request.contextPath}/adminRegistration"><i
										class="fas fa-user-plus me-2"></i></i> <spring:message
											code="header.adminRegistration" /> </a></li>
							</c:if>

						</c:if>
						<c:if test="${empty sessionScope.regUserId}">
							<li class="nav-item"><a
								class="dropdown-item ${fn:contains(currentPath,'login')?'active':''}"
								href="${pageContext.request.contextPath}/login"><i
									class="fas fa-sign-in-alt me-2"></i> <spring:message
										code="login.title" /></a></li>
							<li class="nav-item"><a
								class="dropdown-item ${fn:contains(currentPath,'userRegistration')?'active':''}"
								href="${pageContext.request.contextPath}/userRegistration"><i
									class="fas fa-user-plus me-2"></i> <spring:message
										code="userRegistration.registration" /></a></li>
						</c:if>

					</ul>

				</div>
			</div>
		</div>
	</div>

	<!-- Navbar Start -->
	<nav class="navbar navbar-expand-xxl bg-white navbar-light custom-nav">

		<div class="left-group">
			<a href="${pageContext.request.contextPath}/"> <img
				src="${pageContext.request.contextPath}/resources/img/satyamevJayateSymbol.jpg"
				class="nav-logo-left">
			</a>
			<div class="nav-title">
				<h2>
					<a href="${pageContext.request.contextPath}/" class="home-link">
						<spring:message code="header.village_name" />
					</a>
				</h2>
				<spring:message code="header.grampanchayat" />
			</div>
		</div>


		<img
			src="${pageContext.request.contextPath}/resources/img/digitalIndiaLogo.jpg"
			class="nav-logo-right">

		<!-- TOGGLER -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
	</nav>

	<div class="col-lg-12 mx-0 sticky-top">

		<nav class="navbar navbar-expand-lg navbar-custom1 ">
			<div class="container-fluid">
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav mx-auto">
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/home"
							class="nav-link ${fn:contains(currentPath,'home')?'active':''}"><spring:message
									code="header.home" /></a></li>

						<!-- About Dropdown -->
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle ${fn:contains(currentPath, 'about') 
							 || fn:contains(currentPath, 'visionAndMission')
							  || fn:contains(currentPath, 'objectivesAndFunctions')
							   || fn:contains(currentPath, 'administrativeStructure')
							    || fn:contains(currentPath, 'whoIsWho')
							    || fn:contains(currentPath, 'currentSadasya')
							? 'active' : ''}"
							data-bs-toggle="dropdown"><spring:message code="header.about" /></a>
							<ul class="dropdown-menu">
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'about')?'active':''}"
									href="${pageContext.request.contextPath}/about"><spring:message
											code="header.parichay" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'visionAndMission')?'active':''}"
									href="${pageContext.request.contextPath}/visionAndMission"><spring:message
											code="header.vision_mission" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'objectivesAndFunctions')?'active':''}"
									href="${pageContext.request.contextPath}/objectivesAndFunctions"><spring:message
											code="header.objectives_functions" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'administrativeStructure')?'active':''}"
									href="${pageContext.request.contextPath}/administrativeStructure"><spring:message
											code="header.administrative_structure" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'currentSadasya')?'active':''}"
									href="${pageContext.request.contextPath}/currentSadasya"><spring:message
											code="header.current_Sadasya" /></a></li>
							</ul></li>

						<!-- Directory Dropdown -->
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle ${fn:contains(currentPath, 'groupDevelopmentOfficer') 
							 || fn:contains(currentPath, 'helpline')
							? 'active' : ''}"
							data-bs-toggle="dropdown"><spring:message
									code="header.directory" /></a>
							<ul class="dropdown-menu">
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'groupDevelopmentOfficer')?'active':''}"
									href="${pageContext.request.contextPath}/groupDevelopmentOfficer"><spring:message
											code="header.group_development_officer" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'helpline')?'active':''}"
									href="${pageContext.request.contextPath}/helpline"><spring:message
											code="header.helpline" /></a></li>
							</ul></li>


						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle ${fn:contains(currentPath, 'pilgrimageSite') 
							 || fn:contains(currentPath, 'sarpanchHistory')
							? 'active' : ''}"
							data-bs-toggle="dropdown"><spring:message
									code="header.history" /></a>
							<ul class="dropdown-menu">
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'pilgrimageSite')?'active':''}"
									href="${pageContext.request.contextPath}/pilgrimageSite"><spring:message
											code="header.pilgrimageSite" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'sarpanchHistory')?'active':''}"
									href="${pageContext.request.contextPath}/sarpanchHistory"><spring:message
											code="header.sarpanchHistory" /></a></li>
							</ul></li>

						<!-- Departments Dropdown -->
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle ${fn:contains(currentPath, 'healthDepartment') 
							 || fn:contains(currentPath, 'administrativeDepartment')
							 || fn:contains(currentPath, 'agricultureDepartment')
							 || fn:contains(currentPath, 'animalHusbandryDepartment')
							 || fn:contains(currentPath, 'educationDepartment')
							 || fn:contains(currentPath, 'ruralWaterSupplyDepartment')
							 || fn:contains(currentPath, 'swachhBharatMission')
							? 'active' : ''}"
							data-bs-toggle="dropdown"><spring:message
									code="header.department" /></a>
							<ul class="dropdown-menu">
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'healthDepartment')?'active':''}"
									href="${pageContext.request.contextPath}/healthDepartment"><spring:message
											code="header.health_department" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'administrativeDepartment')?'active':''}"
									href="${pageContext.request.contextPath}/administrativeDepartment"><spring:message
											code="header.administrative_department" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'agricultureDepartment')?'active':''}"
									href="${pageContext.request.contextPath}/agricultureDepartment"><spring:message
											code="header.agriculture_department" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'animalHusbandryDepartment')?'active':''}"
									href="${pageContext.request.contextPath}/animalHusbandryDepartment"><spring:message
											code="header.animal_husbandry_department" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'educationDepartment')?'active':''}"
									href="${pageContext.request.contextPath}/educationDepartment"><spring:message
											code="header.education_department" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'ruralWaterSupplyDepartment')?'active':''}"
									href="${pageContext.request.contextPath}/ruralWaterSupplyDepartment"><spring:message
											code="header.rural_water_supply_department" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'swachhBharatMission')?'active':''}"
									href="${pageContext.request.contextPath}/swachhBharatMission"><spring:message
											code="header.swachh_bharat_mission" /></a></li>
							</ul></li>

						<!-- Schemes Dropdown -->

						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/currentSchemes"
							class="nav-link ${fn:contains(currentPath,'currentSchemes')?'active':''}"><spring:message
									code="header.schemes" /></a></li>


						<!-- Gallery -->
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/gallery"
							class="nav-link ${fn:contains(currentPath,'gallery')?'active':''}"><spring:message
									code="header.gallery" /></a></li>

						<!-- Contact -->
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/contact"
							class="nav-link ${fn:contains(currentPath,'contact')?'active':''}"><spring:message
									code="header.contact" /></a></li>

						<!-- Schemes Dropdown -->
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle ${fn:contains(currentPath, 'birthCertificateApplication') || fn:contains(currentPath, 'applicationList') 
							  || fn:contains(currentPath, 'userApplications') || fn:contains(currentPath, 'deathCertificateApplication')
							? 'active' : ''}"
							data-bs-toggle="dropdown"><spring:message
									code="header.application" /></a>
							<ul class="dropdown-menu">

								<c:choose>
									<c:when
										test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
										<li><a
											class="dropdown-item ${fn:contains(currentPath,'applicationList')?'active':''}"
											href="${pageContext.request.contextPath}/applicationList"><spring:message
													code="header.application_list" /></a></li>
									</c:when>
									<c:otherwise>

										<c:if test="${not empty sessionScope.regUserId}">
											<li><a
												class="dropdown-item ${fn:contains(currentPath,'userApplications')?'active':''}"
												href="${pageContext.request.contextPath}/userApplications"><spring:message
														code="header.application_list" /></a></li>
										</c:if>
										<li><a
											class="dropdown-item ${fn:contains(currentPath,'birthCertificateApplication')?'active':''}"
											href="${pageContext.request.contextPath}/birthCertificateApplication"><spring:message
													code="header.birth_certificate_application" /></a></li>
										<li><a
											class="dropdown-item ${fn:contains(currentPath,'deathCertificateApplication')?'active':''}"
											href="${pageContext.request.contextPath}/deathCertificateApplication"><spring:message
													code="header.death_certificate_application" /></a></li>
									</c:otherwise>
								</c:choose>
							</ul></li>

						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle ${fn:contains(currentPath, 'complaintForm') || fn:contains(currentPath, 'complaintFormList') 
							? 'active' : ''}"
							data-bs-toggle="dropdown"><spring:message
									code="complaintForm.header" /></a>
							<ul class="dropdown-menu">

								<c:choose>
									<c:when
										test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
										<li><a
											class="dropdown-item ${fn:contains(currentPath,'complaintFormList')?'active':''}"
											href="${pageContext.request.contextPath}/complaintFormList"><spring:message
													code="complaintForm.complaint_list" /></a></li>
									</c:when>

								</c:choose>
								<li><a
									class="dropdown-item ${currentPath == '/complaintForm' ? 'active' : ''} "
									href="${pageContext.request.contextPath}/complaintForm"><spring:message
											code="complaintForm.header" /></a></li>
							</ul></li>



						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle ${fn:contains(currentPath, 'houseRent') 
							 || fn:contains(currentPath, 'addProperty') || fn:contains(currentPath, 'editProperty')
							 || fn:contains(currentPath, 'propertyDetails')  || fn:contains(currentPath, 'propertyType') || fn:contains(currentPath, 'propertyList')
							? 'active' : ''}"
							data-bs-toggle="dropdown"><spring:message
									code="header.house_rent" /></a>

							<ul class="dropdown-menu">

								<c:if
									test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
									<li><a
										class="dropdown-item ${fn:contains(currentPath,'propertyType')?'active':''}"
										href="${pageContext.request.contextPath}/propertyType"><spring:message
												code="header.propertyType" /></a></li>
								</c:if>
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'propertyList')?'active':''}"
									href="${pageContext.request.contextPath}/propertyList"><spring:message
											code="header.propertyList" /></a></li>

								<c:if
									test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
									<li><a
										class="dropdown-item ${fn:contains(currentPath,'addProperty')?'active':''}"
										href="${pageContext.request.contextPath}/addProperty"><spring:message
												code="header.addProperty" /></a></li>

								</c:if>
								<!-- 
								<li><a
									class="dropdown-item ${fn:contains(currentPath,'houseRent')?'active':''}"
									href="${pageContext.request.contextPath}/houseRent"><spring:message
											code="header.house_rent" /></a></li>
											 -->
							</ul></li>

						<c:if
							test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">

							<li class="nav-item dropdown"><a href="#"
								class="nav-link dropdown-toggle  ${fn:contains(currentPath, 'taxHome') 
							 || fn:contains(currentPath, 'uploadPropertyTax')
							 || fn:contains(currentPath, 'propertyTaxDetails')  || fn:contains(currentPath, 'payPropertyTax') || fn:contains(currentPath, 'submitPayment') || fn:contains(currentPath, 'propertyTaxReport')
							? 'active' : ''}"
								data-bs-toggle="dropdown"><spring:message
										code="header.taxHome" /></a>

								<ul class="dropdown-menu">

									<li><a
										class="dropdown-item ${fn:contains(currentPath,'taxHome')?'active':''}"
										href="${pageContext.request.contextPath}/taxHome"><spring:message
												code="header.taxHome" /></a></li>

									<li><a
										class="dropdown-item ${fn:contains(currentPath,'uploadPropertyTax')?'active':''}"
										href="${pageContext.request.contextPath}/uploadPropertyTax"><spring:message
												code="propertyType.upload_property_tax" /></a></li>

									<li><a
										class="dropdown-item ${fn:contains(currentPath,'propertyTaxReport')?'active':''}"
										href="${pageContext.request.contextPath}/propertyTaxReport"><spring:message
												code="propertyType.tax_report" /></a></li>
								</ul></li>

						</c:if>

						<c:if
							test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
							<li class="nav-item dropdown"><a href="#"
								class="nav-link dropdown-toggle ${fn:contains(currentPath, 'addsNews') || fn:contains(currentPath, 'viewNews') || fn:contains(currentPath, 'uploadContactNumber')
								 || fn:contains(currentPath, 'addProgramEvent') || fn:contains(currentPath, 'viewProgramEvent')
								 
							? 'active' : ''}"
								data-bs-toggle="dropdown"><spring:message
										code="header.important_announcement" /></a>

								<ul class="dropdown-menu">
									<li><a
										class="dropdown-item ${fn:contains(currentPath,'addProgramEvent') || fn:contains(currentPath, 'viewProgramEvent')?'active':''}"
										href="${pageContext.request.contextPath}/addProgramEvent"><spring:message
												code="header.program_event" /></a></li>
									<li><a
										class="dropdown-item ${fn:contains(currentPath,'addsNews') || fn:contains(currentPath, 'viewNews') ?'active':''}"
										href="${pageContext.request.contextPath}/addsNews"><spring:message
												code="header.important_announcement" /></a></li>


									<li><a
										class="dropdown-item ${fn:contains(currentPath,'uploadContactNumber')?'active':''}"
										href="${pageContext.request.contextPath}/uploadContactNumber"><spring:message
												code="header.uploadContactNumber" /></a></li>

								</ul></li>
						</c:if>

						<c:if
							test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
							<li class="nav-item"><a
								href="${pageContext.request.contextPath}/uploadPdf"
								class="nav-link ${fn:contains(currentPath,'uploadPdf')?'active':''}"><spring:message
										code="header.uploadPdf" /></a></li>
						</c:if>
					</ul>
				</div>
			</div>

		</nav>

	</div>
	<!-- Topbar End -->

</body>


</html>