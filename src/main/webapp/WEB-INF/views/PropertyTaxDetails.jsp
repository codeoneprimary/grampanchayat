<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title><spring:message code="propertyType.property_details" /></title>
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
			<div
				class="card-header bg-primary text-white d-flex justify-content-between align-items-center">

				<span> 🏠 <spring:message
						code="propertyType.property_details" />
				</span>

				<c:if
					test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
					<a
						href="${pageContext.request.contextPath}/editProperty/${property.id}"
						class="btn btn-sm btn-warning"> ✏️ <spring:message
							code="propertyType.edit" />
					</a>
				</c:if>
			</div>

			<div class="card-body">

				<div class="row">
					<div class="col-md-4">
						<b><spring:message code="propertyType.owner" /> : </b>
						${property.ownerName}
					</div>
					<div class="col-md-4">
						<b><spring:message code="propertyType.mobile" /> : </b>
						${property.mobile}
					</div>
					<div class="col-md-4">
						<b><spring:message code="propertyType.property_no" /> : </b>
						${property.propertyNo}
					</div>

					<div class="col-md-4">
						<b><spring:message code="propertyType.area" /> : </b>
						${property.area}
					</div>
					<div class="col-md-4">
						<b><spring:message code="propertyType.type" /> : </b>
						${property.propertyType}
					</div>
					<div class="col-md-4">
						<b><spring:message code="propertyType.ward_no" /> : </b>
						${property.wardNo}
					</div>

					<div class="col-md-12 mt-2">
						<b><spring:message code="propertyType.address" /> : </b>
						${property.address}
					</div>
				</div>

			</div>
		</div>

		<!-- 📊 Tax Table -->
		<div class="card shadow">
			<div
				class="card-header bg-success text-white d-flex justify-content-between align-items-center">

				<!-- Left side -->
				<div>
					📊
					<spring:message code="propertyType.tax_history" />
				</div>

				<!-- Right side -->
				<button class="btn btn-sm btn-info"
					onclick="loadHistory('${property.propertyNo}')">
					📜
					<spring:message code="propertyType.payment_history" />
				</button>

			</div>

			<div class="card-body">

				<div class="table-responsive">
					<table class="table table-bordered text-center">

						<thead>
							<tr>
								<th><spring:message code="propertyType.year" /></th>
								<th><spring:message code="propertyType.previous_dues" /></th>
								<th><spring:message code="propertyType.penalty" /></th>
								<th><spring:message code="propertyType.current_year_tax" /></th>
								<th><spring:message code="propertyType.total_payable" /></th>
								<th><spring:message code="propertyType.paid" /></th>
								<th><spring:message code="propertyType.remaining_balance" /></th>
								<th><spring:message code="propertyType.status" /></th>
								<th><spring:message code="propertyType.action" /></th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="t" items="${taxList}">
								<tr id="row-${t.id}">

									<td>${t.financialYear}</td>

									<td><span id="pendingText-${t.id}" class="text-danger">
											₹ ${t.pendingTax} </span> <input type="text"
										id="pendingInput-${t.id}" value="${t.pendingTax}"
										class="form-control d-none" /></td>

									<td><span id="penaltyText-${t.id}" class="text-danger">
											₹ ${t.penalty} </span> <input type="text" id="penaltyInput-${t.id}"
										value="${t.penalty}" class="form-control d-none" /></td>

									<td><span id="currentTaxText-${t.id}" class="text-danger">
											₹ ${t.currentTax} </span> <input type="text"
										id="currentTaxInput-${t.id}" value="${t.currentTax}"
										class="form-control d-none" /></td>

									<td id="totalText-${t.id}">₹ ${t.totalTax}</td>

									<!-- PAID -->
									<td class="text-success">₹ ${t.paidAmount}</td>

									<td id="balanceText-${t.id}">₹ ${t.balanceAmount}</td>

									<!-- STATUS -->
									<td><span
										class="badge 
								            ${t.status == 'PAID' ? 'bg-success' : 
								              t.status == 'PARTIAL' ? 'bg-warning' : 'bg-danger'}">
											${t.status} </span></td>

									<!-- ACTION -->
									<td><c:if test="${t.status!='PAID'}">
											<div class="d-flex justify-content-center gap-1">

												<!-- EDIT BUTTON -->
												<button class="btn btn-warning btn-sm" id="editBtn-${t.id}"
													onclick="editRow(${t.id})">
													✏️
													<spring:message code="propertyType.edit" />
												</button>

												<!-- UPDATE -->
												<button class="btn btn-success btn-sm d-none"
													id="updateBtn-${t.id}" onclick="updateRow(${t.id})">
													✅
													<spring:message code="propertyType.update" />
												</button>

												<!-- CANCEL -->
												<button class="btn btn-secondary btn-sm d-none"
													id="cancelBtn-${t.id}" onclick="cancelEdit(${t.id})">
													❌
													<spring:message code="propertyType.cancel" />
												</button>

											</div>
										</c:if></td>

								</tr>
							</c:forEach>

							<c:if test="${empty taxList}">
								<tr>
									<td colspan="5" class="text-danger">❌ <spring:message
											code="propertyType.no_records_found" />
									</td>
								</tr>
							</c:if>

						</tbody>

					</table>
				</div>
				<div class="d-flex justify-content-between mb-3">

					<!-- ⬅ Back Button -->
					<a href="${pageContext.request.contextPath}/taxHome"
						class="btn btn-secondary"> ⬅ <spring:message
							code="propertyType.back_to_list" /></a>
					<c:if
						test="${not empty sessionScope.userRole and sessionScope.userRole eq 'ADMIN'}">
						<!-- 💰 Pay Tax Button -->
						<a
							href="${pageContext.request.contextPath}/payPropertyTax/${property.id}"
							class="btn btn-success"> 💰 <spring:message
								code="propertyType.pay_tax" /></a>
					</c:if>

				</div>
			</div>
		</div>

	</div>

	<div class="modal fade" id="historyModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-header">
					<h5>
						<spring:message code="propertyType.payment_history" />
					</h5>
					<button class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body" id="historyContent">Loading...</div>

			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	<script>
		let currentEditId = null;
		
		// EDIT
		function editRow(id) {
		
		    // close previous row
		    if (currentEditId && currentEditId !== id) {
		        cancelEdit(currentEditId);
		    }
		
		    currentEditId = id;
		
		    document.getElementById("pendingText-" + id).classList.add("d-none");
		    document.getElementById("pendingInput-" + id).classList.remove("d-none");
		
		    document.getElementById("penaltyText-" + id).classList.add("d-none");
		    document.getElementById("penaltyInput-" + id).classList.remove("d-none");
		
		    document.getElementById("currentTaxText-" + id).classList.add("d-none");
		    document.getElementById("currentTaxInput-" + id).classList.remove("d-none");
		
		    document.getElementById("editBtn-" + id).classList.add("d-none");
		    document.getElementById("updateBtn-" + id).classList.remove("d-none");
		    document.getElementById("cancelBtn-" + id).classList.remove("d-none");
		}
		
		// CANCEL
		function cancelEdit(id) {
		
		    document.getElementById("pendingText-" + id).classList.remove("d-none");
		    document.getElementById("pendingInput-" + id).classList.add("d-none");
		
		    document.getElementById("penaltyText-" + id).classList.remove("d-none");
		    document.getElementById("penaltyInput-" + id).classList.add("d-none");
		
		    document.getElementById("currentTaxText-" + id).classList.remove("d-none");
		    document.getElementById("currentTaxInput-" + id).classList.add("d-none");
		
		
		    document.getElementById("editBtn-" + id).classList.remove("d-none");
		    document.getElementById("updateBtn-" + id).classList.add("d-none");
		    document.getElementById("cancelBtn-" + id).classList.add("d-none");
		
		    currentEditId = null;
		}
		
		// UPDATE (AJAX)
		function updateRow(id) {
		
		    let pending = document.getElementById("pendingInput-" + id).value;
		    let penalty = document.getElementById("penaltyInput-" + id).value;
		    let currentTax = document.getElementById("currentTaxInput-" + id).value;
		
		    fetch("<%=request.getContextPath()%>/updatePropertyTaxAjax", {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/json"
		        },
		        body: JSON.stringify({
		            id: id,
		            pendingTax: pending,
		            penalty: penalty,
		            currentTax: currentTax
		        })
		    })
		    .then(res => res.json())
		    .then(data => {
		    	  // convert to numbers
		        let pendingVal = parseFloat(pending) || 0;
		        let penaltyVal = parseFloat(penalty) || 0;
		        let currentTaxVal = parseFloat(currentTax) || 0;
		
		        // calculate total
		        let total = pendingVal + penaltyVal + currentTaxVal;
		
		        // get paid amount from table
		        let paidText = document.querySelector("#row-" + id + " td:nth-child(6)").innerText;
		        let paid = parseFloat(paidText.replace(/[₹ ,]/g, "")) || 0;
		
		        // calculate balance
		        let balance = total - paid;
		
		        // update UI
		        document.getElementById("pendingText-" + id).innerText = "₹ " + pendingVal;
		        document.getElementById("penaltyText-" + id).innerText = "₹ " + penaltyVal;
		        document.getElementById("currentTaxText-" + id).innerText = "₹ " + currentTaxVal;
		
		        document.getElementById("totalText-" + id).innerText = "₹ " + total;
		        document.getElementById("balanceText-" + id).innerText = "₹ " + balance;
		
		        cancelEdit(id);
		    })
		    .catch(err => {
		        alert("Update failed ❌");
		    });
		}
		function loadHistory(propertyNo, page = 0) {

		    $("#historyModal").modal("show");

		    $("#historyContent").html("Loading...");

		    fetch("${pageContext.request.contextPath}/getPaymentHistory?propertyNo="
		        + encodeURIComponent(propertyNo)
		        + "&page=" + page)

		    .then(res => res.text())
		    .then(html => {
		        $("#historyContent").html(html);
		    });
		}
	</script>
</body>
</html>
