package com.gram.panchayat.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gram.panchayat.model.DailyNews;

public interface DailyNewsRepository extends JpaRepository<DailyNews, Long> {

	@Query("""
			    SELECT n FROM DailyNews n
			    WHERE n.status = 'APPROVED'
			    AND :now BETWEEN n.publishFrom AND n.publishTo
			    ORDER BY n.publishFrom DESC
			""")
	List<DailyNews> findTodaysActiveNews(@Param("now") LocalDate now);

}
