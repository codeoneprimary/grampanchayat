package com.gram.panchayat.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.gram.panchayat.model.DobApplication;
import com.gram.panchayat.model.User;

public interface DobApplicationRepository extends JpaRepository<DobApplication, Long> {

	DobApplication findByApplicationId(Long applicationId);

	List<DobApplication> findByStatus(String status);

	List<DobApplication> findByAppliedBy(User appliedBy);

	Page<DobApplication> findByStatus(String status, Pageable pageable);

}
