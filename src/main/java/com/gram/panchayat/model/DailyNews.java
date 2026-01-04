package com.gram.panchayat.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "daily_news")
public class DailyNews {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	private Long id;

	@Column(name = "TITLE", nullable = false, length = 255)
	private String title;

	@Column(name = "DESCRIPTION", nullable = false, columnDefinition = "TEXT")
	private String description;

	@Column(name = "PUBLISH_FROM", nullable = false)
	private LocalDateTime publishFrom;

	@Column(name = "PUBLISH_TO", nullable = false)
	private LocalDateTime publishTo;

	@Column(name = "STATUS", nullable = false, length = 20)
	private String status; // DRAFT, PENDING, APPROVED, REJECTED, EXPIRED

	@Column(name = "CREATED_BY")
	private Long createdBy;

	@Column(name = "CREATED_DATE", updatable = false)
	private LocalDateTime createdAt;

	@PrePersist
	protected void onCreate() {
		this.createdAt = LocalDateTime.now();
	}

	public DailyNews() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getPublishFrom() {
		return publishFrom;
	}

	public void setPublishFrom(LocalDateTime publishFrom) {
		this.publishFrom = publishFrom;
	}

	public LocalDateTime getPublishTo() {
		return publishTo;
	}

	public void setPublishTo(LocalDateTime publishTo) {
		this.publishTo = publishTo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

}
