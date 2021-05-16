package com.Day.crm.workbench.web.controller;

import com.Day.crm.settings.domain.User;
import com.Day.crm.settings.service.UserService;
import com.Day.crm.settings.service.impl.UserServiceImpl;
import com.Day.crm.utils.*;
import com.Day.crm.vo.PaginationVO;
import com.Day.crm.workbench.domain.Activity;
import com.Day.crm.workbench.domain.Clue;
import com.Day.crm.workbench.domain.ClueRemark;
import com.Day.crm.workbench.domain.Tran;
import com.Day.crm.workbench.service.ActivityService;
import com.Day.crm.workbench.service.ClueService;
import com.Day.crm.workbench.service.impl.ActivityServiceImpl;
import com.Day.crm.workbench.service.impl.ClueServiceImpl;
import com.sun.java.swing.plaf.windows.WindowsBorders;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ClueController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入到线索控制器");
        String value = request.getServletPath();

        if ("/workbench/clue/getUserList.do".equals(value)){
            getUserList(request,response);
        }else if ("/workbench/clue/save.do".equals(value)){
            save(request,response);
        }else if ("/workbench/clue/detail.do".equals(value)){
            detail(request,response);
        }else if ("/workbench/clue/showActivityListByClueId.do".equals(value)){
            showActivityListByClueId(request,response);
        }else if ("/workbench/clue/unbund.do".equals(value)){
            unbund(request,response);
        }else if ("/workbench/clue/getActivityListByNameAndNotByClueId.do".equals(value)){
            getActivityListByNameAndNotByClueId(request,response);
        }else if ("/workbench/clue/bund.do".equals(value)){
            bund(request,response);
        }else if ("/workbench/clue/getActivityListByName.do".equals(value)){
            getActivityListByName(request,response);
        }else if ("/workbench/clue/convert.do".equals(value)){
            convert(request,response);
        }else if ("/workbench/clue/getClueList.do".equals(value)){
            getClueList(request,response);
        }else if ("/workbench/clue/showClueRemarkListByClueId.do".equals(value)){
            showClueRemarkListByClueId(request,response);
        }else if ("/workbench/clue/deleteRemark.do".equals(value)){
            deleteRemark(request,response);
        }else if ("/workbench/clue/saveClueRemark.do".equals(value)){
            saveClueRemark(request,response);
        }else if ("/workbench/clue/updateRemark.do".equals(value)){
            updateRemark(request,response);
        }else if ("/workbench/clue/delete.do".equals(value)){
            delete(request,response);
        }else if ("/workbench/clue/getUserListAndClue.do".equals(value)){
            getUserListAndClue(request,response);
        }else if ("/workbench/clue/update.do".equals(value)){
            update(request,response);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String fullname = request.getParameter("fullname");
        String appellation = request.getParameter("appellation");
        String owner = request.getParameter("owner");
        String company = request.getParameter("company");
        String job = request.getParameter("job");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String website = request.getParameter("website");
        String mphone = request.getParameter("mphone");
        String state = request.getParameter("state");
        String source = request.getParameter("source");
        String editBy = ((User)request.getSession().getAttribute("user")).getEditBy();
        String editTime = DateTimeUtil.getSysTime();
        String description = request.getParameter("description");
        String contactSummary = request.getParameter("contactSummary");
        String nextContactTime = request.getParameter("nextContactTime");
        String address = request.getParameter("address");

        Clue clue = new Clue();
        clue.setId(id);
        clue.setFullname(fullname);
        clue.setAppellation(appellation);
        clue.setOwner(owner);
        clue.setCompany(company);
        clue.setJob(job);
        clue.setEmail(email);
        clue.setPhone(phone);
        clue.setWebsite(website);
        clue.setMphone(mphone);
        clue.setState(state);
        clue.setSource(source);
        clue.setEditBy(editBy);
        clue.setEditTime(editTime);
        clue.setDescription(description);
        clue.setContactSummary(contactSummary);
        clue.setNextContactTime(nextContactTime);
        clue.setAddress(address);

        ClueService cs = (ClueService) ServiceFactory.getService(new ClueServiceImpl());
        boolean result = cs.update(clue);
        PrintJson.printJsonFlag(response,result);


    }

    private void getUserListAndClue(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");

        UserService us = (UserService) ServiceFactory.getService(new UserServiceImpl());
        List<User> userList = us.getUserList();
        ClueService cs = (ClueService) ServiceFactory.getService(new ClueServiceImpl());
        Clue a = cs.getClueById(id);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("userList",userList);
        map.put("a",a);
        PrintJson.printJsonObj(response,map);

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        ClueService cs = (ClueService) ServiceFactory.getService(new ClueServiceImpl());
        boolean flag = cs.delete(id);
        PrintJson.printJsonFlag(response,flag);
    }

    private void updateRemark(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String noteContent = request.getParameter("noteContent");
        String editTime = DateTimeUtil.getSysTime();
        String editBy = ((User)request.getSession().getAttribute("user")).getCreateBy();
        String editFlag = "1";
        ClueRemark cr = new ClueRemark();
        cr.setId(id);
        cr.setNoteContent(noteContent);
        cr.setEditTime(editTime);
        cr.setEditBy(editBy);
        cr.setEditFlag(editFlag);

        ClueService cs = (ClueService) ServiceFactory.getService(new ClueServiceImpl());
        boolean result = cs.updateRemark(cr);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("success",result);
        map.put("cr",cr);
        PrintJson.printJsonObj(response,map);
    }

    private void saveClueRemark(HttpServletRequest request, HttpServletResponse response) {
        String clueId = request.getParameter("clueId");
        String noteContent = request.getParameter("noteContent");
        String id = UUIDUtil.getUUID();
        String createBy = ((User)request.getSession().getAttribute("user")).getCreateBy();
        String createTime = DateTimeUtil.getSysTime();
        String editFlag = "0";
        ClueRemark cr = new ClueRemark();
        cr.setId(id);
        cr.setClueId(clueId);
        cr.setCreateBy(createBy);
        cr.setCreateTime(createTime);
        cr.setNoteContent(noteContent);
        cr.setEditFlag(editFlag);
        ClueService cs = (ClueService) ServiceFactory.getService(new ClueServiceImpl());
        Boolean result = cs.saveClueRemark(cr);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("success",result);
        map.put("cr",cr);
        PrintJson.printJsonObj(response,map);
    }

    private void deleteRemark(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        ClueService cs = (ClueService) ServiceFactory.getService(new ClueServiceImpl());
        boolean result = cs.deleteRemark(id);
        PrintJson.printJsonFlag(response,result);
    }

    private void showClueRemarkListByClueId(HttpServletRequest request, HttpServletResponse response) {
        String clueId = request.getParameter("clueId");
        ClueService cs = (ClueService) ServiceFactory.getService(new ClueServiceImpl());
        List<ClueRemark> crList = cs.showClueRemarkListByClueId(clueId);
        PrintJson.printJsonObj(response,crList);
    }

    private void getClueList(HttpServletRequest request, HttpServletResponse response) {
        //页码
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = Integer.valueOf(pageNoStr);
        //每页展现的记录数
        String pageSizeStr = request.getParameter("pageSize");
        int pageSize = Integer.valueOf(pageSizeStr);

        //略过的个数
        int skipCount = (pageNo - 1)*pageSize;
        Map<String,Object> map = new HashMap();
        map.put("pageSize",pageSize);
        map.put("skipCount",skipCount);
        ClueService cs = (ClueService) ServiceFactory.getService(new ClueServiceImpl());

        PaginationVO<Clue> vo = cs.getClueList(map);
        PrintJson.printJsonObj(response,vo);


    }

    private void convert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("进入转换为交易");
        String flag = request.getParameter("flag");
        String clueId = request.getParameter("clueId");

        String createBy = ((User)request.getSession().getAttribute("user")).getCreateBy();
        //添加交易的清空下（手动挑勾了）
        Tran t = null;
        if("a".equals(flag)){
            t = new Tran();
           String money = request.getParameter("money");
           String name = request.getParameter("name");
           String expectedDate = request.getParameter("expectedDate");
           String stage = request.getParameter("stage");
           String activityId = request.getParameter("activityId");

           String id = UUIDUtil.getUUID();
           String createTime = DateTimeUtil.getSysTime();

           t.setMoney(money);
           t.setName(name);
           t.setExpectedDate(expectedDate);
           t.setStage(stage);
           t.setActivityId(activityId);
           t.setId(id);
           t.setCreateBy(createBy);
           t.setCreateTime(createTime);

        }
        ClueService cs = (ClueService) ServiceFactory.getService(new ClueServiceImpl());
        boolean flag2 = cs.convert(clueId,t,createBy);
        if(flag2){
            response.sendRedirect(request.getContextPath()+"/workbench/clue/index.jsp");
        }
    }

    private void getActivityListByName(HttpServletRequest request, HttpServletResponse response) {

        String aname = request.getParameter("aname");
        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());
        List<Activity> activityList = as.getActivityListByName(aname);
        PrintJson.printJsonObj(response,activityList);
    }

    private void bund(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入新增关联信息");
        String clueId = request.getParameter("clueId");
        String[] activityIds = request.getParameterValues("activityId");

        ClueService cs = (ClueService) ServiceFactory.getService(new ClueServiceImpl());

        boolean result = cs.bund(clueId,activityIds);
        PrintJson.printJsonFlag(response,result);
    }

    private void getActivityListByNameAndNotByClueId(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入模糊查询市场活动信息");
        String clueId = request.getParameter("clueId");
        String aname = request.getParameter("aname");
        Map<String,String> map = new HashMap<String, String>();
        map.put("clueId",clueId);
        map.put("aname",aname);
        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());
        List<Activity> activityList = as.getActivityListByNameAndNotByClueId(map);
        PrintJson.printJsonObj(response,activityList);
    }

    private void unbund(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入到接触关联");
        String id = request.getParameter("id");
        ClueService cs = (ClueService) ServiceFactory.getService(new ClueServiceImpl());
        boolean result = cs.unbund(id);
        PrintJson.printJsonFlag(response,result);
    }

    private void showActivityListByClueId(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入到线索备注信息展示");
        //clueId
        String id = request.getParameter("id");
        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());
        List<Activity> activityList = as.showActivityListByClueId(id);
        PrintJson.printJsonObj(response,activityList);
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入线索信息详情页");
        String id = request.getParameter("id");
        ClueService cs = (ClueService) ServiceFactory.getService(new ClueServiceImpl());
        Clue clue = cs.detail(id);
        request.setAttribute("c",clue);
        request.getRequestDispatcher("/workbench/clue/detail.jsp").forward(request,response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入线索信息添加");
        String id = UUIDUtil.getUUID();
        String fullname = request.getParameter("fullname");
        String appellation = request.getParameter("appellation");
        String owner = request.getParameter("owner");
        String company = request.getParameter("company");
        String job = request.getParameter("job");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String website = request.getParameter("website");
        String mphone = request.getParameter("mphone");
        String state = request.getParameter("state");
        String source = request.getParameter("source");
        String createBy = ((User)request.getSession().getAttribute("user")).getCreateBy();
        String createTime = DateTimeUtil.getSysTime();
        String description = request.getParameter("description");
        String contactSummary = request.getParameter("contactSummary");
        String nextContactTime = request.getParameter("nextContactTime");
        String address = request.getParameter("address");

        Clue clue = new Clue();
        clue.setWebsite(website);
        clue.setState(state);
        clue.setSource(source);
        clue.setPhone(phone);
        clue.setOwner(owner);
        clue.setNextContactTime(nextContactTime);
        clue.setMphone(mphone);
        clue.setJob(job);
        clue.setId(id);
        clue.setFullname(fullname);
        clue.setEmail(email);
        clue.setDescription(description);
        clue.setCreateTime(createTime);
        clue.setCreateBy(createBy);
        clue.setContactSummary(contactSummary);
        clue.setCompany(company);
        clue.setAppellation(appellation);
        clue.setAddress(address);
        System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAA==========="+clue);

        ClueService cs = (ClueService) ServiceFactory.getService(new ClueServiceImpl());
        boolean result = cs.save(clue);
        PrintJson.printJsonFlag(response,result);
    }

    private void getUserList(HttpServletRequest request, HttpServletResponse response) {
        UserService us = (UserService) ServiceFactory.getService(new UserServiceImpl());
        List<User> list = us.getUserList();
        PrintJson.printJsonObj(response,list);
    }
}
