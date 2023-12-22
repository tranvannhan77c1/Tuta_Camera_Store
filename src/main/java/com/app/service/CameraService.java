package com.app.service;

import com.app.entity.Camera;

import java.util.List;
import java.util.Optional;

public interface CameraService {
    List<Camera> findAll();
    Camera findById(Integer id);
    List<Camera> findByCategoryId(Integer cid);
    List<Camera> findByBrandId(Integer cid);
}
