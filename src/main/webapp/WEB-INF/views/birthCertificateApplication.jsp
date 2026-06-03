<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="mr">

<head>
<meta charset="UTF-8">
<spring:message code="header.birth_certificate_application" var="pageTitle" />

<c:set var="pageDescription"
value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<c:set var="pageKeywords"
value="Deulgaon Gada, Deulgaon Gada Gram Panchayat, Maharashtra village, Gram Panchayat services, property tax Deulgaon Gada, देऊळगाव गाडा, देऊळगाव गाडा ग्रामपंचायत" />
		
<link rel="icon" type="image/png" sizes="32x32"
      href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
      href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">
		
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.card-header {
	color: #fff;
	text-align: center;
	font-weight: 600;
	font-size: 18px;
}
</style>

</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="page-bg"></div>

	<div class="container my-4">
		<div class="row justify-content-center">
			<div class="col-lg-12 col-md-11 col-12">

				<div class="card shadow">
					<div class="card-header">
						<spring:message code="header.birth_certificate_application" />
					</div>

					<div class="card-body">
						<form id="birthForm" novalidate>

							<!-- Child Details -->
							<h6 class="text-primary mb-3">
								<spring:message code="dob.application.child_details" />
							</h6>

							<div class="row g-3">
								<div class="col-md-6 col-12">
									<label for="childName" class="form-label"> <spring:message
											code="dob.application.child_name" />
									</label> <input type="text" id="childName" name="childName"
										class="form-control" required>
									<div class="invalid-feedback">
										<spring:message code="dob.application.child_name_required" />
									</div>
								</div>

								<div class="col-md-3 col-12">
									<label for="gender" class="form-label"> <spring:message
											code="dob.application.gender" />
									</label> <select id="gender" name="gender" class="form-select" required>
										<option value="">
											<spring:message code="dob.application.select" />
										</option>
										<option value="Male">
											<spring:message code="dob.application.gender_male" />
										</option>
										<option value="Female">
											<spring:message code="dob.application.gender_female" />
										</option>
										<option value="Other">
											<spring:message code="dob.application.gender_other" />
										</option>
									</select>
									<div class="invalid-feedback">
										<spring:message code="dob.application.gender_required" />
									</div>
								</div>

								<div class="col-md-3 col-12">
									<label for="dateOfBirth" class="form-label"> <spring:message
											code="dob.application.date_of_birth" />
									</label> <input type="date" id="dateOfBirth" name="dateOfBirth"
										class="form-control" required>
									<div class="invalid-feedback">
										<spring:message code="dob.application.date_of_birth_required" />
									</div>
								</div>

								<div class="col-md-6 col-12">
									<label for="placeOfBirth" class="form-label"> <spring:message
											code="dob.application.place_of_birth" />
									</label> <input type="text" id="placeOfBirth" name="placeOfBirth"
										class="form-control" required>
									<div class="invalid-feedback">
										<spring:message code="dob.application.place_of_birth_required" />
									</div>
								</div>

								<div class="col-md-6 col-12">
									<label for="hospitalName" class="form-label"> <spring:message
											code="dob.application.hospital_name" />
									</label> <input type="text" id="hospitalName" name="hospitalName"
										class="form-control" required>
									<div class="invalid-feedback">
										<spring:message code="dob.application.hospital_required" />
									</div>
								</div>
							</div>

							<hr class="my-4">

							<!-- Parent Details -->
							<h6 class="text-primary mb-3">
								<spring:message code="dob.application.parent_details" />
							</h6>

							<div class="row g-3">
								<div class="col-md-6 col-12">
									<label for="fatherName" class="form-label"> <spring:message
											code="dob.application.father_name" />
									</label> <input type="text" id="fatherName" name="fatherName"
										class="form-control" required>
									<div class="invalid-feedback">
										<spring:message code="dob.application.father_name_required" />
									</div>
								</div>

								<div class="col-md-6 col-12">
									<label for="motherName" class="form-label"> <spring:message
											code="dob.application.mother_name" />
									</label> <input type="text" id="motherName" name="motherName"
										class="form-control" required>
									<div class="invalid-feedback">
										<spring:message code="dob.application.mother_name_required" />
									</div>
								</div>

								<div class="col-md-6 col-12">
									<label for="mobileNo" class="form-label"> <spring:message
											code="dob.application.mobile_no" />
									</label> <input type="text" id="mobileNo" name="mobileNo"
										class="form-control" maxlength="10" pattern="[0-9]{10}"
										required>
									<div class="invalid-feedback">
										<spring:message code="dob.application.mobile_no_required" />
									</div>
								</div>

								<div class="col-md-6 col-12">
									<label for="email" class="form-label"> <spring:message
											code="dob.application.email" />
									</label> <input type="email" id="email" name="email"
										class="form-control" required>
									<div class="invalid-feedback">
										<spring:message code="dob.application.email_required" />
									</div>
								</div>
							</div>

							<hr class="my-4">

							<!-- Address -->
							<h6 class="text-primary mb-3">
								<spring:message code="dob.application.address" />
							</h6>

							<div class="row g-3">
								<div class="col-12">
									<label for="address" class="form-label"> <spring:message
											code="dob.application.address_details" />
									</label>
									<textarea id="address" name="address" rows="3"
										class="form-control" required></textarea>
									<div class="invalid-feedback">
										<spring:message code="dob.application.address_required" />
									</div>
								</div>

								<div class="col-md-4 col-12">
									<label for="state" class="form-label"> <spring:message
											code="dob.application.state" />
									</label> <input type="text" id="state" name="state"
										class="form-control" required>
								</div>

								<div class="col-md-4 col-12">
									<label for="district" class="form-label"> <spring:message
											code="dob.application.district" />
									</label> <input type="text" id="district" name="district"
										class="form-control" required>
								</div>

								<div class="col-md-4 col-12">
									<label for="pincode" class="form-label"> <spring:message
											code="dob.application.pincode" />
									</label> <input type="text" id="pincode" name="pincode"
										class="form-control" maxlength="6" pattern="[0-9]{6}" required>
								</div>
							</div>

							<!-- Declaration -->
							<div class="form-check mt-4">
								<input class="form-check-input" type="checkbox" required>
								<label class="form-check-label"><spring:message
										code="msg.knowledge" /></label>
							</div>
							<!-- Buttons -->
							<div class="text-center mt-4">
								<button type="button" id="verifyBtn" class="btn btn-primary">
									<spring:message code="dob.application.verify_btn" />
								</button>
								<button type="button" id="finalSubmitBtn"
									class="btn btn-success d-none">
									<spring:message code="msg.submit" />
								</button>
							</div>

						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- VERIFY MODAL -->
	<div class="modal fade" id="verifyModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-header bg-primary text-white">
					<h5 class="modal-title">
						<spring:message code="dob.application.verify_details" />
					</h5>
					<button class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body">
					<table class="table table-bordered">
						<tbody id="verifyBody"></tbody>
					</table>
				</div>

				<div class="modal-footer">
					<button class="btn btn-secondary" data-bs-dismiss="modal">
						<spring:message code="dob.application.edit_btn" />
					</button>
					<button class="btn btn-success" id="confirmBtn">
						<spring:message code="dob.application.confirm_btn" />
					</button>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>


	<script>
    const form = document.getElementById("birthForm");
    const verifyBtn = document.getElementById("verifyBtn");
    const finalBtn = document.getElementById("finalSubmitBtn");
    const verifyBody = document.getElementById("verifyBody");
    const confirmBtn = document.getElementById("confirmBtn");

    let finalData = {};

    // Verify button
    verifyBtn.onclick = () => {
        if (!form.checkValidity()) {
            form.classList.add("was-validated");
            return;
        }

        finalData = {};
        new FormData(form).forEach((v, k) => finalData[k] = v);

	    verifyBody.innerHTML = "";
	    const elements = form.querySelectorAll("input, select, textarea");
	    elements.forEach(el => {
	        if (!el.name || el.type === "hidden") return;

	        const labelEl = form.querySelector("label[for='" + el.id + "']");
	        const label = labelEl ? labelEl.innerText.trim() : el.name;

	        const value = el.tagName === "SELECT"
	            ? el.options[el.selectedIndex].text
	            : el.value;

	        verifyBody.innerHTML +=
	            "<tr>" +
	                "<th>" + label + "</th>" +
	                "<td>" + (value ? value : "-") + "</td>" +
	            "</tr>";
	    });

        new bootstrap.Modal(document.getElementById("verifyModal")).show();
    };

    // Confirm submit
    confirmBtn.onclick = () => {
        bootstrap.Modal.getInstance(
            document.getElementById("verifyModal")).hide();

        verifyBtn.classList.add("d-none");
        finalBtn.classList.remove("d-none");

        fetch("<%=request.getContextPath()%>/api/dob/apply", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(finalData)
        })
        .then(res => res.json())
        .then(data => {
            window.location.href =
                "<%=request.getContextPath()%>/acknowledgmentBirthCertificateApplication?applicationId="
                + data.data;
        })
        .catch(() => alert("Something went wrong. Please try again."));
    };
</script>

</body>
</html>
