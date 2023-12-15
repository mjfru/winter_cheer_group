package com.codingdojo.group_project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.group_project.models.LoginUser;
import com.codingdojo.group_project.models.User;
import com.codingdojo.group_project.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession session;
	
	// For Login & Registration:
	@GetMapping("/")
	public String loginRegistration(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "loginRegistration.jsp";
	}
	
	// Registration:
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model) {
		userService.register(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "loginRegistration.jsp";
		} else {
			session.setAttribute("userId", newUser.getId());
			return "redirect:/home";
		}
	}
	
	// Logging In:
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model) {
		User user = userService.login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "loginRegistration.jsp";
		} else {
			session.setAttribute("userId", user.getId());
			return "redirect:/home";
		}
	}
	
	// Logging Out:
	@GetMapping("/logout")
	public String logout() {
		session.setAttribute("userId", null);
		return "redirect:/";
	}
	
}
