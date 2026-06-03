<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<spring:message code="header.death_certificate_application" var="pageTitle" />

<c:set var="pageDescription"
value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<c:set var="pageKeywords"
value="Deulgaon Gada, Deulgaon Gada Gram Panchayat, Maharashtra village, Gram Panchayat services, property tax Deulgaon Gada, देऊळगाव गाडा, देऊळगाव गाडा ग्रामपंचायत" />
		
<link rel="icon" type="image/png" sizes="32x32"
      href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
      href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">
		

<style>
.card-header {
	background: #0d6efd;
	color: #fff;
	font-weight: 600;
	text-align: center;
}

.invalid-feedback {
	font-size: 13px;
}

label::after {
	content: " *";
	color: red;
}
</style>

</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="container my-4">
		<div class="card shadow">

			<div class="card-header">
				<spring:message code="header.death_certificate_application" />
			</div>

			<div class="card-body">
				<form id="deathForm" novalidate>

					<!-- Deceased Details -->
					<h6 class="text-primary">
						<spring:message code="death.application.deceased_details" />
					</h6>

					<div class="row g-3">
						<div class="col-md-4">
							<label for="deceasedName"> <spring:message
									code="death.application.name_of_deceased" />
							</label> <input type="text" class="form-control" id="deceasedName"
								name="deceasedName" required>
							<div class="invalid-feedback">
								<spring:message
									code="death.application.name_of_deceased_required" />
							</div>
						</div>

						<div class="col-md-3">
							<label for="aadharCardNo"> <spring:message
									code="death.application.aadhar_card_no" />
							</label> <input type="text" class="form-control" id="aadharCardNo"
								name="aadharCardNo" maxlength="12" pattern="[0-9]{12}">
						</div>

						<div class="col-md-3">
							<label for="gender"> <spring:message
									code="dob.application.gender" />
							</label> <select id="gender" name="gender" class="form-select" required>
								<option value=""><spring:message
										code="dob.application.select" /></option>
								<option value="Male"><spring:message
										code="dob.application.gender_male" /></option>
								<option value="Female"><spring:message
										code="dob.application.gender_female" /></option>
								<option value="Other"><spring:message
										code="dob.application.gender_other" /></option>
							</select>
							<div class="invalid-feedback">
								<spring:message code="dob.application.gender_required" />
							</div>
						</div>

						<div class="col-md-2">
							<label for="age"> <spring:message
									code="death.application.age" />
							</label> <input type="text" class="form-control" id="age" name="age"
								readonly>
						</div>

						<div class="col-md-3">
							<label for="dateOfBirth"> <spring:message
									code="dob.application.date_of_birth" />
							</label> <input type="date" class="form-control" id="dateOfBirth"
								name="dateOfBirth" onchange="calculateAge()" required>
						</div>

						<div class="col-md-3">
							<label for="dateOfDeath"> <spring:message
									code="death.application.date_of_death" />
							</label> <input type="date" class="form-control" id="dateOfDeath"
								name="dateOfDeath" max="<%=java.time.LocalDate.now()%>" onchange="calculateAge()" required>
							<div class="invalid-feedback">
								<spring:message code="death.application.date_of_death_required" />
							</div>
						</div>
						

						<div class="col-md-3">
							<label for="causeOfDeath"> <spring:message
									code="death.application.cause_of_death" />
							</label> <input type="text" class="form-control" id="causeOfDeath"
								name="causeOfDeath" required>
						</div>
						

						<div class="col-md-3">
							<label for="placeOfDeath"> <spring:message
									code="death.application.place_of_death" />
							</label> <input type="text" class="form-control" id="placeOfDeath"
								name="placeOfDeath" required>
						</div>
					</div>

					<hr class="my-4">

					<!-- Informant Details -->
					<h6 class="text-primary">
						<spring:message code="death.application.informant_details" />
					</h6>

					<div class="row g-3">

						<div class="col-md-4">
							<label for="informantName"><spring:message
									code="death.application.informant_name" /></label> <input
								class="form-control" name="informantName" id="informantName"
								required>
							<div class="invalid-feedback">
								<spring:message code="death.application.informant_name_required" />
							</div>
						</div>

						<div class="col-md-3">
							<label for="relation"><spring:message
									code="death.application.relation" /></label> <select
								class="form-select" name="relation" id="relation" required>
								<option value=""><spring:message
										code="dob.application.select" />
								</option>
								<option><spring:message
										code="death.application.select_father" />
								</option>
								<option><spring:message
										code="death.application.select_mother" />
								</option>
								<option><spring:message
										code="death.application.select_spouse" />
								</option>
								<option><spring:message
										code="death.application.select_son" />
								</option>
								<option><spring:message
										code="death.application.select_daughter" />
								</option>
								<option><spring:message
										code="death.application.select_other" />
								</option>
							</select>
							<div class="invalid-feedback">
								<spring:message code="death.application.relation_required" />
							</div>
						</div>

						<div class="col-md-3">
							<label for="mobileNo"><spring:message
									code="dob.application.mobile_no" /></label> <input
								class="form-control" name="mobileNo" id="mobileNo"
								maxlength="10" pattern="[0-9]{10}" required>
							<div class="invalid-feedback">
								<spring:message code="dob.application.mobile_no_required" />

							</div>
						</div>
					</div>
					<hr class="my-4">

					<!-- Address -->
					<h6 class="text-primary">
						<spring:message code="dob.application.address" />
					</h6>

					<div class="row g-3">
						<div class="col-3">
							<label class="form-label" for="address"> <spring:message
									code="dob.application.address_details" />
							</label>
							<textarea name="address" id="address" rows="3"
								class="form-control" required></textarea>
							<div class="invalid-feedback">
								<spring:message code="dob.application.address_required" />
							</div>
						</div>

						<div class="col-3">
							<label class="form-label" for="state"><spring:message
									code="dob.application.state" /> </label> <input type="text"
								name="state" id="state" class="form-control" required>
							<div class="invalid-feedback">
								<spring:message code="dob.application.state_required" />
							</div>
						</div>

						<div class="col-3">
							<label class="form-label" for="district"><spring:message
									code="dob.application.district" /> </label> <input type="text"
								name="district" id="district" class="form-control" required>
							<div class="invalid-feedback">
								<spring:message code="dob.application.district_required" />
							</div>
						</div>

						<div class="col-3">
							<label class="form-label" for="pincode"> <spring:message
									code="dob.application.pincode" />
							</label> <input type="text" name="pincode" id="pincode"
								class="form-control" pattern="[0-9]{6}" maxlength="6" required>
							<div class="invalid-feedback">
								<spring:message code="dob.application.pincode_required" />
							</div>
						</div>
					</div>


					<!-- Declaration -->
					<div class="form-check mt-4">
						<input class="form-check-input" type="checkbox" required>
						<label class="form-check-label"> <spring:message
								code="msg.knowledge" />
						</label>
					</div>

					<!-- Buttons -->
					<div class="text-center mt-4">
						<button type="button" id="verifyBtn" class="btn btn-primary">
							<spring:message code="dob.application.verify_btn" />
						</button>

						<button type="button" id="finalSubmitBtn"
							class="btn btn-success d-none" disabled>
							<span class="spinner-border spinner-border-sm"></span>
							Submitting...
						</button>
					</div>

				</form>
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
    const form = document.getElementById("deathForm");
    const verifyBtn = document.getElementById("verifyBtn");
    const finalBtn = document.getElementById("finalSubmitBtn");
    const verifyBody = document.getElementById("verifyBody");
    const confirmBtn = document.getElementById("confirmBtn");

    let finalData = {};

    // Auto calculate age
function calculateAge() {
    var dob = document.getElementById("dateOfBirth").value;
    var dod = document.getElementById("dateOfDeath").value;

    if (!dob) return;

    var birthDate = new Date(dob);
    var endDate = dod ? new Date(dod) : new Date();

    var age = endDate.getFullYear() - birthDate.getFullYear();
    var m = endDate.getMonth() - birthDate.getMonth();

    if (m < 0 || (m === 0 && endDate.getDate() < birthDate.getDate())) {
        age--;
    }

    document.getElementById("age").value = age ;
}

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

    // Confirm & Submit
    confirmBtn.onclick = () => {

        finalBtn.classList.remove("d-none");
        finalBtn.disabled = false;

        fetch("<%=request.getContextPath()%>/api/death/apply", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(finalData)
        })
        .then(res => res.json())
        .then(data => {
            window.location.href =
                "<%=request.getContextPath()%>/acknowledgmentDeathCertificateApplication?applicationId="
                + data.data;
        })
        .catch(() => alert("Something went wrong. Please try again."));
    };
</script>


</body>
</html>
