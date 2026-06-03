<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<spring:message code="header.contact" var="pageTitle" />

<c:set var="pageDescription"
	value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<c:set var="pageKeywords"
	value="Deulgaon Gada, Deulgaon Gada Gram Panchayat, Maharashtra village, Gram Panchayat services, property tax Deulgaon Gada, देऊळगाव गाडा, देऊळगाव गाडा ग्रामपंचायत" />

</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- Contact Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-5">
				<div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
					<p class="fs-5 fw-bold text-primary">
						<spring:message code="header.contact" />
					</p>
					<h1 class="display-5 mb-5">
						<spring:message code="header.village_name" />
					</h1>



					<form id="complaintForm">
						<div class="row g-3">
							<div class="col-md-12">
								<div class="form-floating">
									<input type="text" class="form-control" id="fullName"
										name="fullName" placeholder="Your Name" required> <label
										for="name"><spring:message code="contactus.name" />*</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-floating">
									<input type="text" class="form-control" id="mobile"
										name="mobile" placeholder="Your mobile" maxlength="10"
										pattern="[0-9]{10}" required> <label for="mobile"><spring:message
											code="contactus.mobile" />*</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-floating">
									<input type="email" class="form-control" id="email" name="email"
										placeholder="Your Email"> <label for="email"><spring:message
											code="contactus.email" /></label>
								</div>
							</div>
							<div class="col-12">
								<div class="form-floating">
									<input type="text" class="form-control" id="complaintType" name="complaintType"
										placeholder="Subject" required> <label for="subject"><spring:message
											code="contactus.subject" />*</label>
								</div>
							</div>
							<div class="col-12">
								<div class="form-floating">
									<textarea class="form-control"
										placeholder="Leave a message here" id="details" name="details"
										style="height: 100px" required></textarea>
									<label for="message"><spring:message
											code="contactus.message" />*</label>
								</div>
							</div>
							<div class="col-12">
								<button type="button" id="submitBtn"
									class="btn btn-success btn-lg px-5 rounded-pill shadow-sm">
									<spring:message code="msg.submit" />
								</button>
							</div>

							<div id="msg" class="text-center text-danger fw-semibold"></div>
						</div>
					</form>
				</div>
				<div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s"
					style="min-height: 450px;">
					<div class="position-relative rounded overflow-hidden h-100">
						<iframe class="position-relative w-100 h-100"
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d60568.412911448206!2d74.33928014445566!3d18.414420510389725!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc31a3f9448e467%3A0xbf73e1428482de9e!2sDeulgaon%20Gada%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1766591784458!5m2!1sen!2sin"
							frameborder="0" style="min-height: 450px; border: 0;"
							allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->

	<!-- Back to Top -->
	<!-- 
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>
 -->

	<%@ include file="footer.jsp"%>
	<script>
	submitBtn.onclick = () => {

	    const form = document.getElementById("complaintForm");

	    if (!form.checkValidity()) {
	        form.classList.add("was-validated");
	        return;
	    }

	    const formData = new FormData(form);

	    fetch("<%=request.getContextPath()%>/api/complaint/add", {
	        method: "POST",
	        body: formData
	    })
	    .then(res => res.json())
	    .then(response => {
	        document.getElementById("msg").innerHTML =
	            "<div class='alert alert-success'>Contact Submitted Successfully ✅</div>";
	        form.reset();
	    })
	    .catch(err => {
	        document.getElementById("msg").innerHTML =
	            "<div class='alert alert-danger'>Error ❌</div>";
	    });
	};
</script>

</body>

</html>