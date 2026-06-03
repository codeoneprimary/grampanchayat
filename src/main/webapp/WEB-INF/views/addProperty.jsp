<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<spring:message code="propertyType.add_property" var="pageTitle" />

<c:set var="pageDescription"
	value="Official website of Deulgaon Gada Gram Panchayat, Maharashtra. Access property tax, certificates, schemes, and village information. देऊळगाव गाडा ग्रामपंचायत सेवा व माहिती." />

<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/img/titleIcon.jpg">

<!-- Bootstrap (if not added) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.form-section {
	background: #f8f9fa;
	border-radius: 10px;
	padding: 20px;
}

.card-header {
	font-size: 20px;
	font-weight: 600;
}

.form-control:focus, .form-select:focus {
	border-color: #0d6efd;
	box-shadow: 0 0 5px rgba(13, 110, 253, 0.3);
}

.required {
	color: red;
}

@media ( min-width : 768px) {
	.position-md-absolute {
		position: absolute !important;
	}
	.end-md-0 {
		right: 0 !important;
	}
}
</style>
</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="page-bg"></div>

	<div class="container my-4">
		<div class="row justify-content-center">
			<div class="col-lg-12 col-md-11 col-12">

				<div class="card shadow-lg border-0 rounded-3">

					<!-- Header -->
					<div
						class="card-header bg-primary text-white position-relative d-flex flex-column flex-md-row align-items-center">

						<!-- Center Title -->
						<div class="fw-bold text-center w-100">
							🏠
							<spring:message code="propertyType.add_property" />
						</div>

						<!-- Right Button -->
						<a href="${pageContext.request.contextPath}/uploadProperty"
							class="btn btn-warning btn-sm text-dark mt-2 mt-md-0 position-md-absolute end-md-0 me-md-3">
							⬆️ <spring:message code="propertyType.upload_property_by_csv" />
						</a>

					</div>

					<div class="card-body">
						<!-- ✅ Success Message -->
						<div id="messageBox"></div>
						<form id="saveProperty"
							action="${pageContext.request.contextPath}/saveProperty"
							method="post">

							<div class="form-section">

								<div class="row g-4">

									<!-- Owner Name -->
									<div class="col-md-6">
										<label class="form-label"><spring:message
												code="propertyType.owner" /> <span class="required">*</span></label>
										<input type="text" id="ownerName" name="ownerName"
											class="form-control"
											placeholder="<spring:message code='propertyType.enter_owner_name' />"
											required> <small id="ownerNameError"
											class="text-danger"></small>
									</div>

									<!-- Mobile -->
									<div class="col-md-3">
										<label class="form-label"><spring:message
												code="propertyType.mobile" /> <span class="required">*</span></label>
										<input type="text" id="mobile" name="mobile"
											class="form-control" maxlength="10" pattern="[0-9]{10}"
											placeholder="<spring:message code='propertyType.enter_mobile' />"
											required> <small id="mobileError" class="text-danger"></small>
									</div>

									<!-- Property No -->
									<div class="col-md-3">
										<label class="form-label"><spring:message
												code="propertyType.property_no" /> <span class="required">*</span>
										</label> <input type="text" id="propertyNo" name="propertyNo"
											class="form-control" required
											placeholder="<spring:message code='propertyType.enter_property_no' />">

										<small id="propertyNoError" class="text-danger"></small>
									</div>
									<!-- Property Type -->
									<div class="col-md-3">
										<label class="form-label"><spring:message
												code="propertyType.type" /> <span class="required">*</span></label>
										<select id="propertyType" name="propertyType"
											class="form-select" required>
											<option value="">--
												<spring:message code="propertyType.select_property" /> --
											</option>
											<c:forEach var="t" items="${types}">
												<option value="${t.propertyType}">${t.propertyType}</option>
											</c:forEach>
										</select> <small id="propertyTypeError" class="text-danger"></small>
									</div>


									<!-- Area -->
									<div class="col-md-3">
										<label class="form-label"><spring:message
												code="propertyType.area" />(sq.ft) <span class="required">*</span></label>
										<input type="text" id="area" name="area" class="form-control"
											placeholder="<spring:message code='propertyType.enter_area' />"
											required> <small id="areaError" class="text-danger"></small>
									</div>
									<!-- Ward No -->
									<div class="col-md-3">
										<label class="form-label"><spring:message
												code="propertyType.ward_no" /> <span class="required">*</span></label>
										<input type="text" id="wardNo" name="wardNo"
											class="form-control" pattern="[0-9]*" inputmode="numeric"
											placeholder="<spring:message code='propertyType.enter_ward_no' />"
											required
											onkeypress="return event.charCode >= 48 && event.charCode <= 57"
											oninput="this.value = this.value.replace(/[^0-9]/g, '')">
										<small id="wardNoError" class="text-danger"></small>
									</div>

									<!-- Address -->
									<div class="col-md-6">
										<label class="form-label"><spring:message
												code="propertyType.address" /> <span class="required">*</span></label>
										<textarea id="address" name="address" rows="2"
											class="form-control"
											placeholder="<spring:message code='propertyType.enter_address' />"
											required></textarea>
										<small id="addressError" class="text-danger"></small>
									</div>

								</div>

							</div>

							<!-- Buttons -->
							<div class="d-flex flex-wrap justify-content-center gap-2 mt-4">

								<button type="button" class="btn btn-danger px-4"
									onclick="window.location.href='${pageContext.request.contextPath}/propertyList'">
									⬅ Back</button>

								<button type="submit" id="submitBtn"
									class="btn btn-success px-4">
									💾
									<spring:message code="propertyType.save_property" />
								</button>

								<button type="reset" class="btn btn-secondary px-4">
									🔄
									<spring:message code="propertyType.reset" />
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

const contextPath = "${pageContext.request.contextPath}";

// ===== Elements =====
const form = document.getElementById("saveProperty");
const submitBtn = document.getElementById("submitBtn");

const ownerName = document.getElementById("ownerName");
const mobile = document.getElementById("mobile");
const propertyNo = document.getElementById("propertyNo");
const propertyType = document.getElementById("propertyType");
const area = document.getElementById("area");
const wardNo = document.getElementById("wardNo");
const address = document.getElementById("address");

// ===== Flags =====
let isPropertyNoValid = false;

// ===== Toast =====
function showMessage(msg, type = "success") {
    let toastId = type === "success" ? "successToast" : "errorToast";
    let msgId = type === "success" ? "successMsg" : "errorMsg";

    document.getElementById(msgId).innerText = msg;

    let toast = new bootstrap.Toast(document.getElementById(toastId));
    toast.show();

    // auto hide after 3 sec
    setTimeout(() => toast.hide(), 3000);
}

// ===== Input Border =====
function setValid(el) {
    el.classList.remove("is-invalid");
    el.classList.add("is-valid");
}
function setInvalid(el) {
    el.classList.remove("is-valid");
    el.classList.add("is-invalid");
}

// ===== Form Check =====
function checkFormValidity() {

    let isValid = true;

    if (ownerName.value.trim().length < 3) isValid = false;
    if (!/^[0-9]{10}$/.test(mobile.value)) isValid = false;
    if (!propertyType.value) isValid = false;
    if (!/^[0-9]+$/.test(wardNo.value)) isValid = false;
    if (!address.value.trim()) isValid = false;
    if (!isPropertyNoValid) isValid = false;
    if (area.value && isNaN(area.value)) isValid = false;

    submitBtn.disabled = !isValid;
}


// ===== Owner =====
ownerName.oninput = function () {
    if (this.value.trim().length >= 3) {
        setValid(this);
    } else {
        setInvalid(this);
    }
    checkFormValidity();
};


// ===== Mobile =====
mobile.oninput = function () {
    if (/^[0-9]{10}$/.test(this.value)) {
        setValid(this);
    } else {
        setInvalid(this);
    }
    checkFormValidity();
};


// ===== Property No =====
propertyNo.oninput = function () {

    let val = this.value.trim();

    if (!val) {
        setInvalid(this);
        isPropertyNoValid = false;
        return;
    }

    if (!/^[a-zA-Z0-9]+$/.test(val)) {
        setInvalid(this);
    	document.getElementById("propertyNoError").innerHTML ="<spring:message code='propertyType.property_no_validation1' />";
        isPropertyNoValid = false;
        return;
    }

    if (val.length < 2) {
        setInvalid(this);
    	document.getElementById("propertyNoError").innerHTML ="<spring:message code='propertyType.property_no_validation2' />";
        isPropertyNoValid = false;
        return;
    }

    // AJAX check
    isPropertyNoValid = false;
    document.getElementById("propertyNoError").innerHTML ="";
    fetch(contextPath + "/checkPropertyNo?propertyNo=" + val)
        .then(res => res.json())
        .then(data => {

            if (data.exists) {
            	document.getElementById("propertyNoError").innerHTML ="<spring:message code='propertyType.property_no_validation3' />";
                setInvalid(propertyNo);
                //showMessage("Property number already exists", "error");
                isPropertyNoValid = false;
            } else {
                setValid(propertyNo);
            	document.getElementById("propertyNoError").innerHTML ="<spring:message code='propertyType.property_no_validation4' />";
                //showMessage("Property number available", "success");
                isPropertyNoValid = true;
            }

            checkFormValidity();
        });
};


// ===== Area =====
area.oninput = function () {
    if (!this.value || !isNaN(this.value)) {
        setValid(this);
    } else {
        setInvalid(this);
        showMessage("Invalid area", "error");
    }
    checkFormValidity();
};


// ===== Property Type =====
propertyType.onchange = function () {
    if (this.value) {
        setValid(this);
    } else {
        setInvalid(this);
    }
    checkFormValidity();
};


// ===== Ward =====
wardNo.oninput = function () {
    if (/^[0-9]+$/.test(this.value)) {
        setValid(this);
    } else {
        setInvalid(this);
        showMessage("Invalid ward number", "error");
    }
    checkFormValidity();
};


// ===== Address =====
address.oninput = function () {
    if (this.value.trim()) {
        setValid(this);
    } else {
        setInvalid(this);
    }
    checkFormValidity();
};


// ===== SUBMIT (AJAX SAVE) =====
submitBtn.addEventListener("click", function () {

    if (submitBtn.disabled) {
        showMessage("Please fix all errors", "error");
        return;
    }

    submitBtn.disabled = true;
    submitBtn.innerText = "Saving...";

    let formData = new FormData(form);

    fetch(contextPath + "/saveProperty", {
        method: "POST",
        body: formData
    })
    .then(res => res.json())
    .then(data => {

        if (data.status === "success") {

            showMessage(data.message, "success");

            setTimeout(() => {
                window.location.href = contextPath + "/propertyList";
            }, 2000);

        } else {
            showMessage(data.message, "error");
            submitBtn.disabled = false;
            submitBtn.innerText = "Save";
        }

    })
    .catch(() => {
        showMessage("Server error", "error");
        submitBtn.disabled = false;
        submitBtn.innerText = "Save";
    });

});


function showMessage(msg, type) {

    let box = document.getElementById("messageBox");

    let alertClass = type === "success" ? "alert-success" : "alert-danger";

    box.innerHTML =
        '<div class="alert ' + alertClass + ' text-center">' +
            msg +
        '</div>';

    // Auto remove after 3 sec
    setTimeout(() => {
        box.innerHTML = "";
    }, 4000);
}


// ===== INIT =====
window.onload = checkFormValidity;

</script>
</body>
</html>
