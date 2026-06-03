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

<spring:message code="login.title" var="pageTitle" />

<c:set var="pageDescription"
	value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<c:set var="pageKeywords"
	value="Deulgaon Gada, Deulgaon Gada Gram Panchayat, Maharashtra village, Gram Panchayat services, property tax Deulgaon Gada, देऊळगाव गाडा, देऊळगाव गाडा ग्रामपंचायत" />

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

	<div class="login-wrapper">

		<div class="container py-5">
			<div class="row justify-content-center align-items-center">

				<!-- 🔐 LEFT LOGIN -->
				<div class="col-lg-5 col-md-8 col-12">

					<div class="card shadow-lg border-0 login-card">

						<div class="card-body p-4">

							<h4 class="text-center fw-bold text-primary mb-4">
								🔐
								<spring:message code="login.applicant_login_here" />
							</h4>

							<!-- MOBILE -->
							<div class="mb-3">
								<label class="form-label fw-semibold"> <spring:message
										code="dob.application.mobile_no" /> *
								</label> <input type="text" id="mobileNo"
									class="form-control form-control-lg" maxlength="10"
									placeholder="Enter mobile number"> <small
									id="mobileError" class="text-danger"></small>
							</div>

							<!-- OTP SECTION -->
							<div id="otpDiv" style="display: none;">

								<div class="mb-3">
									<label class="form-label fw-semibold"> <spring:message
											code="login.enter_otp" /> *
									</label> <input type="text" id="otp"
										class="form-control form-control-lg"> <small
										id="otpError" class="text-danger"></small>

									<div class="mt-1">
										<button type="button" id="resendOtpButton"
											class="btn btn-link p-0" style="display: none;"
											onclick="sendOtp()">
											<spring:message code="login.resend_otp" />
										</button>
										<span id="timer" class="text-danger ms-2"></span>
									</div>
								</div>

								<!-- CAPTCHA -->
								<div class="mb-3">
									<label class="form-label fw-semibold">Captcha *</label>

									<div class="d-flex align-items-center gap-2">
										<input type="text" id="captcha" class="form-control"
											placeholder="Enter Captcha"> <img src="captcha"
											id="captchaImg" height="45" />

										<button class="btn btn-outline-secondary btn-sm"
											onclick="refreshCaptcha()">↻</button>
									</div>

									<small id="captchaError" class="text-danger"></small>
								</div>

								<!-- VERIFY BUTTON -->
								<div class="text-center mt-3" id="verifyOtpButton">
									<button type="button" class="btn btn-success w-100"
										onclick="verifyOtp()">
										<spring:message code="login.verify_otp" />
									</button>
								</div>

							</div>

							<!-- ACTION BUTTONS -->
							<div class="text-center mt-4" id="sendOtpButton">

								<a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary me-2"> ⬅ <spring:message
										code="msg.back" />
								</a>

								<button type="button" class="btn btn-primary"
									onclick="sendOtp()">
									📲
									<spring:message code="msg.submit" />
								</button>

							</div>

							<!-- MESSAGE -->
							<div id="apiMessage" class="text-center mt-3"></div>
							<p id="errorMsg" class="text-danger text-center mt-2"></p>

						</div>
					</div>

				</div>

				<!-- 📘 RIGHT INSTRUCTIONS -->
				<div class="col-lg-5 col-md-10 col-12 mt-4 mt-lg-0">

					<div class="card shadow-sm border-0 instruction-card">

						<div class="card-body">

							<h5 class="fw-bold mb-3">
								📘
								<spring:message code="login.instructions" />
							</h5>

							<ul class="instruction-list">
								<li><spring:message code="login.instructions1" /></li>
								<li><spring:message code="login.instructions2" /></li>
								<li><spring:message code="login.instructions3" /></li>
								<li><spring:message code="login.instructions4" /></li>
								<li><spring:message code="login.instructions5" /></li>
							</ul>

						</div>
					</div>

				</div>

			</div>
		</div>

	</div>



	<%@ include file="footer.jsp"%>
	<script>
	    let countdown = 60;
	    let timerInterval = null;
	
	    /* ================= BUTTON LOADER ================= */
	
	    function showBtnLoader(btnId) {
	        const btn = $("#" + btnId);
	        btn.prop("disabled", true);
	        btn.find(".btn-text").addClass("d-none");
	        btn.find(".spinner-border").removeClass("d-none");
	    }
	
	    function hideBtnLoader(btnId) {
	        const btn = $("#" + btnId);
	        btn.prop("disabled", false);
	        btn.find(".spinner-border").addClass("d-none");
	        btn.find(".btn-text").removeClass("d-none");
	    }
	
	    /* ================= TIMER ================= */
	
	    function startTimer() {
	
	        clearInterval(timerInterval);
	        countdown = 60;
	
	        $("#resendOtpButton").hide();
	        $("#timer").show();
	
	        timerInterval = setInterval(() => {
	
	            $("#timer").text("Resend OTP in " + countdown + " sec");
	            countdown--;
	
	            if (countdown < 0) {
	                clearInterval(timerInterval);
	                $("#timer").text("").hide();
	                $("#resendOtpButton").show();
	            }
	
	        }, 1000);
	    }
	
	    /* ================= ERROR HANDLING ================= */
	
	    function showError(msg) {
	        $("#errorMsg").text(msg).show();
	    }
	
	    function clearError() {
	        $("#errorMsg").text("").hide();
	    }
	
	    /* ================= SEND OTP ================= */
	
	    function sendOtp() {
	
	        clearError();
	        $("#mobileError").text("");
	
	        const mobile = $("#mobileNo").val().trim();
	        const regex = /^[6-9]\d{9}$/;
	
	        if (mobile === "") {
	            $("#mobileError").text("Mobile number is required");
	            return;
	        }
	
	        if (!regex.test(mobile)) {
	            $("#mobileError").text("Enter valid 10 digit mobile number");
	            $("#mobileNo").val("");
	            return;
	        }
	
	        showBtnLoader("sendOtpButton");
	
	        $.post(
	            "${pageContext.request.contextPath}/api/citizenuser/sendOtp",
	            { mobileNo: mobile }
	        )
	        .done(function (res) {
	
	            if (res.message === "REGISTER_REQUIRED") {
	                window.location.href = "${pageContext.request.contextPath}/userRegistration";
	                return;
	            }
	
	            if (res.success === true) {
	                $("#sendOtpButton").hide();
	                $("#otpDiv").show();
	                $("#mobileNo").prop("readonly", true);
	                startTimer();
	            }
	
	        })
	        .fail(function () {
	            showError("Server error. Please try again.");
	        })
	        .always(function () {
	            hideBtnLoader("sendOtpButton");
	        });
	    }
	
	    /* ================= VERIFY OTP ================= */
	
	    function verifyOtp() {
	
	        clearError();
	        $("#otpError").text("");
	        $("#captchaError").text("");
	
	        if ($("#otp").val().trim() === "") {
	            $("#otpError").text("OTP is required");
	            return;
	        }
	
	        const captcha = $("#captcha").val().trim();
	
	        if (captcha === "") {
	            $("#captchaError").text("Captcha is required");
	            return;
	        }
	
	        if (!/^\d{4}$/.test(captcha)) {
	            $("#captchaError").text("Enter valid 4 digit captcha");
	            return;
	        }
	
	        showBtnLoader("verifyOtpButton");
	
	        $.post(
	        	"${pageContext.request.contextPath}/api/citizenuser/verifyOtp",
	            {
	                mobileNo: $("#mobileNo").val(),
	                otp: $("#otp").val(),
	                captcha: captcha
	            }
	        )
	        .done(function (res) {
	
	            if (res.success === false) {
	
	                refreshCaptcha();
	
	                if (res.message === "Invalid Captcha") {
	                    $("#captcha").val("");
	                    showError("Invalid Captcha");
	                    return;
	                }
	
	                $("#otp").val("");
	                showMessage("Invalid Mobile Number or OTP!", "error");
	                return;
	            }

	            else if (res.success === true) {

	                showMessage("Login Successful!", "success");

	                setTimeout(function () {
	    	            window.location.href = "home";
	                }, 1500);

	            }
	        })
	        .fail(function () {
	            showError("Server error. Please try again.");
	        })
	        .always(function () {
	            hideBtnLoader("verifyOtpButton");
	        });
	    }
	    function showMessage(message, type) {

	        $("#apiMessage")
	            .removeClass("success-msg error-msg")
	            .addClass(type === "success" ? "success-msg" : "error-msg")
	            .html(message)
	            .fadeIn();

	        setTimeout(function () {
	            $("#apiMessage").fadeOut();
	        }, 4000);
	    }
	    /* ================= CAPTCHA ================= */
	
	    function refreshCaptcha() {
	        $("#captchaImg").attr("src", "captcha?d=" + new Date().getTime());
	    }
	
	    /* ================= UX IMPROVEMENTS ================= */
	
	    $("#mobileNo").on("input", () => $("#mobileError").text(""));
	    $("#otp").on("input", () => $("#otpError").text(""));
	    $("#captcha").on("input", () => $("#captchaError").text(""));
	</script>


</body>

<style>
.fa-ul {
	margin-left: 1rem;
}
</style>

</html>