package com.gram.panchayat.dto;

public class ComplaintRequestDto {
	private String fullName;
	private String mobile;
	private String email;
	private String complaintType;
	private String details;

	// Image
	private String imageFileName;
	private String imageFileType;
	private String imageBase64Data;

	// Video
	private String videoFileName;
	private String videoFileType;
	private String videoBase64Data;

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getComplaintType() {
		return complaintType;
	}

	public void setComplaintType(String complaintType) {
		this.complaintType = complaintType;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getImageFileType() {
		return imageFileType;
	}

	public void setImageFileType(String imageFileType) {
		this.imageFileType = imageFileType;
	}

	public String getImageBase64Data() {
		return imageBase64Data;
	}

	public void setImageBase64Data(String imageBase64Data) {
		this.imageBase64Data = imageBase64Data;
	}

	public String getVideoFileName() {
		return videoFileName;
	}

	public void setVideoFileName(String videoFileName) {
		this.videoFileName = videoFileName;
	}

	public String getVideoFileType() {
		return videoFileType;
	}

	public void setVideoFileType(String videoFileType) {
		this.videoFileType = videoFileType;
	}

	public String getVideoBase64Data() {
		return videoBase64Data;
	}

	public void setVideoBase64Data(String videoBase64Data) {
		this.videoBase64Data = videoBase64Data;
	}

}
