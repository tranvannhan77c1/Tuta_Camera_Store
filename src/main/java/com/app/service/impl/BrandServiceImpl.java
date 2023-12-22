package com.app.service.impl;

import com.app.dao.BrandDAO;
import com.app.entity.Brand;
import com.app.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BrandServiceImpl implements BrandService {
    @Autowired
    BrandDAO brandDAO;

    @Override
    public List<Brand> findAll() {
        return brandDAO.findAll();
    }
}
