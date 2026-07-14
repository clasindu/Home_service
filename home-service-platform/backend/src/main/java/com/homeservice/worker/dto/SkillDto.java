package com.homeservice.worker.dto;

import java.util.UUID;

public record SkillDto(
        UUID id,
        Integer categoryId,
        String categoryName,
        Short proficiencyLevel
) {
}
