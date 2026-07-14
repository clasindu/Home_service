package com.homeservice.ai.repository;

import com.homeservice.ai.entity.AiConversation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface AiConversationRepository extends JpaRepository<AiConversation, UUID> {
}
