package com.Day.crm.workbench.web.controller;

import com.Day.crm.settings.domain.User;
import com.Day.crm.settings.service.UserService;
import com.Day.crm.settings.service.impl.UserServiceImpl;
import com.Day.crm.utils.DateTimeUtil;
import com.Day.crm.utils.PrintJson;
import com.Day.crm.utils.ServiceFactory;
import com.Day.crm.utils.UUIDUtil;
import com.Day.crm.workbench.dao.TranDao;
import com.Day.crm.workbench.domain.Customer;
import com.Day.crm.workbench.domain.Tran;
import com.Day.crm.workbench.domain.TranHistory;
import com.Day.crm.workbench.service.CustomerService;
import com.Day.crm.workbench.service.TranService;
import com.Day.crm.workbench.service.impl.CustomerServiceImpl;
import com.Day.crm.workbench.service.impl.TranServiceImpl;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class TranController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入到交易控制器");
        String value = request.getServletPath();

        if ("/workbench/transaction/add.do".equals(value)){
            add(request,response);
        }else if ("/workbench/transaction/getCustomerName.do".equals(value)){
            getCustomerName(request,response);
        }else if ("/workbench/transaction/save.do".equals(value)){
            save(request,response);
        }else if ("/workbench/transaction/detail.do".equals(value)){
            detail(request,response);
        }else if ("/workbench/transaction/getTranHistoryListByTranId.do".equals(value)){
            getTranHistoryListByTranId(request,response);
        }else if ("/workbench/transaction/changeStage.do".equals(value)){
            changeStage(request,response);
        }else if ("/workbench/transaction/getCharts.do".equals(value)){
            getCharts(request,response);
        }
    }

    private void getCharts(HttpServletRequest request, HttpServletResponse response) {

        TranService ts = (TranService) ServiceFactory.getService(new TranServiceImpl());
        Map<String,Object> map = ts.getCharts();
        PrintJson.printJsonObj(response,map);
    }

    private void changeStage(HttpServletRequest request, HttpServletResponse response) {
        String id = UUIDUtil.getUUID();
        String tranId = request.getParameter("id");
        String stage = request.getParameter("listStage");
        String money = request.getParameter("money");
        String expectedDate = request.getParameter("expectedDate");
        String createBy = ((User)request.getSession().getAttribute("user")).getCreateBy();
        String createTime = DateTimeUtil.getSysTime();
        TranHistory th = new TranHistory();
        th.setId(id);
        th.setTranId(tranId);
        th.setStage(stage);
        th.setMoney(money);
        th.setExpectedDate(expectedDate);
        th.setCreateTime(createTime);
        th.setCreateBy(createBy);

        TranService ts = (TranService) ServiceFactory.getService(new TranServiceImpl());

        boolean flag = ts.changeStage(th);
        Tran t = new Tran();
        t.setStage(stage);
        Map<String,String> pMap = (Map<String, String>) request.getServletContext().getAttribute("pMap");
        String possibility = pMap.get(stage);
        t.setPossibility(possibility);
        t.setEditBy(createBy);
        t.setEditTime(createTime);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("success",flag);
        map.put("t",t);
        PrintJson.printJsonObj(response,map);
    }

    private void getTranHistoryListByTranId(HttpServletRequest request, HttpServletResponse response) {
        String tranId = request.getParameter("tranId");
        TranService ts = (TranService) ServiceFactory.getService(new TranServiceImpl());
        List<TranHistory> thList = ts.getTranHistoryListByTranId(tranId);

        //加上可能性
        Map<String,String> pMap = (Map<String, String>) request.getServletContext().getAttribute("pMap");
        for (TranHistory th : thList) {
            String possibility = pMap.get(th.getStage());
            th.setPossibility(possibility);
        }
        PrintJson.printJsonObj(response,thList);
    }

    private void detail(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
        String id = request.getParameter("id");
        TranService ts = (TranService) ServiceFactory.getService(new TranServiceImpl());
        Tran t = ts.detail(id);
        //加上可能性
        Map<String,String> pMap = (Map<String, String>) request.getServletContext().getAttribute("pMap");
        String possibility = pMap.get(t.getStage());
        t.setPossibility(possibility);

        request.setAttribute("t",t);
        request.getRequestDispatcher("/workbench/transaction/detail.jsp").forward(request,response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String id = UUIDUtil.getUUID();
         String owner = request.getParameter("owner");
         String money = request.getParameter("money");
         String name = request.getParameter("name");
         String expectedDate = request.getParameter("expectedDate");
         String customerName = request.getParameter("customerName");
         String stage = request.getParameter("stage");
         String type = request.getParameter("type");
         String source = request.getParameter("source");
         String activityId = request.getParameter("activityId");
         String contactsId = request.getParameter("contactsId");
         String createBy = ((User)request.getSession().getAttribute("user")).getCreateBy();
         String createTime = DateTimeUtil.getSysTime();
         String description = request.getParameter("description");
         String contactSummary = request.getParameter("contactSummary");
         String nextContactTime = request.getParameter("nextContactTime");

        Tran t = new Tran();
        t.setId(id);
        t.setOwner(owner);
        t.setMoney(money);
        t.setName(name);
        t.setExpectedDate(expectedDate);
        t.setStage(stage);
        t.setType(type);
        t.setSource(source);
        t.setActivityId(activityId);
        t.setContactsId(contactsId);
        t.setCreateBy(createBy);
        t.setCreateTime(createTime);
        t.setDescription(description);
        t.setContactSummary(contactSummary);
        t.setNextContactTime(nextContactTime);

        TranService ts = (TranService) ServiceFactory.getService(new TranServiceImpl());
        boolean flag = ts.save(t,customerName);
        if (flag){
            response.sendRedirect(request.getContextPath() + "/workbench/transaction/index.jsp");
        }
    }

    private void getCustomerName(HttpServletRequest request, HttpServletResponse response) {

        String name = request.getParameter("name");
        CustomerService cs = (CustomerService) ServiceFactory.getService(new CustomerServiceImpl());
        List<String> sList = cs.getCustomerName(name);
        PrintJson.printJsonObj(response,sList);
    }

    private void add(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        System.out.println("进入到交易添加模块");
        UserService us = (UserService) ServiceFactory.getService(new UserServiceImpl());
        List<User> uList = us.getUserList();
        request.setAttribute("uList",uList);
        request.getRequestDispatcher("/workbench/transaction/save.jsp").forward(request,response);
    }
}
