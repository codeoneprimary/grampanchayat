package com.gram.panchayat.services;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import com.gram.panchayat.model.Property;
import com.gram.panchayat.model.TaxMaster;

public interface PropertyService {


	List<TaxMaster> getAllTaxMaster();

	void savePropertyDetails(Property property);

	List<Property> getAllPropertyList();

	Page<Property> findByOwnerNameContainingOrPropertyNoContaining(String keyword, String keyword2, Pageable pageable);

	Page<Property> getAllPropertyListPageable(Pageable pageable);

	void deletePropertyById(Long id);

	List<Object[]> getAllPendingSummary();

	Page<Object[]> getPropertyWithPending(String keyword, Pageable pageable);

	Property getPropertyDetails(Long id);

	Optional<Property> getPropertyDetailsByNo(String propertyNo);

	void savePropertyDetails(TaxMaster propertyType);

	TaxMaster getPropertTypeById(int id);

	void deletePropertyTypeById(int id);

	boolean existsByPropertyNo(String propertyNo);

	Map<String, Object> saveCsvDataWithUpsert(MultipartFile file) throws Exception;

}
