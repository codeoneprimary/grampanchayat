package com.gram.panchayat.services;

import java.util.List;

import org.springframework.data.domain.Page;

import com.gram.panchayat.model.ContactNumber;

public interface ContactNumberService {

	boolean existsByContact(String contact);

	void saveContact(ContactNumber contactEntity);

	void saveAllContact(List<ContactNumber> validContacts);

	List<ContactNumber> findAllContactNumber();

	Page<ContactNumber> getPaginatedContacts(int page, int size);

}
