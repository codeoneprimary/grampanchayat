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
	<!-- Quote Start -->
	<div class="container-fluid py-5">
		<div class="container">

			<%@ include file="header.jsp"%>
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="bg-light rounded p-4 p-sm-5 wow fadeInUp"
						data-wow-delay="0.1s">
						<div class="row g-3">
							<div class="col-sm-6">
								<div class="form-floating">
									<input type="text" class="form-control border-0" id="gname"
										placeholder="Gurdian Name"> <label for="gname">Your
										Name</label>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-floating">
									<input type="email" class="form-control border-0" id="gmail"
										placeholder="Gurdian Email"> <label for="gmail">Your
										Email</label>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-floating">
									<input type="text" class="form-control border-0" id="cname"
										placeholder="Child Name"> <label for="cname">Your
										Mobile*</label>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-floating">
									<input type="date" class="form-control border-0 date-input"
										id="dob" placeholder="Child Name"> <label for="cname">
										Select DOB*</label>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-floating">
									<input type="email" class="form-control border-0" id="gmail"
										placeholder="Gurdian Email"> <label for="gmail">password</label>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-floating">
									<input type="text" class="form-control border-0" id="cname"
										placeholder="Child Name"> <label for="cname">conform
										password*</label>
								</div>
							</div>
							<div class="col-12 text-center">
								<button class="btn btn-primary py-2 px-2" type="submit">Submit
									Now</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Quote End -->


	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>

	<%@ include file="footer.jsp"%>
</body>
</html>