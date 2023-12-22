package com.app.controller;

import com.app.dao.CategoryDAO;
import com.app.entity.Account;
import com.app.entity.Camera;
import com.app.service.AccountService;
import com.app.service.BrandService;
import com.app.service.CameraService;
import com.app.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class RedirectController {
    @Autowired
    CameraService cameraService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    BrandService brandService;

    @RequestMapping("/shop")
    public String shop(
            Model model,
            @RequestParam(name = "cid", required = false) Integer categoryId,
            @RequestParam(name = "bid", required = false) Integer brandId
    ) {
        List<Camera> items;

        if (categoryId != null) {
            items = cameraService.findByCategoryId(categoryId);
        } else if (brandId != null) {
            items = cameraService.findByBrandId(brandId);
        } else {
            items = cameraService.findAll();
        }

        model.addAttribute("items", items);
        model.addAttribute("brands", brandService.findAll());
        model.addAttribute("cates", categoryService.findAll());

        return "customer/page/shop";
    }

    @RequestMapping("/shop/product/{id}")
    public String singleproduct(Model model, @PathVariable("id") Integer id) {
        Camera item = cameraService.findById(id);
        model.addAttribute("item", item);
        return "customer/page/product";
    }

    @RequestMapping("/home/index")
    public String home() {
        return "customer/index";
    }

    @RequestMapping("/cart/view")
    public String cart() {
        return "customer/page/cart";
    }

    @RequestMapping("/checkout")
    public String checkout(Model model) {
        model.addAttribute("account", accountService.getAccountFromPrincipal());
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

    /*@RequestMapping("/login")
    public String login() {
        return "customer/page/login";
    }*/

    @RequestMapping("/orderdetail")
    public String orderdetail() {
        return "customer/page/orderdetail";
    }

    /*@RequestMapping("/profile")
    public String profile() {
        return "customer/page/profile";
    }*/

    @Autowired
    private AccountService accountService;

    @RequestMapping("/profile")
    public String userProfile(Model model) {
        model.addAttribute("account", accountService.getAccountFromPrincipal());
        return "customer/page/profile";
    }

    @RequestMapping("/register")
    public String register() {
        return "customer/page/register";
    }
}
