package com.app.rest.controller;

import com.app.entity.Camera;
import com.app.service.CameraService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/cameras")
public class CameraRestController {
    @Autowired
    CameraService cameraService;

    @GetMapping("{id}")
    public Camera getOne(@PathVariable("id") Integer id){
        return cameraService.findById(id);
    }
}
