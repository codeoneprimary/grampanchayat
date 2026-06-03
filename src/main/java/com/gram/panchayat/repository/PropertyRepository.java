package com.gram.panchayat.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gram.panchayat.model.Property;

public interface PropertyRepository extends JpaRepository<Property, Integer> {
	Optional<Property> findByPropertyNo(String propertyNo);

	Page<Property> findByOwnerNameContainingOrPropertyNoContaining(String ownerName, String propertyNo,
			Pageable pageable);

	void deleteById(Long id);

	@Query("SELECT p.propertyNo, p.ownerName, SUM(pt.pendingTax) "
			+ "FROM Property p JOIN PropertyTax pt ON p.id = pt.property.id " + "GROUP BY p.propertyNo, p.ownerName")
	List<Object[]> getAllPendingSummary();

	@Query("SELECT p.id, p.ownerName, p.mobile, p.propertyNo, p.wardNo, p.area, p.propertyType, "
			+ "COALESCE(SUM(pt.balanceAmount),0) " + "FROM Property p LEFT JOIN PropertyTax pt ON p.id = pt.property.id "
			+ "WHERE (:keyword IS NULL OR " + "LOWER(p.ownerName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR "
			+ "LOWER(p.propertyNo) LIKE LOWER(CONCAT('%', :keyword, '%')) OR "
			+ "LOWER(p.mobile) LIKE LOWER(CONCAT('%', :keyword, '%')) OR "
			+ "CAST(p.wardNo AS string) LIKE CONCAT('%', :keyword, '%')) "
			+ "GROUP BY p.id, p.ownerName, p.mobile, p.propertyNo, p.area, p.propertyType")
	Page<Object[]> getPropertyWithPending(@Param("keyword") String keyword, Pageable pageable);

	boolean existsByPropertyNo(String propertyNo);

	Property findById(Long id);

}
