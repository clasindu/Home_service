package com.homeservice.auth.dto;

import com.homeservice.user.entity.Role;

import java.util.UUID;

public record AuthResponse(
        String accessToken,
        String refreshToken,
        UUID userId,
        String fullName,
        Role role
) {
}
