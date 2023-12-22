package com.app.dao;

import com.app.entity.Camera;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CameraDAO extends JpaRepository<Camera, Integer> {
    @Query("SELECT c FROM Camera c WHERE c.category.id = ?1")
    List<Camera> findByCategoryId(Integer cid);
    @Query("SELECT c FROM Camera c WHERE c.brand.id = ?1")
    List<Camera> findByBrandId(Integer cid);
}