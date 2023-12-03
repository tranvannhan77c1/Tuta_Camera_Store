package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedirectController {
    @RequestMapping("/home/index")
    public String home() {
        return "customer/index";
    }

    @RequestMapping("/cart/view")
    public String cart() {
        return "customer/page/cart";
    }

    @RequestMapping("/checkout")
    public String checkout() {
        return "customer/page/checkout";
    }

    @RequestMapping("/confirmation")
    public String confirmation() {
        return "customer/page/confirmation";
    }

    @RequestMapping("/contact")
    public String contact() {
        return "customer/page/contact";
    }

    @RequestMapping("/forgotpassword")
    public String forgotpassword() {
        return "customer/page/forgotpassword";
    }

    @RequestMapping("/login")
    public String login() {
        return "customer/page/login";
    }

    @RequestMapping("/orderdetail")
    public String orderdetail() {
        return "customer/page/orderdetail";
    }

    @RequestMapping("/profile")
    public String profile() {
        return "customer/page/profile";
    }

    @RequestMapping("/register")
    public String register() {
        return "customer/page/register";
    }

    @RequestMapping("/shop")
    public String shop() {
        return "customer/page/shop";
    }

    @RequestMapping("/single-product")
    public String singleproduct() {
        return "customer/page/single-product";
    }
}
