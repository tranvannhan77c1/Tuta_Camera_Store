package com.app.controller;

import com.app.service.AccountService;
import com.app.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SecurityController {
    @Autowired
    AccountService accountService;
    @Autowired
    SessionService sessionService;

    @RequestMapping("/login/form")
    public String loginForm(){
        return "customer/page/login";
    }

    @RequestMapping("/login/success")
    public String loginSuccess(){
        return "redirect:/shop";
    }

    @RequestMapping("/login/error")
    public String loginError(Model model){
        model.addAttribute("message", "Sai thông tin của Tài Khoản !");
        return "customer/page/login";
    }


    @RequestMapping("/unauthoried")
    public String loginUnauthoried(Model model){
        model.addAttribute("message", "Bạn không có quyền truy cập !");
        return "customer/page/login";
    }

    @RequestMapping("/logout/success")
    public String logout(Model model) {
        model.addAttribute("message", "Đăng Xuất Thành Công");
        return "customer/page/login";
    }

    @RequestMapping("/logout")
    public String logout() {
        /*sessionService.remove("account");*/
        return "customer/page/login";
    }
}
