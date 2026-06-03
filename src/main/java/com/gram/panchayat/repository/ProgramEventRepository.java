package com.gram.panchayat.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gram.panchayat.model.ProgramEvent;

public interface ProgramEventRepository extends JpaRepository<ProgramEvent, Long> {

	@Query("""
			    SELECT n FROM ProgramEvent n
			    WHERE n.status = 'APPROVED'
			    AND :now BETWEEN n.publishFrom AND n.publishTo
			    ORDER BY n.publishFrom DESC
			""")
	List<ProgramEvent> findTodaysActiveProgramEvent(@Param("now") LocalDate now);

}
