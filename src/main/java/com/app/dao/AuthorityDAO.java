package com.app.dao;

import com.app.entity.Authority;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorityDAO extends JpaRepository<Authority, Integer> {
    // Additional methods if needed
}