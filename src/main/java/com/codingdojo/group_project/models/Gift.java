package com.codingdojo.group_project.models;

import java.time.LocalDate;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "gifts")
public class Gift {
	// Class Attributes & Validations:
	// Automatically created attributes:
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
		this.updatedAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	// Connecting the relationship (User -> Gifts)
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;
	
	// Attributes set by the user:
	@NotBlank(message = "Gift must have a name.")
	@Size(min = 2, max = 40, message = "Gift name must be between 2 and 40 characters.")
	private String giftName;
	
	@NotBlank(message = "Please specify a gift type")
	@Size(min = 2, max = 40, message = "Gift type must be between 2 and 40 characters.")
	private String giftType;
	
	@NotBlank(message = "Please indicate where this gift can be purchased")
	@Size(min = 2, max = 40, message = "Store name must be between 2 and 40 characters.")
	private String storeName;
	
	@NotNull(message = "Please indicate the approximate price of this gift.")
	@Min(value = 1, message = "Price must not be less than $1.")
	@Max(value = 500, message = "Price must not exceed $500.")
	private Double price;
	
	@NotNull(message = "Please indicate when this gift must be delivered by.")
	private LocalDate dateNeeded;
	
	@NotBlank(message = "Please provide a phone number or email address you can be contacted at.")
	@Size(min = 5, max = 40, message = "Phone number / Email address must be between 5 and 40 characters.")
	private String contactInfo;
	
	@NotBlank(message = "Please add some helpful details about this gift to make the purchase as accurate as possible.")
	@Size(min = 10, max = 255, message = "Details about this gift must be between 10 and 255 characters.")
	@Column(columnDefinition = "TEXT")
	private String giftDetails;
	
	// Empty constructor for the Java Bean:
	public Gift() {}

	// Getters & Setters:
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getGiftName() {
		return giftName;
	}

	public void setGiftName(String giftName) {
		this.giftName = giftName;
	}

	public String getGiftType() {
		return giftType;
	}

	public void setGiftType(String giftType) {
		this.giftType = giftType;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public LocalDate getDateNeeded() {
		return dateNeeded;
	}

	public void setDateNeeded(LocalDate dateNeeded) {
		this.dateNeeded = dateNeeded;
	}

	public String getContactInfo() {
		return contactInfo;
	}

	public void setContactInfo(String contactInfo) {
		this.contactInfo = contactInfo;
	}

	public String getGiftDetails() {
		return giftDetails;
	}

	public void setGiftDetails(String giftDetails) {
		this.giftDetails = giftDetails;
	}
}
