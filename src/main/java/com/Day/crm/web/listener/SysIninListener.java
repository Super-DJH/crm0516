package com.Day.crm.web.listener;

import com.Day.crm.settings.domain.DicValue;
import com.Day.crm.settings.service.DicService;
import com.Day.crm.settings.service.impl.DicServiceImpl;
import com.Day.crm.utils.ServiceFactory;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.*;

public class SysIninListener implements ServletContextListener {

    
    public void contextInitialized(ServletContextEvent event) {

        System.out.println("服务器缓存处理数据字典开始");


        ServletContext application = event.getServletContext();
        DicService ds = (DicService) ServiceFactory.getService(new DicServiceImpl());
       /* 返回的应该是：
                map里存的所有的DicValue，key是typeCode+"List"
                然后全部存入上下文域对象，通过typeCode+"List"拿到
       * */
        Map<String, List<DicValue>> map = ds.getAll();
        Set<String> set = map.keySet();
        for (String key : set) {
            application.setAttribute(key,map.get(key));
        }

        System.out.println("服务器缓存处理数据字典结束");

        //把阶段和可能性保存再一个map中，方便以后使用
        Map<String,String> pMap = new HashMap<String, String>();

        ResourceBundle rb = ResourceBundle.getBundle("Stage2Possibility");
        Enumeration<String> rbKeys = rb.getKeys();
        while (rbKeys.hasMoreElements()){
            String key = rbKeys.nextElement();
            String value = rb.getString(key);
            pMap.put(key,value);
        }
        application.setAttribute("pMap",pMap);

    }
}
