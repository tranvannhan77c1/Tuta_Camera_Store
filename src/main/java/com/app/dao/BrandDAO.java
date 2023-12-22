package com.app.dao;

import com.app.entity.Brand;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BrandDAO extends JpaRepository<Brand, Integer> {

}