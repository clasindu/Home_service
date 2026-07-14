package com.homeservice.category.controller;

import com.homeservice.category.dto.CategoryDto;
import com.homeservice.category.repository.IssueCategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/categories")
@RequiredArgsConstructor
public class CategoryController {

    private final IssueCategoryRepository categoryRepository;

    @GetMapping
    public List<CategoryDto> list() {
        return categoryRepository.findAll().stream()
                .map(c -> new CategoryDto(c.getId(), c.getName(), c.getDescription()))
                .toList();
    }
}
