package com.app.dao;

import com.app.entity.Camera;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CameraDAO extends JpaRepository<Camera, Integer> {
    // Additional methods if needed
}