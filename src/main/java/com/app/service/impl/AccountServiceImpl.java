package com.app.service.impl;

import com.app.dao.AccountDAO;
import com.app.entity.Account;
import com.app.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountDAO accountDAO;
    @Override
    public Account findByUsername(String username) {
        return accountDAO.findByUsername(username);
    }

    @Override
    public Account getAccountFromPrincipal() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String username = userDetails.getUsername();
            return findByUsername(username);
        }
        return null;
    }
}
