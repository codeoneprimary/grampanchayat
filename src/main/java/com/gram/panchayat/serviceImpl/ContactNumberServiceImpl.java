package com.gram.panchayat.serviceImpl;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.gram.panchayat.model.ContactNumber;
import com.gram.panchayat.repository.ContactNumberRepository;
import com.gram.panchayat.services.ContactNumberService;

@Service
public class ContactNumberServiceImpl implements ContactNumberService {

	private final ContactNumberRepository contactRepository;

	public ContactNumberServiceImpl(ContactNumberRepository contactRepository) {
		this.contactRepository = contactRepository;
	}

	@Override
	public boolean existsByContact(String contact) {
		return contactRepository.existsByContact(contact);
	}

	@Override
	public void saveContact(ContactNumber contactEntity) {
		contactRepository.save(contactEntity);
	}

	@Override
	public void saveAllContact(List<ContactNumber> validContacts) {
		contactRepository.saveAll(validContacts);
	}

	@Override
	public List<ContactNumber> findAllContactNumber() {
		return contactRepository.findAll();
	}

	@Override
	public Page<ContactNumber> getPaginatedContacts(int page, int size) {
		   Pageable pageable = PageRequest.of(page, size, Sort.by("name").ascending());
		    return contactRepository.findAll(pageable);
	}

}
