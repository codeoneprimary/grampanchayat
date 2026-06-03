package com.gram.panchayat.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.gram.panchayat.model.PropertyTaxPayment;

public interface PropertyTaxPaymentRepository extends JpaRepository<PropertyTaxPayment, Integer> {
	Page<PropertyTaxPayment> findByProperty_PropertyNoOrderByPaymentDateDesc(String propertyNo, Pageable pageable);

	void deleteByPropertyId(Long id);

	boolean existsByPropertyId(Long id);
}
