package com.gram.panchayat.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.gram.panchayat.model.DeathApplication;
import com.gram.panchayat.model.User;

public interface DeathApplicationRepository extends JpaRepository<DeathApplication, Long> {

	DeathApplication findByApplicationId(Long applicationId);

	List<DeathApplication> findByStatus(String status);

	List<DeathApplication> findByAppliedBy(User applicant);

	Page<DeathApplication> findByStatus(String status, Pageable pageable);

}
