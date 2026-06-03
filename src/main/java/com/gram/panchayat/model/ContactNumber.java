package com.gram.panchayat.model;

import jakarta.persistence.*;

@Entity
@Table(name = "contact_number", uniqueConstraints = @UniqueConstraint(columnNames = "contact"))
public class ContactNumber {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	private Long id;

	@Column(name = "NAME")
	private String name;

	@Column(name = "CONTACT", nullable = false, unique = true)
	private String contact;

	public ContactNumber() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
}
