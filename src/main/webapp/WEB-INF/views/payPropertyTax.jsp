<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title><spring:message code="propertyType.pay_property_tax" /></title>
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="page-bg"></div>

	<div class="container my-5">

		<!-- 🏠 Property Info -->
		<div class="card shadow mb-4">
			<div class="card-header bg-primary text-white">
				🏠
				<spring:message code="propertyType.property_details" />
			</div>

			<div class="card-body">

				<div class="row">
					<div class="col-md-4">
						<b><spring:message code="propertyType.owner" />:</b>
						${property.ownerName}
					</div>
					<div class="col-md-4">
						<b><spring:message code="propertyType.mobile" />:</b>
						${property.mobile}
					</div>
					<div class="col-md-4">
						<b><spring:message code="propertyType.property_no" />:</b>
						${property.propertyNo}
					</div>

					<div class="col-md-4">
						<b><spring:message code="propertyType.area" />:</b>
						${property.area}
					</div>
					<div class="col-md-4">
						<b><spring:message code="propertyType.type" />:</b>
						${property.propertyType}
					</div>
					<div class="col-md-4">
						<b><spring:message code="propertyType.ward_no" /> :</b>
						${property.wardNo}
					</div>

					<div class="col-md-12 mt-2">
						<b><spring:message code="propertyType.address" /> :</b>
						${property.address}
					</div>
				</div>

			</div>
		</div>

		<!-- 📊 Tax Table -->

		<div class="card-body">

			<div class="container mt-5">

				<div class="card shadow">
					<div class="card-header bg-success text-white">
						💰
						<spring:message code="propertyType.pay_property_tax" />
					</div>

					<div class="card-body">

						<p>
							<b><spring:message code="propertyType.owner" /> : </b>
							${property.ownerName}
						</p>
						<p>
							<b><spring:message code="propertyType.property_no" /> : </b>
							${property.propertyNo}
						</p>

						<div id="balanceBox" class="alert alert-danger text-center mb-4">
							<spring:message code="propertyType.total_pending" />
							: ₹ <span id="balanceAmount">${taxSummaryDto.balanceAmount}</span>
						</div>
						<div id="messageBox"></div>
						<div class="col-lg-12 col-md-11 col-12">

							<!-- Message Box -->
							<div id="messageBox"></div>

							<form id="paymentForm">

								<input type="hidden" name="propertyId" value="${property.id}" />

								<div class="row align-items-end g-3">

									<!-- Back Button -->
									<div class="col-md-3">
										<a
											href="${pageContext.request.contextPath}/propertyTaxDetails/
											${property.id}"
											class="btn btn-secondary"> ⬅ <spring:message
												code="propertyType.back_to_list" />
										</a>
									</div>

									<!-- Payment Section -->
									<div id="paymentSection" class="col-md-9">
										<div class="row g-3">

											<!-- Amount -->
											<div class="col-md-4">
												<label class="form-label fw-semibold"> <spring:message
														code="propertyType.enter_amount" /><span class="required">*</span>
												</label> <input type="text" name="amount" id="amount"
													class="form-control form-control-lg"
													placeholder="<spring:message
														code='propertyType.valid_amount' />"
													oninput="validatePayment(this)" required /><small
													id="amountError" class="text-danger"></small>
											</div>
											<div class="col-md-4">
												<label class="form-label fw-semibold"><spring:message
														code="propertyType.payment_mode" /> <span
													class="required">*</span></label> <select id="paymentMode"
													name="paymentMode" class="form-select form-select-lg"
													required>
													<option value=""><spring:message
															code="propertyType.select_payment_mode" /></option>
													<option value="ONLINE"><spring:message
															code="propertyType.payment_mode_online" /></option>
													<option value="CASH"><spring:message
															code="propertyType.payment_cash" /></option>
													<option value="OTHER"><spring:message
															code="propertyType.payment_other" /></option>
												</select> <small id="paymentModeError" class="text-danger"></small>
											</div>

											<!-- Pay Button -->
											<div class="col-md-2 d-grid">
												<label>.</label>
												<button class="btn btn-success w-100 ">
													💳
													<spring:message code="propertyType.pay_now" />
												</button>
											</div>
										</div>
									</div>

								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>

	<%@ include file="footer.jsp"%>
	<script>
		$(document)
				.ready(
						function() {

							let text = $("#balanceAmount").text();

							// Remove ₹ and commas if present
							let balance = parseFloat(text.replace(/[₹,]/g, ''));

							if (balance === 0) {

								// Change alert to success
								$("#balanceBox")
										.removeClass("alert-danger")
										.addClass("alert-success")
										.html(
												"✅ <spring:message code='propertyType.no_pending_tax' />");

								// Hide payment section
								$("#paymentSection").hide();
							}
						});
		function validatePayment(input) {
			let max = parseFloat(document.getElementById("balanceAmount").innerText);
			let val = parseFloat(input.value);
			input.value = input.value.replace(/[^0-9.]/g, '');

			// Prevent multiple dots
			if ((input.value.match(/\./g) || []).length > 1) {
				input.value = input.value.substring(0, input.value.length - 1);
			}
			if (val > max) {
				alert("Amount cannot exceed balance: ₹ " + max);
				input.value = max;
			}
		}
		$("#paymentForm")
				.submit(
						function(e) {

							let amount = parseFloat($("#amount").val());
							let paymentMode = $("#paymentMode").val();
							if (!amount || amount <= 0) {
								$("#amountError")
										.text(
												"<spring:message code='propertyType.valid_amount' />");
								$("#amount").text("");
								return false; // stops form submit
							}

							if (!paymentMode) {
								$("#paymentModeError")
										.text(
												"<spring:message code='propertyType.select_payment_mode' />");
								return false; // stops form submit
							} else {
								$("#paymentModeError").text("");
							}

							let balance = parseFloat($("#balanceAmount").text());

							if (amount > balance) {
								showMessage("danger",
										"<spring:message code='propertyType.amount_exceed' />");
								return;
							}

							e.preventDefault();
							$
									.ajax({
										url : "${pageContext.request.contextPath}/submitPropertyTaxPayment",
										type : "POST",
										data : $(this).serialize(),
										success : function(res) {
											showMessage("success", res.message);

											let newBalance = parseFloat(res.newBalance);
											// Update balance UI
											$("#balanceAmount").text(
													res.newBalance);

											// Reset input
											$("#amount").val("");
											if (newBalance === 0) {

												// Change alert color (danger → success)
												$("#balanceBox")
														.removeClass(
																"alert-danger")
														.addClass(
																"alert-success");

												// Optional: change text
												$("#balanceBox")
														.html(
																"✅ <spring:message code='propertyType.no_pending_tax' />");

												// Hide payment section
												$("#paymentSection").hide();
											}

										},
										error : function(xhr) {
											let msg = xhr.responseJSON ? xhr.responseJSON.message
													: "Payment failed!";
											showMessage("danger", msg);
										}
									});
						});

		function showMessage(type, msg) {
			$("#messageBox").html(
					'<div class="alert alert-' + type + ' text-center">' + msg
							+ '</div>');
			setTimeout(function() {
				$("#messageBox").fadeOut(500); // smooth fade
			}, 3000);
		}
	</script>
</body>
</html>
