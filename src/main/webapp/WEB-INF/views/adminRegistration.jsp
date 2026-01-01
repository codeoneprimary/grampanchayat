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
	<div class="page-bg"></div>
	<div class="container my-4">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-11 col-12">

				<div class="card shadow">
					<div class="card-header">
						<spring:message code="header.adminRegistration" />
					</div>

					<div class="card-body">
						<form id="addAdmin" action="add-admin" method="post" novalidate>

							<div class="row g-3">
								<div class="col-md-6 col-12">
									<label class="form-label" for="username"><spring:message
											code="admin_registration.user_name" /></label> <input type="text"
										name="username" id="username" class="form-control" required>
									<div class="invalid-feedback">
										<spring:message code="dob.application.child_name_required" />
									</div>
								</div>

								<div class="col-md-6 col-12">
									<label class="form-label" for="fullName"><spring:message
											code="admin_registration.full_name" /> </label> <input type="text"
										name="fullName" id="fullName" class="form-control" required>
									<div class="invalid-feedback">
										<spring:message code="dob.application.child_name_required" />
									</div>
								</div>


								<div class="col-md-6 col-12">
									<label class="form-label" for="mobileNo"><spring:message
											code="admin_registration.mobile_no" /> </label> <input type="text"
										name="mobileNo" id="mobileNo" class="form-control"
										maxlength="10" pattern="[0-9]{10}" required>
									<div class="invalid-feedback">
										<spring:message code="dob.application.mobile_no_required" />
									</div>
								</div>


								<div class="col-md-6 col-12">
									<label class="form-label" for="email"><spring:message
											code="admin_registration.email_id" /> </label> <input type="text"
										name="email" id="email" class="form-control" required>
									<div class="invalid-feedback">
										<spring:message code="dob.application.hospital_required" />
									</div>
								</div>
							</div>

							<!-- Buttons -->
							<div class="text-center mt-4">
								<a href="home">
									<button type="button" id="verifyBtn" class="btn btn-primary">
										<spring:message code="msg.back" />
									</button>
								</a>
								<button type="button" id="finalSubmitBtn"
									class="btn btn-success" onclick="adminRegister()">
									<spring:message code="msg.submit" />
								</button>
							</div>

						</form>
					</div>
				</div>

			</div>
		</div>
	</div>


	<%@ include file="footer.jsp"%>

	<script>
	
	function adminRegister() {

	    finalData = {};
	    finalData["username"] = $("#username").val();
	    finalData["mobileNo"] = $("#mobileNo").val();
	    finalData["fullName"] = $("#fullName").val();
	    finalData["email"] = $("#email").val();
	    debugger;
	    fetch("<%=request.getContextPath()%>/api/admin/addAdmin", {
	        method: "POST",
	        headers: {"Content-Type": "application/json"},
	        body: JSON.stringify(finalData)
	    })
	    .then(res => res.json())
	    .then(data => {
			 
	    	console.log("done");
	    });
	}
		
	</script>
</body>
</html>
