package com.gram.panchayat.mobileApiController;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gram.panchayat.dto.DeathCertificateApplicationRequestDto;
import com.gram.panchayat.dto.PropertyDetailDto;
import com.gram.panchayat.dto.TaxSummaryDto;
import com.gram.panchayat.dto.UserApplicationsDto;
import com.gram.panchayat.dto.UserDto;
import com.gram.panchayat.model.User;
import com.gram.panchayat.services.DeathService;
import com.gram.panchayat.services.DobService;
import com.gram.panchayat.services.PropertyService;
import com.gram.panchayat.services.PropertyTaxService;
import com.gram.panchayat.services.UserService;
import com.gram.panchayat.util.JwtUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class MobileAPIController {

	private final DeathService deathService;
	private final DobService dobService;
	private final JwtUtil jwtUtil;

	private final UserService userService;

	private final PropertyService propertyService;
	private final PropertyTaxService propertyTaxService;

	public MobileAPIController(PropertyService propertyService, PropertyTaxService propertyTaxService,
			DeathService deathService, JwtUtil jwtUtil, UserService userService, DobService dobService) {
		this.propertyService = propertyService;
		this.propertyTaxService = propertyTaxService;
		this.deathService = deathService;
		this.jwtUtil = jwtUtil;
		this.userService = userService;
		this.dobService = dobService;
	}

	@PostMapping("/property/list")
	public ResponseEntity<?> propertyList(@RequestBody Map<String, String> req) {

		Pageable pageable = Pageable.unpaged();

		Page<Object[]> propertyPage = propertyService.getPropertyWithPending(req.get("keyword"), pageable);

		List<PropertyDetailDto> response = propertyPage.getContent().stream().map(object -> {

			PropertyDetailDto dto = new PropertyDetailDto();

			dto.setId(((Number) object[0]).longValue());
			dto.setOwnerName((String) object[1]);
			dto.setMobile((String) object[2]);
			dto.setPropertyNo((String) object[3]);
			dto.setWardNo(((Number) object[4]).intValue());
			dto.setArea(((Number) object[5]).doubleValue());
			dto.setPropertyType((String) object[6]);
			dto.setTaxSummary(Optional.ofNullable(propertyTaxService.getTotalAndBalanceByPropertyId(dto.getId()))
					.orElse(new TaxSummaryDto()));
			dto.setPropertyTaxHistory(Optional.ofNullable(propertyTaxService.getAllProprtyTaxByPropertyId(dto.getId()))
					.orElse(Collections.emptyList()));

			return dto;
		}).toList();
		return ResponseEntity.ok(Map.of("SUCESS", response));
	}

	@PostMapping("/userApplicationsList")
	public ResponseEntity<?> userApplicationsList(HttpSession session, HttpServletRequest httpRequest) {

		Long userId = null;

		// ✅ 1. Try JWT (Mobile)
		String authHeader = httpRequest.getHeader("Authorization");

		if (authHeader != null && authHeader.startsWith("Bearer ")) {
			try {
				String token = authHeader.substring(7);

				// extract mobile from JWT
				String mobile = jwtUtil.extractClaims(token).getSubject();

				User user = userService.findByMobileNo(mobile).orElse(null);

				if (user != null) {
					userId = user.getRegUserId();
				}

			} catch (Exception e) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
			}
		}
		if (userId == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}
		return ResponseEntity.ok(new UserApplicationsDto(deathService.findDeathApplicationUser(userId),
				dobService.findDobApplicationByUser(userId)));
	}

	@PostMapping("/updateUser")
	public ResponseEntity<?> updateUser(@RequestBody UserDto request, HttpSession session,
			HttpServletRequest httpRequest) {

		Long userId = null;

		// ✅ 1. Try JWT (Mobile)
		String authHeader = httpRequest.getHeader("Authorization");

		if (authHeader != null && authHeader.startsWith("Bearer ")) {
			try {
				String token = authHeader.substring(7);

				// extract mobile from JWT
				String mobile = jwtUtil.extractClaims(token).getSubject();

				User user = userService.findByMobileNo(mobile).orElse(null);

				if (user != null) {
					userId = user.getRegUserId();
				}

			} catch (Exception e) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
			}
		}
		if (userId == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}
		return ResponseEntity.ok(userService.updateUserDeatils(request,userId));
	}

}
