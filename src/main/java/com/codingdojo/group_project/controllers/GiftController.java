package com.codingdojo.group_project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.group_project.models.Gift;
import com.codingdojo.group_project.models.User;
import com.codingdojo.group_project.services.GiftService;
import com.codingdojo.group_project.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class GiftController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GiftService giftService;
	
	// Home Page / Read All:
	@GetMapping("/home")
	public String home(@ModelAttribute("newGift") Gift newGift, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			// For the select input:
			String[] types = {"Clothing", "Toy", "Cookware", "Game", "Supplies", "Other (Specify Below)"};
			model.addAttribute("types", types);
			
			List<Gift> allGifts = giftService.allGifts();
			model.addAttribute("allGifts", allGifts);
			
			return "home.jsp";
		}
	}
	
	// Create Gift:
	@PostMapping("/gift/new")
	public String newGift(@Valid @ModelAttribute("newGift") Gift newGift, BindingResult result, Model model) {
		if (result.hasErrors()) {
			// Checking for general errors, sending back a pre-populated page if there are any:
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			String[] types = {"Clothing", "Toy", "Cookware", "Game", "Supplies", "Other (Specify Below)"};
			model.addAttribute("types", types);
			List<Gift> allGifts = giftService.allGifts();
			model.addAttribute("allGifts", allGifts);
			return "home.jsp";
		} else {
			// Making sure user is logged in:
			Long userId = (Long) session.getAttribute("userId");
			if (userId == null) {
				return "redirect:/";
			// Actually making a new gift:
			} else {
				User user = userService.findById(userId);
				newGift.setUser(user);
				giftService.createGift(newGift);
				return "redirect:/home";
			}
		}
	}
	
	// Read One:
	@GetMapping("/gift/{id}")
	public String viewGift(@PathVariable("id") Long id, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			Gift gift = giftService.findOneGift(id);
			model.addAttribute("gift", gift);
			return "viewGiftDetails.jsp";
		}
	}
	
	// Updating a Gift:
	@GetMapping("/gift/edit/{id}")
	public String editForm(Model model, @PathVariable("id") Long id) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			Gift gift = giftService.findOneGift(id);
			model.addAttribute("gift", gift);
			String[] types = {"Clothing", "Toy", "Cookware", "Game", "Supplies", "Other (Specify Below)"};
			model.addAttribute("types", types);
			return "editGift.jsp";
		}
	}
	
	// Doing the actual update:
	@PutMapping("/gift/edit/{id}")
	public String editGift(@PathVariable("id") Long id, @Valid @ModelAttribute("gift") Gift gift, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("gift", gift);
			String[] types = {"Clothing", "Toy", "Cookware", "Game", "Supplies", "Other (Specify Below)"};
			model.addAttribute("types", types);
			return "editGift.jsp";
		} else {
			giftService.editGift(gift);
			return "redirect:/home";
		}
	}
	
	// Delete Gift:
	@DeleteMapping("/gift/delete/{id}")
	public String deleteGift(@PathVariable("id") Long id) {
		giftService.deleteGift(id);
		return "redirect:/home";
	}
	
	// Purchase Gift
	@DeleteMapping("/gift/purchase/{id}")
	public String purchaseGift(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		giftService.deleteGift(id);
		
		//Add Flash Attribute purchaseSuccess on successful purchase
		
		// Referenced by <c:if> in home.jsp
		redirectAttributes.addFlashAttribute("purchaseSuccess", "true");
		return "redirect:/home";
	}

}
