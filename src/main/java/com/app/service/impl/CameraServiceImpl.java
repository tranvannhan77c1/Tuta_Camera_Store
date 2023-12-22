package com.app.service.impl;

import com.app.dao.CameraDAO;
import com.app.entity.Camera;
import com.app.service.CameraService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CameraServiceImpl implements CameraService {
    @Autowired
    CameraDAO cameraDAO;

    @Override
    public List<Camera> findAll(){
        return cameraDAO.findAll();
    }

    @Override
    public Camera findById(Integer id){
        return cameraDAO.findById(id).get();
    }

    @Override
    public List<Camera> findByCategoryId(Integer cid) {
        return cameraDAO.findByCategoryId(cid);
    }

    @Override
    public List<Camera> findByBrandId(Integer cid) {
        return cameraDAO.findByBrandId(cid);
    }
}
