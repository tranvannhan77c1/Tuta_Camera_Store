package com.app.rest.controller;

import com.app.entity.Order;
import com.app.service.OrderService;
import com.fasterxml.jackson.databind.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/orders")
public class OrderRestController {
    @Autowired
    OrderService orderService;

    @PostMapping()
    public Order create(@RequestBody JsonNode order){
        return orderService.create(order);
    }
}
