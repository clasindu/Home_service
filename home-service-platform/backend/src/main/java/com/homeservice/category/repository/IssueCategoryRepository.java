package com.homeservice.category.repository;

import com.homeservice.category.entity.IssueCategory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface IssueCategoryRepository extends JpaRepository<IssueCategory, Integer> {
    Optional<IssueCategory> findByName(String name);
}
