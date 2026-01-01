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
	<!-- Quote Start -->
	<div class="container-fluid py-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-9">
					<div class="rounded p-5 p-sm-6 wow fadeInUp" data-wow-delay="0.1s"
						style="border: 1px solid gray;">


						<h4>Citizen Registration</h4>

						<div class="col-md-6">
							<label>Full Name</label> <input type="text" id="fullName"
								name="fullName" class="form-control" /> <label>Mobile
								Number</label> <input type="text" id="mobileNo" name="mobileNo"
								class="form-control" maxlength="10" /> <label>Email Id</label>
							<input type="text" id="email" name="email" class="form-control" />

							<button class="btn btn-primary mt-2" onclick="sendOtp()"
								id="userRegisterButton">Send OTP</button>

							<div id="otpDiv" style="display: none;">
								<label class="mt-3">Enter OTP</label> <input type="text"
									id="otp" class="form-control" />
								<button class="btn btn-success mt-2"
									onclick="verifyOtpRegister()">Verify OTP & Register</button>
							</div>

							<p id="otpError" class="text-danger"></p>
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
					window.location.href = "home";
				}else{

					$("#otp").val("");
		            $("#otpError").text("Invalid otp");
				}
		    });
		}

	</script>
</body>

</html>