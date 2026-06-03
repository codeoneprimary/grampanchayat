package com.gram.panchayat.serviceImpl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;

import com.gram.panchayat.model.ContactNumber;
import com.gram.panchayat.model.ProgramEvent;
import com.gram.panchayat.repository.ProgramEventRepository;
import com.gram.panchayat.services.ContactNumberService;
import com.gram.panchayat.services.ProgramEventService;
import com.gram.panchayat.util.WhatsAppUtil;

@Service
public class ProgramEventServiceImpl implements ProgramEventService {

	private final ProgramEventRepository programEventRepository;

	private final ContactNumberService contactService;
	private final WhatsAppUtil whatsAppUtil;

	public ProgramEventServiceImpl(ProgramEventRepository programEventRepository, ContactNumberService contactService,
			WhatsAppUtil whatsAppUtil) {
		this.programEventRepository = programEventRepository;
		this.contactService = contactService;
		this.whatsAppUtil = whatsAppUtil;
	}

	@Override
	public void savesaveProgramEvent(ProgramEvent programEvent) {
		programEventRepository.save(programEvent);
	}

	@Override
	public List<ProgramEvent> findActiveProgramEvent() {

		return programEventRepository.findTodaysActiveProgramEvent(LocalDate.now());
	}

	@Override
	public ProgramEvent getProgramEventsById(long id) {

		return programEventRepository.getById(id);
	}

	@Override
	public void sendProgramEventToUsers(ProgramEvent programEvent) {
		List<ContactNumber> list = contactService.findAllContactNumber();

		for (ContactNumber contactNumber : list) {
			try {
				whatsAppUtil.sendNewsToUser(contactNumber, programEvent.getDescription());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public void deleteProgramEventById(long id) {

		ProgramEvent programEvent = programEventRepository.getById(id);
		programEvent.setStatus("DELETE");
		programEventRepository.save(programEvent);

	}

}
