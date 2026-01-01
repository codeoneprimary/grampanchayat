package com.gram.panchayat.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gram.panchayat.model.DobApplication;

public interface DobApplicationRepository extends JpaRepository<DobApplication, Long> {

	DobApplication findByApplicationId(Long applicationId);

	List<DobApplication> findByStatus(String status);

}
