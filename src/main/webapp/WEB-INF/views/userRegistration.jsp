<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title><spring:message
		code="userRegistration.citizenregistration" /></title>
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<style type="text/css">
.login-wrapper {
	background: linear-gradient(135deg, #e6effa, #c7daf3);
	min-height: 100vh;
}

.login-card {
	border-radius: 12px;
	transition: 0.3s;
}

.login-card:hover {
	transform: translateY(-3px);
}

.instruction-card {
	background: #f8f9fa;
	border-radius: 10px;
}

.instruction-list {
	padding-left: 18px;
	color: #555;
}

.instruction-list li {
	margin-bottom: 8px;
}

.form-control:focus {
	border-color: #2f69b0;
	box-shadow: 0 0 0 0.2rem rgba(47, 105, 176, 0.2);
}
</style>
</head>
<body>

	<%@ include file="header.jsp"%>
	<!-- Quote Start -->
	<div class="login-wrapper">

		<div class="container py-5">
			<div class="row justify-content-center align-items-center">

				<!-- 📝 LEFT FORM -->
				<div class="col-lg-5 col-md-8 col-12">

					<div class="card shadow-lg border-0 login-card">

						<div class="card-body p-4">

							<h4 class="text-center fw-bold text-primary mb-4">
								📝
								<spring:message code="userRegistration.citizenregistration" />
							</h4>

							<!-- FULL NAME -->
							<div class="mb-3">
								<label class="form-label fw-semibold"> <spring:message
										code="admin_registration.full_name" /> *
								</label> <input type="text" id="fullName" name="fullName"
									class="form-control form-control-lg" placeholder="" required>
							</div>

							<!-- MOBILE -->
							<div class="mb-3">
								<label class="form-label fw-semibold"> <spring:message
										code="admin_registration.mobile_no" /> *
								</label> <input type="text" id="mobileNo" name="mobileNo"
									class="form-control form-control-lg" maxlength="10"
									placeholder="" required>
							</div>

							<!-- EMAIL -->
							<div class="mb-3">
								<label class="form-label fw-semibold"> <spring:message
										code="admin_registration.email_id" /> *
								</label> <input type="text" id="email" name="email"
									class="form-control form-control-lg" placeholder="Enter email">
							</div>

							<!-- SEND OTP -->
							<div class="text-center mt-3" id="userRegisterButton">
								<button class="btn btn-primary w-100" onclick="sendOtp()">
									📲
									<spring:message code="userRegistration.send_otp" />
								</button>
							</div>

							<!-- OTP SECTION -->
							<div id="otpDiv" style="display: none;">

								<div class="mt-4">
									<label class="form-label fw-semibold"> <spring:message
											code="userRegistration.enter_otp" /> *
									</label> <input type="text" id="otp"
										class="form-control form-control-lg" placeholder="Enter OTP">
								</div>

								<div class="text-center mt-3">
									<button class="btn btn-success w-100"
										onclick="verifyOtpRegister()">
										✅
										<spring:message code="userRegistration.verify_otp" />
									</button>
								</div>

							</div>

							<!-- MESSAGES -->
							<p id="otpError" class="text-danger text-center mt-2"></p>

							<div id="successMsg" class="alert alert-success text-center mt-3"
								style="display: none;"></div>

						</div>
					</div>

				</div>

				<!-- 📘 RIGHT SIDE INSTRUCTIONS -->
				<div class="col-lg-5 col-md-10 col-12 mt-4 mt-lg-0">

					<div class="card shadow-sm border-0 instruction-card">

						<div class="card-body">

							<h5 class="fw-bold mb-3">
								📘
								<spring:message code="registration.instructions" />
							</h5>

							<ul class="instruction-list">
								<li><spring:message code="registration.instructions1" /></li>
								<li><spring:message code="registration.instructions2" /></li>
								<li><spring:message code="registration.instructions3" /></li>
								<li><spring:message code="registration.instructions4" /></li>
								<li><spring:message code="registration.instructions5" /></li>

							</ul>

						</div>
					</div>

				</div>

			</div>
		</div>

	</div>

	<!-- Quote End -->

	<%@ include file="footer.jsp"%>

	<script>
	function sendOtp(){

	    if (!validateFullName()) return;
	    if (!validateMobile()) return;
	    if (!validateEmail()) return;
		$.post("<%=request.getContextPath()%>/api/citizenuser/sendRegisterOtp", {
			mobileNo : $("#mobileNo").val()
		}, function(res) {
			if(res.success ==true){
			   document.getElementById("userRegisterButton").style.display = "none";
			   	$("#otpDiv").show();
			}
		});
	    
	}
		function verifyOtpRegister() {

	        $("#otpError").text("");
	        if (!validateOtp()) return;
		    finalData = {};
		    finalData["mobileNo"] = $("#mobileNo").val();
		    finalData["fullName"] = $("#fullName").val();
		    finalData["email"] = $("#email").val();
		    finalData["otp"] = $("#otp").val();
		    
		    fetch("<%=request.getContextPath()%>/api/citizenuser/register", {
		        method: "POST",
		        headers: {"Content-Type": "application/json"},
		        body: JSON.stringify(finalData)
		    })
		    .then(res => res.json())
		    .then(res => {

				if(res.success ==true){
		            $("#successMsg").text("<spring:message code='login.successful' />").show();
		            // redirect after 2 seconds
		            setTimeout(() => {
		                window.location.href = "home";
		            }, 3000);
				}else{

					$("#otp").val("");
		            $("#otpError").text("Invalid otp");
				}
		    });
		}
		function validateFullName() {

		    let name = $("#fullName").val().trim();

		    if (name === "") {
		        $("#otpError").text("Full name is required");
		        return false;
		    }

		    if (name.length < 3) {
		        $("#otpError").text("Enter valid full name");
		        return false;
		    }

		    if (!/^[a-zA-Z ]+$/.test(name)) {
		        $("#otpError").text("Name should contain only letters");
		        return false;
		    }

		    return true;
		}
		function validateMobile() {

		    let mobile = $("#mobileNo").val().trim();

		    if (mobile === "") {
		        $("#otpError").text("Mobile number is required");
		        return false;
		    }

		    if (!/^[6-9]\d{9}$/.test(mobile)) {
		        $("#otpError").text("Enter valid 10 digit mobile number");
		        return false;
		    }

		    return true;
		}
		function validateOtp() {

		    let otp = $("#otp").val().trim();

		    if (otp === "") {
		        $("#otpError").text("OTP is required");
		        return false;
		    }

		    if (!/^\d{4,6}$/.test(otp)) {
		        $("#otpError").text("Enter valid OTP");
		        return false;
		    }

		    return true;
		}
		function validateEmail() {

		    let email = $("#email").val().trim();

		    if (email === "") {
		        $("#otpError").text("Email is required");
		        return false;
		    }

		    let regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

		    if (!regex.test(email)) {
		        $("#otpError").text("Enter valid email");
		        return false;
		    }

		    return true;
		}
	</script>
</body>

</html>