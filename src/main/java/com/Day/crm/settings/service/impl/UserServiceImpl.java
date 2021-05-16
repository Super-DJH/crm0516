package com.Day.crm.settings.service.impl;

import com.Day.crm.exception.LoginException;
import com.Day.crm.settings.dao.UserDao;
import com.Day.crm.settings.domain.User;
import com.Day.crm.settings.service.UserService;
import com.Day.crm.utils.DateTimeUtil;
import com.Day.crm.utils.SqlSessionUtil;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {
    private UserDao userDao = SqlSessionUtil.getSqlSession().getMapper(UserDao.class);

    public User login(String username, String password, String ip) throws LoginException {
        Map<String,String> map = new HashMap<String, String>();
        map.put("username",username);
        map.put("password",password);

        User user = userDao.selectLogin(map);
        //System.out.println(user);
        //账号密码错误
        if (user == null){
            throw new LoginException("账号密码错误");
        }
        //账号信息停封，联系管理员
        String lockState = user.getLockState();
        Integer result = Integer.valueOf(lockState);
        if(result == 0){
            throw new LoginException("账号信息停封，联系管理员");
        }
        //ip地址错误，无法登陆
        String ips = user.getAllowIps();
        if(!ips.contains(ip)){
            throw new LoginException("ip地址错误，无法登陆");
        }
        //失效时间，判断账户是否已经失效
        String expireTime = user.getExpireTime();//客户的账号失效时间
        String currentTime = DateTimeUtil.getSysTime();//现在的时间
        //System.out.println("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"+currentTime);
        if (expireTime.compareTo(currentTime) < 0){
            //失效时间减去现在时间小于0
            throw new LoginException("账号已失效（过期）");
        }

        return user;

    }

    //查询所有user信息
    public List getUserList() {
        List<User> user = userDao.getUserList();
        System.out.println("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"+user);
        return user;
    }
}
