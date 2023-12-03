package com.app.dao;

import com.app.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountDAO extends JpaRepository<Account, Integer> {
    // Additional methods if needed
}
