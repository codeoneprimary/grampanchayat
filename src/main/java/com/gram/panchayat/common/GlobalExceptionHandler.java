package com.gram.panchayat.common;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(RuntimeException.class)
	public ResponseEntity<ApiResponse> handleRuntimeException(RuntimeException ex) {
		ApiResponse response = new ApiResponse();
		response.setSuccess(false);
		response.setMessage(ex.getMessage());

		return ResponseEntity.badRequest().body(response);
	}
}