package com.app.dao;

import com.app.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleDAO extends JpaRepository<Role, String> {
    // Additional methods if needed
}