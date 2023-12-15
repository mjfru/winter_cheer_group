package com.codingdojo.group_project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.group_project.models.Gift;

@Repository
public interface GiftRepository extends CrudRepository<Gift, Long> {
	List<Gift> findAll();
}
