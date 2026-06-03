package com.gram.panchayat.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gram.panchayat.dto.TaxSummaryDto;
import com.gram.panchayat.model.Property;
import com.gram.panchayat.model.PropertyTax;

public interface PropertyTaxRepository extends JpaRepository<PropertyTax, Integer> {

	@Query("SELECT t FROM PropertyTax t WHERE t.property.id = :propertyId ORDER BY t.financialYear DESC")
	List<PropertyTax> findTaxHistory(@Param("propertyId") Long propertyId);

	List<PropertyTax> findByProperty_IdOrderByFinancialYearDesc(Long propertyId);

	Optional<PropertyTax> findByPropertyAndFinancialYear(Property property, String year);

	PropertyTax findById(long id);

	@Query("SELECT new com.gram.panchayat.dto.TaxSummaryDto(SUM(t.totalTax), SUM(t.balanceAmount)) "
			+ "FROM PropertyTax t WHERE t.property.id = :propertyId")
	TaxSummaryDto getSummaryByPropertyId(Long propertyId);

	@Query("SELECT p FROM PropertyTax p WHERE p.property.id = :propertyId AND p.balanceAmount > 0 ORDER BY p.financialYear ASC")
	List<PropertyTax> findPendingTaxes(Long propertyId);

	List<PropertyTax> findByFinancialYearOrderByProperty_PropertyNoAsc(String year);

	@Query(value = """
			    SELECT pt FROM PropertyTax pt
			    WHERE (:year IS NULL OR pt.financialYear = :year)
			    AND (
			        :keyword IS NULL OR
			        LOWER(pt.property.propertyNo) LIKE LOWER(CONCAT('%', :keyword, '%')) OR
			        LOWER(pt.property.ownerName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR
			        pt.property.mobile LIKE CONCAT('%', :keyword, '%')
			    )
			    AND (
			        :status IS NULL OR
			        (:status = 'PAID' AND pt.balanceAmount = 0) OR
			        (:status = 'PENDING' AND pt.paidAmount = 0) OR
			        (:status = 'PARTIAL' AND pt.paidAmount > 0 AND pt.balanceAmount > 0)
			    )
			""", countQuery = """
			    SELECT COUNT(pt) FROM PropertyTax pt
			    WHERE (:year IS NULL OR pt.financialYear = :year)
			    AND (
			        :keyword IS NULL OR
			        LOWER(pt.property.propertyNo) LIKE LOWER(CONCAT('%', :keyword, '%')) OR
			        LOWER(pt.property.ownerName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR
			        pt.property.mobile LIKE CONCAT('%', :keyword, '%')
			    )
			    AND (
			        :status IS NULL OR
			        (:status = 'PAID' AND pt.balanceAmount = 0) OR
			        (:status = 'PENDING' AND pt.paidAmount = 0) OR
			        (:status = 'PARTIAL' AND pt.paidAmount > 0 AND pt.balanceAmount > 0)
			    )
			""")
	Page<PropertyTax> searchReport(@Param("year") String year, @Param("keyword") String keyword,
			@Param("status") String status, Pageable pageable);

	@Query("""
			    SELECT pt FROM PropertyTax pt
			    WHERE (:year IS NULL OR pt.financialYear = :year)
			    AND (
			        :keyword IS NULL OR
			        LOWER(pt.property.propertyNo) LIKE LOWER(CONCAT('%', :keyword, '%')) OR
			        LOWER(pt.property.ownerName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR
			        pt.property.mobile LIKE CONCAT('%', :keyword, '%')
			    )
			    AND (
			        :status IS NULL OR
			        (:status = 'PAID' AND pt.balanceAmount = 0) OR
			        (:status = 'PENDING' AND pt.paidAmount = 0) OR
			        (:status = 'PARTIAL' AND pt.paidAmount > 0 AND pt.balanceAmount > 0)
			    )
			""")
	List<PropertyTax> searchReportForExport(@Param("year") String year, @Param("keyword") String keyword,
			@Param("status") String status);

	void deleteByPropertyId(Long id);

	boolean existsByPropertyId(Long id);
}