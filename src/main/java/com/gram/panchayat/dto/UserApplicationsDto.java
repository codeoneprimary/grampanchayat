package com.gram.panchayat.dto;

import java.util.List;

import com.gram.panchayat.model.DeathApplication;
import com.gram.panchayat.model.DobApplication;

public class UserApplicationsDto {

	private List<DeathApplication> deathApplication;
	private List<DobApplication> dobApplication;

	public UserApplicationsDto(List<DeathApplication> deathApplication, List<DobApplication> dobApplication) {
		super();
		this.deathApplication = deathApplication;
		this.dobApplication = dobApplication;
	}

	public List<DeathApplication> getDeathApplication() {
		return deathApplication;
	}

	public void setDeathApplication(List<DeathApplication> deathApplication) {
		this.deathApplication = deathApplication;
	}

	public List<DobApplication> getDobApplication() {
		return dobApplication;
	}

	public void setDobApplication(List<DobApplication> dobApplication) {
		this.dobApplication = dobApplication;
	}

}
