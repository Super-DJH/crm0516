package com.Day.crm.settings.service;

import com.Day.crm.exception.LoginException;
import com.Day.crm.settings.domain.User;

import java.util.List;

public interface UserService {
    User login(String username, String password, String ip) throws LoginException;

    //查询所有user信息
    List<User> getUserList();
}
