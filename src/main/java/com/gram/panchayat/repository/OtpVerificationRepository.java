package com.gram.panchayat.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gram.panchayat.model.OtpVerification;
import com.gram.panchayat.model.User;

public interface OtpVerificationRepository extends JpaRepository<OtpVerification, Long> {

	Optional<OtpVerification> findTopByMobileNoOrderByCreatedDateDesc(String mobileNo);
}
