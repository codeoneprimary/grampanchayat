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

<c:set var="pageKeywords"
	value="Deulgaon Gada, Deulgaon Gada Gram Panchayat, Maharashtra village, Gram Panchayat services, property tax Deulgaon Gada, देऊळगाव गाडा, देऊळगाव गाडा ग्रामपंचायत" />

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
					<div class="card-header bg-success text-white text-center">
						✏️ Edit Property Details</div>

					<div class="card-body">
						<div id="messageBox"></div>
						<form action="/updatePropertyTax" method="post">

							<input type="hidden" name="id" value="${tax.id}" />

							<div class="mb-2">
								Current Tax: <input type="number" name="totalTax"
									value="${propertyTax.currentTax}" class="form-control" />
							</div>

							<div class="mb-2">
								Pending Tax: <input type="number" name="pendingTax"
									value="${propertyTax.pendingTax}" class="form-control" />
							</div>

							<div class="mb-2">
								Penalty: <input type="number" name="penalty"
									value="${propertyTax.penalty}" class="form-control" />
							</div>

							<button class="btn btn-success">Update</button>
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
let isPropertyNoValid = true;

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
