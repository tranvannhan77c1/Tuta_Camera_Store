package com.app.service;

import com.app.entity.Account;

public interface AccountService {
    Account findByUsername(String username);

    Account getAccountFromPrincipal();
}
