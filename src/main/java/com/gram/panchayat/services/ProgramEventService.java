package com.gram.panchayat.services;

import java.util.List;

import com.gram.panchayat.model.ProgramEvent;

public interface ProgramEventService {

	void savesaveProgramEvent(ProgramEvent programEvent);

	ProgramEvent getProgramEventsById(long id);

	void sendProgramEventToUsers(ProgramEvent news);

	void deleteProgramEventById(long id);

	List<ProgramEvent> findActiveProgramEvent();

}
