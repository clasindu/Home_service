package com.homeservice.ai.entity;

import com.homeservice.category.entity.IssueCategory;
import com.homeservice.user.entity.User;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import java.time.Instant;
import java.util.UUID;

@Entity
@Table(name = "ai_conversations")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AiConversation {

    @Id
    @GeneratedValue
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    // The category the agent has classified this conversation into (nullable until classified).
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private IssueCategory category;

    @CreationTimestamp
    @Column(name = "started_at", updatable = false)
    private Instant startedAt;

    @Column(name = "ended_at")
    private Instant endedAt;
}
