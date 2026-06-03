<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="mr">

<head>
<meta charset="UTF-8">
<spring:message code="complaintForm.header" var="pageTitle" />

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
body {
	background-color: #f4f6f9;
}

.card {
	transition: 0.3s ease;
}

.card:hover {
	transform: translateY(-5px);
}

.form-control, .form-select {
	border-radius: 10px;
}

.form-control:focus, .form-select:focus {
	border-color: #198754;
	box-shadow: 0 0 6px rgba(25, 135, 84, 0.3);
}

.btn-success {
	transition: 0.3s;
}

.btn-success:hover {
	transform: scale(1.05);
}

textarea {
	resize: none;
}

.upload-box {
	border: 2px dashed #ced4da;
	border-radius: 12px;
	padding: 25px;
	text-align: center;
	cursor: pointer;
	transition: 0.3s;
	background: #f8f9fa;
}

.upload-box:hover {
	border-color: #0d6efd;
	background: #eef5ff;
}

.upload-icon {
	font-size: 28px;
	margin-bottom: 8px;
}

.preview-img {
	width: 100%;
	max-height: 150px;
	object-fit: cover;
	margin-top: 10px;
	border-radius: 8px;
}
</style>

</head>

<body>

	<%@ include file="header.jsp"%>

	<div class="page-bg"></div>

	<div class="container my-5">
		<div class="row justify-content-center">
			<div class="col-lg-12 col-md-11 col-12">

				<div class="card shadow-lg border-0 rounded-4">

					<!-- Header -->
					<div
						class="card-header bg-success text-white text-center rounded-top-4">
						<h5 class="mb-0">
							<spring:message code="complaintForm.header" />
						</h5>
					</div>

					<div class="card-body p-4">
						<form id="complaintForm" enctype="multipart/form-data" novalidate>

							<div class="row g-4">

								<!-- Full Name -->
								<div class="col-md-6">
									<label for="fullName" class="form-label fw-semibold"> <spring:message
											code="complaintForm.name" /> *
									</label> <input type="text" id="fullName" name="fullName"
										class="form-control form-control-lg"
										placeholder="<spring:message code='complaintForm.name' />"
										required>
								</div>

								<!-- Mobile -->
								<div class="col-md-3">
									<label for="mobile" class="form-label fw-semibold"> <spring:message
											code="admin_registration.mobile_no" /> *
									</label> <input type="text" id="mobile" name="mobile"
										class="form-control form-control-lg"
										placeholder="<spring:message code='admin_registration.mobile_no' />"
										maxlength="10" pattern="[0-9]{10}" required>
								</div>

								<!-- Email -->
								<div class="col-md-3">
									<label class="form-label fw-semibold"> <spring:message
											code="admin_registration.email_id" />
									</label> <input type="email" id="email" name="email"
										class="form-control form-control-lg"
										placeholder="<spring:message code='admin_registration.email_id' />">
								</div>

								<!-- Complaint Type -->
								<div class="col-md-4">
									<label for="complaintType" class="form-label fw-semibold">
										<spring:message code="complaintForm.type" /> *
									</label> <select name="complaintType" id="complaintType"
										class="form-select form-select-lg" required>
										<option value="">--
											<spring:message code="complaintForm.type_select" /> --
										</option>
										<option value="water_supply">
											<spring:message code="complaintForm.water_supply" />
										</option>
										<option value="road_damage">
											<spring:message code="complaintForm.road_damage" />
										</option>
										<option value="street_light">
											<spring:message code="complaintForm.street_light" />
										</option>
										<option value="garbage">
											<spring:message code="complaintForm.garbage" />
										</option>
										<option value="other">
											<spring:message code="complaintForm.other" />
										</option>
									</select>
								</div>

								<!-- Details -->
								<div class="col-md-12">
									<label for="details" class="form-label fw-semibold"> <spring:message
											code="complaintForm.details" /> *
									</label>
									<textarea id="details" name="details" rows="4"
										class="form-control form-control-lg"
										placeholder="<spring:message code='complaintForm.details' />..."
										required></textarea>
								</div>

								<div class="row g-3">

									<!-- IMAGE UPLOAD -->
									<div class="col-md-6">
										<label class="form-label fw-semibold"> <spring:message
												code="complaintForm.upload_image" /> 
										</label>

										<div class="upload-box" onclick="triggerFile('imageFile')">
											<div class="upload-content">
												<div class="upload-icon">📷</div>
												<div class="upload-text"><spring:message
												code="complaintForm.click_to_upload_image" />  </div>
												<small class="text-muted"><spring:message
												code="complaintForm.upload_image_validation" /> </small>
											</div>

											<input type="file" id="imageFile" name="imageFile" hidden
												accept="image/*">
										</div>

										<img id="imagePreview" class="preview-img d-none" />

										<div id="imageError" class="text-danger small mt-1"></div>
									</div>


									<!-- VIDEO UPLOAD -->
									<div class="col-md-6">
										<label class="form-label fw-semibold"> <spring:message
												code="complaintForm.upload_video" />
										</label>

										<div class="upload-box" onclick="triggerFile('videoFile')">
											<div class="upload-content">
												<div class="upload-icon">🎥</div>
												<div class="upload-text"><spring:message
												code="complaintForm.click_to_upload_video" /></div>
												<small class="text-muted"><spring:message
												code="complaintForm.upload_video_validation" /></small>
											</div>

											<input type="file" id="videoFile" name="videoFile" hidden
												accept="video/*">
										</div>

										<div id="videoName" class="small mt-2 text-muted"></div>
										<div id="videoError" class="text-danger small mt-1"></div>
									</div>

								</div>

							</div>

							<hr class="my-4">

							<!-- Message -->
							<div id="msg" class="text-center text-danger fw-semibold"></div>

							<!-- Submit Button -->
							<div class="text-center mt-3">
								<button type="button" id="submitBtn"
									class="btn btn-success btn-lg px-5 rounded-pill shadow-sm">
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
	submitBtn.onclick = () => {

	    const form = document.getElementById("complaintForm");

	    if (!form.checkValidity()) {
	        form.classList.add("was-validated");
	        return;
	    }

	    const formData = new FormData(form);

	    // 🔒 Disable button + show loading
	    submitBtn.disabled = true;
	    const originalText = submitBtn.innerHTML;
	    submitBtn.innerHTML = "Submitting... ⏳";

	    fetch("<%=request.getContextPath()%>/api/complaint/add", {
	        method: "POST",
	        body: formData
	    })
	    .then(res => res.json())
	    .then(response => {
	        const msgDiv = document.getElementById("msg");

	        msgDiv.innerHTML =
	            "<div class='alert alert-success'>Complaint Submitted Successfully ✅</div>";

	        form.reset();

	        // ⏱ Remove message after 3 sec
	        setTimeout(() => {
	            msgDiv.innerHTML = "";
	        }, 3000);
	    })
	    .catch(err => {
	        document.getElementById("msg").innerHTML =
	            "<div class='alert alert-danger'>Error ❌</div>";
	    })
	    .finally(() => {
	        // 🔓 Enable button again
	        submitBtn.disabled = false;
	        submitBtn.innerHTML = originalText;
	    });
	};
	
</script>
<script>

function triggerFile(id) {
    document.getElementById(id).click();
}

// IMAGE VALIDATION
document.getElementById("imageFile").addEventListener("change", function () {
    const file = this.files[0];
    const error = document.getElementById("imageError");
    const preview = document.getElementById("imagePreview");

    error.textContent = "";

    if (!file) return;

    const allowedTypes = ["image/jpg","image/jpeg", "image/png"];
    const maxSize = 2 * 1024 * 1024; // 2MB

    if (!allowedTypes.includes(file.type)) {
        error.textContent = "Only JPG, JPEG or PNG allowed";
        this.value = "";
        return;
    }

    if (file.size > maxSize) {
        error.textContent = "Image must be less than 2MB";
        this.value = "";
        return;
    }

    // Preview
    const reader = new FileReader();
    reader.onload = e => {
        preview.src = e.target.result;
        preview.classList.remove("d-none");
    };
    reader.readAsDataURL(file);
});


// VIDEO VALIDATION
document.getElementById("videoFile").addEventListener("change", function () {
    const file = this.files[0];
    const error = document.getElementById("videoError");
    const name = document.getElementById("videoName");

    error.textContent = "";
    name.textContent = "";

    if (!file) return;

    const allowedTypes = ["video/mp4"];
    const maxSize = 10 * 1024 * 1024; // 10MB

    if (!allowedTypes.includes(file.type)) {
        error.textContent = "Only MP4 video allowed";
        this.value = "";
        return;
    }

    if (file.size > maxSize) {
        error.textContent = "Video must be less than 10MB";
        this.value = "";
        return;
    }

    name.textContent = "Selected: " + file.name;
});

</script>

</body>
</html>
