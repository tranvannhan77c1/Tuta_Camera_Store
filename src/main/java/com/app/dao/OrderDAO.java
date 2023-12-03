package com.app.dao;

import com.app.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderDAO extends JpaRepository<Order, Integer> {
    // Additional methods if needed
}