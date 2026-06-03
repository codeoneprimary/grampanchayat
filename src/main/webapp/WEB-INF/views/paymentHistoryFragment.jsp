<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="table table-bordered table-hover text-center">
	<thead class="table-dark">
		<tr>
			<th><spring:message code="propertyType.date" /></th>
			<th><spring:message code="propertyType.year" /></th>
			<th><spring:message code="propertyType.amount" /></th>
			<th><spring:message code="propertyType.payment_mode" /></th>
		</tr>
	</thead>

	<tbody>
		<c:forEach items="${payments}" var="p">
			<tr>
				<td>${p.paymentDate}</td>
				<td>${p.financialYear}</td>
				<td>${p.amountPaid}</td>
				<td>${p.paymentMode}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<!-- 🔷 Pagination -->
<div class="d-flex justify-content-center mt-2">

	<button class="btn btn-sm btn-outline-primary"
		onclick="loadHistory('${propertyNo}', ${page.number - 1})"
		${page.first ? 'disabled' : ''}>◀ Prev</button>

	<span class="mx-3 mt-1"> Page ${page.number + 1} of
		${page.totalPages} </span>

	<button class="btn btn-sm btn-outline-primary"
		onclick="loadHistory('${propertyNo}', ${page.number + 1})"
		${page.last ? 'disabled' : ''}>Next ▶</button>

</div>