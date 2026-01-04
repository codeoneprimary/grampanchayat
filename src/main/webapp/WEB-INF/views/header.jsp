<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="currentPage" value="${pageContext.request.requestURI}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="header.village_name" /></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link
	href="${pageContext.request.contextPath}/resources/img/favicon.ico"
	rel="icon">

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
								class="dropdown-item ${fn:contains(currentPage,'profile')?'active':''}"
								href="profile"><i class="fas fa-user me-2"></i> Profile</a></li>

							<li class="nav-item"><a
								class="dropdown-item ${fn:contains(currentPage,'logout')?'active':''}"
								href="logout"><i class="fas fa-sign-out-alt me-2"></i>
									Logout</a></li>

							<c:if
								test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
								<li class="nav-item"><a
									class="dropdown-item ${fn:contains(currentPage,'adminRegistration')?'active':''}"
									href="adminRegistration"><i class="fas fa-user-plus me-2"></i>
										Admin Register</a></li>

								<li class="nav-item"><a
									class="dropdown-item ${fn:contains(currentPage,'addsNews')?'active':''}"
									href="addsNews"><i class="fas fa-newspaper me-2"></i> <spring:message
											code="header.important_announcement" /></a></li>

							</c:if>

							<li class="nav-item"><a
								class="dropdown-item ${fn:contains(currentPage,'userApplications')?'active':''}"
								href="userApplications"><i class="bi bi-grid-3x3-gap me-2"></i>
									User Applications</a></li>
						</c:if>
						<c:if test="${empty sessionScope.regUserId}">
							<li class="nav-item"><a
								class="dropdown-item ${fn:contains(currentPage,'login')?'active':''}"
								href="login"><i class="fas fa-sign-in-alt me-2"></i> Login</a></li>
							<li class="nav-item"><a
								class="dropdown-item ${fn:contains(currentPage,'userRegistration')?'active':''}"
								href="userRegistration"><i class="fas fa-user-plus me-2"></i>
									Register</a></li>
						</c:if>

					</ul>

				</div>
			</div>
		</div>
	</div>

	<!-- Navbar Start -->
	<nav class="navbar navbar-expand-lg bg-white navbar-light custom-nav">

		<div class="left-group">
			<img
				src="${pageContext.request.contextPath}/resources/img/satyamevJayateSymbol.jpg"
				class="nav-logo-left">

			<div class="nav-title">
				<h2>
					<spring:message code="header.village_name" />
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
						<li class="nav-item"><a href="home"
							class="nav-link ${fn:contains(currentPage,'home')?'active':''}"><spring:message
									code="header.home" /></a></li>

						<!-- About Dropdown -->
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle ${fn:contains(currentPage, 'about') 
							 || fn:contains(currentPage, 'visionAndMission')
							  || fn:contains(currentPage, 'objectivesAndFunctions')
							   || fn:contains(currentPage, 'administrativeStructure')
							    || fn:contains(currentPage, 'whoIsWho')
							    || fn:contains(currentPage, 'currentSadasya')
							? 'active' : ''}"
							data-bs-toggle="dropdown"><spring:message code="header.about" /></a>
							<ul class="dropdown-menu">
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'about')?'active':''}"
									href="about"><spring:message code="header.parichay" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'visionAndMission')?'active':''}"
									href="visionAndMission"><spring:message
											code="header.vision_mission" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'objectivesAndFunctions')?'active':''}"
									href="objectivesAndFunctions"><spring:message
											code="header.objectives_functions" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'administrativeStructure')?'active':''}"
									href="administrativeStructure"><spring:message
											code="header.administrative_structure" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'whoIsWho')?'active':''}"
									href="whoIsWho"><spring:message code="header.who_is_who" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'currentSadasya')?'active':''}"
									href="currentSadasya"><spring:message
											code="header.current_Sadasya" /></a></li>
							</ul></li>

						<!-- Directory Dropdown -->
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle ${fn:contains(currentPage, 'groupDevelopmentOfficer') 
							 || fn:contains(currentPage, 'helpline')
							? 'active' : ''}"
							data-bs-toggle="dropdown"><spring:message
									code="header.directory" /></a>
							<ul class="dropdown-menu">
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'groupDevelopmentOfficer')?'active':''}"
									href="groupDevelopmentOfficer"><spring:message
											code="header.group_development_officer" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'helpline')?'active':''}"
									href="helpline"><spring:message code="header.helpline" /></a></li>
							</ul></li>

						<!-- History -->
						<li class="nav-item"><a href="history"
							class="nav-link ${fn:contains(currentPage,'history')?'active':''}"><spring:message
									code="header.history" /></a></li>

						<!-- Departments Dropdown -->
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle ${fn:contains(currentPage, 'healthDepartment') 
							 || fn:contains(currentPage, 'administrativeDepartment')
							 || fn:contains(currentPage, 'agricultureDepartment')
							 || fn:contains(currentPage, 'animalHusbandryDepartment')
							 || fn:contains(currentPage, 'educationDepartment')
							 || fn:contains(currentPage, 'ruralWaterSupplyDepartment')
							 || fn:contains(currentPage, 'swachhBharatMission')
							? 'active' : ''}"
							data-bs-toggle="dropdown"><spring:message
									code="header.department" /></a>
							<ul class="dropdown-menu">
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'healthDepartment')?'active':''}"
									href="healthDepartment"><spring:message
											code="header.health_department" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'administrativeDepartment')?'active':''}"
									href="administrativeDepartment"><spring:message
											code="header.administrative_department" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'agricultureDepartment')?'active':''}"
									href="agricultureDepartment"><spring:message
											code="header.agriculture_department" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'animalHusbandryDepartment')?'active':''}"
									href="animalHusbandryDepartment"><spring:message
											code="header.animal_husbandry_department" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'educationDepartment')?'active':''}"
									href="educationDepartment"><spring:message
											code="header.education_department" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'ruralWaterSupplyDepartment')?'active':''}"
									href="ruralWaterSupplyDepartment"><spring:message
											code="header.rural_water_supply_department" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'swachhBharatMission')?'active':''}"
									href="swachhBharatMission"><spring:message
											code="header.swachh_bharat_mission" /></a></li>
							</ul></li>

						<!-- Schemes Dropdown -->
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle ${fn:contains(currentPage, 'currentSchemes') 
							 || fn:contains(currentPage, 'furtherSchemes')
							? 'active' : ''}"
							data-bs-toggle="dropdown"><spring:message
									code="header.schemes" /></a>
							<ul class="dropdown-menu">
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'currentSchemes')?'active':''}"
									href="currentSchemes"><spring:message
											code="header.current_schemes" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'furtherSchemes')?'active':''}"
									href="furtherSchemes"><spring:message
											code="header.further_schemes" /></a></li>
							</ul></li>

						<!-- Gallery -->
						<li class="nav-item"><a href="gallery"
							class="nav-link ${fn:contains(currentPage,'gallery')?'active':''}"><spring:message
									code="header.gallery" /></a></li>

						<!-- Contact -->
						<li class="nav-item"><a href="contact"
							class="nav-link ${fn:contains(currentPage,'contact')?'active':''}"><spring:message
									code="header.contact" /></a></li>

						<!-- Schemes Dropdown -->
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle ${fn:contains(currentPage, 'birthCertificateApplication') 
							 || fn:contains(currentPage, 'deathCertificateApplication')
							? 'active' : ''}"
							data-bs-toggle="dropdown"><spring:message
									code="header.application" /></a>
							<ul class="dropdown-menu">
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'birthCertificateApplication')?'active':''}"
									href="birthCertificateApplication"><spring:message
											code="header.birth_certificate_application" /></a></li>
								<li><a
									class="dropdown-item ${fn:contains(currentPage,'deathCertificateApplication')?'active':''}"
									href="deathCertificateApplication"><spring:message
											code="header.death_certificate_application" /></a></li>
							</ul></li>
					</ul>
				</div>
			</div>

		</nav>

	</div>
	<!-- Topbar End -->

</body>


</html>