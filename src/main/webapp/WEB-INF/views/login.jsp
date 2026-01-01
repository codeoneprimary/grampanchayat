<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title><spring:message code="login.title" /></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

</head>
<body>

	<%@ include file="header.jsp"%>

	<div class="container my-4">
		<div class="row justify-content-center">
			<div class="col-lg-3 col-md-11 col-12">

				<div class="card shadow">

					<div class="card-body">Some Details</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-11 col-12">

				<div class="card shadow">

					<div class="card-body">

						<h4>
							<spring:message code="login.applicant_login_here" />
						</h4>
						<div class="row g-3">

							<div class="col-md-6 col-12">
								<div class="card-body">

									<div class="row g-3">
										<div class="col-md-11 col-12">
											<label class="form-label" for="mobileNo"><spring:message
													code="dob.application.mobile_no" /></label> <input type="text"
												name="mobileNo" id="mobileNo" class="form-control"
												maxlength="10" pattern="[0-9]{10}" required>

											<p id="mobileError" class="text-danger"></p>
										</div>
									</div>

									<div id="otpDiv" style="display: none;">

										<div class="row g-3">
											<div class="col-md-11 col-12">
												<label class="form-label"><spring:message
														code="login.enter_otp" /></label> <input type="text" name="otp"
													id="otp" class="form-control" maxlength="10"
													pattern="[0-9]{10}" required>

												<p id="otpError" class="text-danger"></p>
												<button type="button" id="resendOtpButton"
													class="btn btn-link p-0" style="display: none;"
													onclick="sendOtp()">
													<spring:message code="login.resend_otp" />
												</button>
												<span id="timer" class="text-danger ms-2"></span>
											</div>
										</div>

										<div class="row g-3">

											<label class="form-label"></label>
											<div class="col-md-5 col-12">
												<input type="text" id="captcha" class="form-control"
													placeholder="Enter Captcha" required />
											</div>

											<div class="col-md-6 col-12">
												<img src="captcha" id="captchaImg" /> <a href="#"
													onclick="refreshCaptcha()"><spring:message
														code="login.refresh" /></a>
											</div>

											<p id="captchaError" class="text-danger"></p>
										</div>

										<p id="errorMsg" class="text-danger mt-2"
											style="display: none;"></p>
										<div class="text-center mt-4" id="verifyOtpButton">
											<button type="button" class="btn btn-success mt-2"
												onclick="verifyOtp()">
												<spring:message code="login.verify_otp" />
											</button>
											<span class="spinner-border spinner-border-sm d-none"
												role="status" aria-hidden="true"></span>
										</div>
									</div>

									<!-- Buttons -->
									<div class="text-center mt-4" id="sendOtpButton">
										<a href="home">
											<button type="button" id="verifyBtn" class="btn btn-primary">
												<spring:message code="msg.back" />
											</button>
										</a>
										<button type="button" class="btn btn-success"
											onclick="sendOtp()">
											<spring:message code="msg.submit" />
										</button>
										<span class="spinner-border spinner-border-sm d-none"
											role="status" aria-hidden="true"></span>
									</div>

								</div>
							</div>

							<div class="col-md-6 col-12">
								<div class="card-body" style="border: 1px solid #ced4da;">

									<div class="row g-3">
										<div class="col-md-11 col-12">
											<h5>Instructions</h5>

											<ul class="fa-ul">
												<li><span class="fa-li"> <i
														class="fas fa-landmark text-success"></i>
												</span> Enter your registered Mobile</li>
												<li><span class="fa-li"> <i
														class="fas fa-landmark text-success"></i>
												</span>Click on Login button for get OTP</li>
												<li><span class="fa-li"> <i
														class="fas fa-landmark text-success"></i>
												</span> Enter OTP which is recived in mobile no</li>
												<li><span class="fa-li"> <i
														class="fas fa-landmark text-success"></i>
												</span>Enter the security text shown in the image</li>
												<li><span class="fa-li"> <i
														class="fas fa-landmark text-success"></i>
												</span> Click on verify otp button for login</li>
											</ul>

										</div>
									</div>



								</div>
							</div>
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
	            "/grampanchayat/api/citizenuser/sendOtp",
	            { mobileNo: mobile }
	        )
	        .done(function (res) {
	
	            if (res.message === "user not exist") {
	                window.location.href = "/grampanchayat/userRegistration";
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
	            "/grampanchayat/api/citizenuser/verifyOtp",
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
	                showError("Invalid OTP");
	                return;
	            }
	
	            window.location.href = "home";
	        })
	        .fail(function () {
	            showError("Server error. Please try again.");
	        })
	        .always(function () {
	            hideBtnLoader("verifyOtpButton");
	        });
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