package com.Day.crm.settings.web.controller;

import com.Day.crm.settings.domain.User;
import com.Day.crm.settings.service.UserService;
import com.Day.crm.settings.service.impl.UserServiceImpl;
import com.Day.crm.utils.MD5Util;
import com.Day.crm.utils.PrintJson;
import com.Day.crm.utils.ServiceFactory;
import com.Day.crm.utils.SqlSessionUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class UserController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入到用户控制器");
        String value = request.getServletPath();
        if ("/settings/user/login.do".equals(value)){
            login(request,response);
        }else if ("/settings/user/xxx.do".equals(value)){

        }
    }


    private void login(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入验证登录");
        String username = request.getParameter("userName");
        String passwrd= request.getParameter("passWord");
        String password = MD5Util.getMD5(passwrd);
        String ip = request.getRemoteAddr();
        //火狐  127.0.0.1
        //ie    0:0:0:0:0:0:0:1
        //谷歌  0:0:0:0:0:0:0:1
        //System.out.println("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"+ip);

        UserService us = (UserService) ServiceFactory.getService(new UserServiceImpl());
        try {
            User user = us.login(username,password,ip);
            request.getSession().setAttribute("user",user);
            //执行到这里表示执行成功应返回 "success":true
            PrintJson.printJsonFlag(response,true);
            //System.out.println(user);

        }catch (Exception e){
            e.printStackTrace();
            //执行此处，表示执行失败，应返回两个数据"success":false,"msg":"失败的原因***"
            String msg = e.getMessage();
            Map<String,Object> map = new HashMap<String, Object>();
            map.put("success",false);
            map.put("msg",msg);

            PrintJson.printJsonObj(response,map);
        }

    }


}
