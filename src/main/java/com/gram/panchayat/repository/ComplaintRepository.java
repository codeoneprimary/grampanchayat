package com.gram.panchayat.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.gram.panchayat.model.Complaint;

public interface ComplaintRepository extends JpaRepository<Complaint, Long> {

	List<Complaint> findByStatus(String status);

	Page<Complaint> findByStatus(String status, Pageable pageable);

}
