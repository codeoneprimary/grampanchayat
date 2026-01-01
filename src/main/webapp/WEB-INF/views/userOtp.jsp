<!DOCTYPE html>
<html lang="en">
<body>
	<!-- Quote Start -->
	<div class="container-fluid py-5">
		<div class="container">
			<%@ include file="outsideHeader.jsp"%>
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="bg-light rounded p-4 p-sm-5 wow fadeInUp"
						data-wow-delay="0.1s">
						<div class="row g-3 text-center">
							<div class="col-sm-1"></div>
							<div class="col-sm-10">
								<div class="form-floating">
									<input type="text" class="form-control border-0" id="gname"
										placeholder="Gurdian Name"> <label for="gname">OTP</label>
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
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/wow/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/easing/easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/counterup/counterup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/parallax/parallax.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/isotope/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>