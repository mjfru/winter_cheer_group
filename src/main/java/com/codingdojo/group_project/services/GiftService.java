package com.codingdojo.group_project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.group_project.models.Gift;
import com.codingdojo.group_project.repositories.GiftRepository;

@Service
public class GiftService {
	
	@Autowired
	private GiftRepository giftRepo;
	
	// Read All:
	public List<Gift> allGifts() {
		return giftRepo.findAll();
	}
	
	// Read One:
	public Gift findOneGift(Long id) {
		Optional<Gift> registeredGift = giftRepo.findById(id);
		if (registeredGift.isPresent()) {
			return registeredGift.get();
		} else {
			return null;
		}
	}
	
	// Create a Gift:
	public Gift createGift(Gift newGift) {
		return giftRepo.save(newGift);
	}
	
	// Edit Gift:
	public Gift editGift(Gift editedGift) {
		return giftRepo.save(editedGift);
	}
	
	// Delete Gift:
	public void deleteGift(Long id) {
		giftRepo.deleteById(id);
	}
}
