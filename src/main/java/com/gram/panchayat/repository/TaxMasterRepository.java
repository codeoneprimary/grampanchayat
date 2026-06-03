package com.gram.panchayat.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gram.panchayat.model.TaxMaster;

public interface TaxMasterRepository extends JpaRepository<TaxMaster, Integer> {
    TaxMaster findByPropertyType(String propertyType);
}
