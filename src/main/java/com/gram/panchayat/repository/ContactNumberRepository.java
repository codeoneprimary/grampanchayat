package com.gram.panchayat.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gram.panchayat.model.ContactNumber;

public interface ContactNumberRepository extends JpaRepository<ContactNumber, Long> {

	boolean existsByContact(String contact);
}
