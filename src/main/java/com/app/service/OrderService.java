package com.app.service;

import com.app.entity.Order;
import com.fasterxml.jackson.databind.JsonNode;

public interface OrderService {
    Order create(JsonNode order);
}
