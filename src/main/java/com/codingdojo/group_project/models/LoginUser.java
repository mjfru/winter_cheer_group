package com.codingdojo.group_project.models;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class LoginUser {

	// Class Attributes:
	@NotEmpty(message = "Email is required to log in.")
	@Email(message = "Please enter a valid email address.")
	private String email;
	
	@NotEmpty(message = "Password is required to log in.")
	@Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters.")
	private String password;
	
	// Empty constructor for the Java Bean
	public LoginUser() {}

	// Getters & Setters:
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}