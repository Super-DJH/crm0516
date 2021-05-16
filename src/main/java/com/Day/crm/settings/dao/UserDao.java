package com.Day.crm.settings.dao;

import com.Day.crm.settings.domain.User;

import java.util.List;
import java.util.Map;

public interface UserDao {

    //通过账号密码来提取信息
    User selectLogin(Map<String, String> map);

    //查询所有user信息
    List<User> getUserList();
}
