package com.homeservice.category.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "issue_categories")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class IssueCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(columnDefinition = "text")
    private String description;
}
