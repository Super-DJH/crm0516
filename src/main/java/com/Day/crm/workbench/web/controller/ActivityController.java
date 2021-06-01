package com.Day.crm.workbench.web.controller;


import com.Day.crm.settings.domain.User;
import com.Day.crm.settings.service.UserService;
import com.Day.crm.settings.service.impl.UserServiceImpl;
import com.Day.crm.utils.*;
import com.Day.crm.vo.PaginationVO;
import com.Day.crm.workbench.domain.Activity;
import com.Day.crm.workbench.domain.ActivityRemark;
import com.Day.crm.workbench.service.ActivityService;
import com.Day.crm.workbench.service.impl.ActivityServiceImpl;

import javax.jws.soap.SOAPBinding;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ActivityController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入到市场活动控制器");
        String value = request.getServletPath();
        System.out.println(value);
        if ("/workbench/activity/getUserList.do".equals(value)){
            getUserList(request,response);
        }else if ("/workbench/activity/save.do".equals(value)){
            save(request,response);
        } else if ("/workbench/activity/pageList.do".equals(value)){
            pageList(request,response);
        }else if ("/workbench/activity/delete.do".equals(value)){
            delete(request,response);
        }else if ("/workbench/activity/getUserListAndActivity.do".equals(value)){
            getUserListAndActivity(request,response);
        }else if ("/workbench/activity/update.do".equals(value)){
            update(request,response);
        }else if ("/workbench/activity/detail.do".equals(value)){
            detail(request,response);
        }else if ("/workbench/activity/showRemarkListByAid.do".equals(value)){
            showRemarkListByAid(request,response);
        }else if ("/workbench/activity/deleteRemark.do".equals(value)){
            deleteRemark(request,response);
        }else if ("/workbench/activity/saveRemark.do".equals(value)){
            saveRemark(request,response);
        }else if ("/workbench/activity/updateRemark.do".equals(value)){
            updateRemark(request,response);
        }
    }

    private void updateRemark(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入备注信息修改");
        String id = request.getParameter("id");
        String noteContent = request.getParameter("noteContent");
        String editTime = DateTimeUtil.getSysTime();
        String editBy = ((User)request.getSession().getAttribute("user")).getName();
        String editFlag = "1";

        ActivityRemark ar = new ActivityRemark();
        ar.setId(id);
        ar.setNoteContent(noteContent);
        ar.setEditTime(editTime);
        ar.setEditBy(editBy);
        ar.setEditFlag(editFlag);

        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());
        boolean result = as.updateRemark(ar);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("success",result);
        map.put("ar",ar);
        PrintJson.printJsonObj(response,map);
        System.out.println("--");
    }

    private void saveRemark(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("备注信息添加操作");
        String noteContent = request.getParameter("noteContent");
        String activityId = request.getParameter("activityId");
        String id = UUIDUtil.getUUID();
        String createTime = DateTimeUtil.getSysTime();
        String createBy = ((User)request.getSession().getAttribute("user")).getCreateBy();
        String editFlag = "0";

        ActivityRemark ar = new ActivityRemark();
        ar.setId(id);
        ar.setNoteContent(noteContent);
        ar.setCreateTime(createTime);
        ar.setCreateBy(createBy);
        ar.setEditFlag(editFlag);
        ar.setActivityId(activityId);

        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());
        boolean result = as.saveRemark(ar);
        System.out.println("((((((((((((((((((((((((((((((((((((((=========="+result);
        System.out.println("((((((((((((((((((((((((((((((((((((((=========="+ar);
        Map<String,Object>map = new HashMap<String, Object>();
        map.put("success",result);
        map.put("ar",ar);
        PrintJson.printJsonObj(response,map);

    }

    private void deleteRemark(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入备注信息删除操作");
        String id = request.getParameter("id");
        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());
        boolean result = as.deleteRemark(id);
        PrintJson.printJsonFlag(response,result);
    }

    private void showRemarkListByAid(HttpServletRequest request, HttpServletResponse response) {
        String activityId = request.getParameter("activityId");
        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());
        List<ActivityRemark> remarkList= as.showRemarkListByAid(activityId);
        PrintJson.printJsonObj(response,remarkList);
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入市场活动信息详情信息展示");
        String id = request.getParameter("id");
        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());
        Activity a = as.detail(id);
        request.setAttribute("a",a);
        request.getRequestDispatcher("/workbench/activity/detail.jsp").forward(request,response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入更新市场活动添加操作");
        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());

        Activity activity = new Activity();
        String id = request.getParameter("id");
        String owner= request.getParameter("owner");
        String name= request.getParameter("name");
        String startDate= request.getParameter("startDate");
        String endDate= request.getParameter("endDate");
        String cost= request.getParameter("cost");
        String description= request.getParameter("description");

        //修改时间
        String editTime = DateTimeUtil.getSysTime();
        //修改人
        String editBy = ((User)request.getSession().getAttribute("user")).getCreateBy();

        activity.setId(id);
        activity.setOwner(owner);
        activity.setName(name);
        activity.setStartDate(startDate);
        activity.setEndDate(endDate);
        activity.setCost(cost);
        activity.setDescription(description);
        activity.setEditTime(editTime);
        activity.setEditBy(editBy);


        int result = as.update(activity);
        if (result == 0){
            PrintJson.printJsonFlag(response,false);
        }else {
            PrintJson.printJsonFlag(response,true);
        }
    }

    private void getUserListAndActivity(HttpServletRequest request, HttpServletResponse response) {
        //需要返回{userlist:[{},{},{},{}],市场活动(a):{} }
        System.out.println("进入市场活动更新模块展示");
        String id = request.getParameter("id");

        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());
        Map<String,Object> map = as.getUserListAndActivity(id);
        PrintJson.printJsonObj(response,map);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入到市场活动信息删除操作");
        String[] ids= request.getParameterValues("id");

        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());
        boolean result = as.delete(ids);
        PrintJson.printJsonFlag(response,result);

    }

    private void pageList(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入市场活动信息展现");
        String name = request.getParameter("name");
        String owner = request.getParameter("owner");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        //页码
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = Integer.valueOf(pageNoStr);
        //每页展现的记录数
        String pageSizeStr = request.getParameter("pageSize");
        int pageSize = Integer.valueOf(pageSizeStr);

        //略过的个数
        int skipCount = (pageNo - 1)*pageSize;

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("name",name);
        map.put("owner",owner);
        map.put("startDate",startDate);
        map.put("endDate",endDate);
        map.put("pageSize",pageSize);
        map.put("skipCount",skipCount);

        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());

        /*map和vo两种方法，由于这个可能用的比较多，这里选用vo
        * 后端要的数据：{"total":100, "dataList":[{activity},{activity},{activity}]}
        * int total  和  List<T> datalist 注：在类名上也加<T>，new的时候传什么就是什么泛型
        * */
        PaginationVO<Activity> vo = as.pageList(map);

        //System.out.println("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR================"+vo);
        PrintJson.printJsonObj(response,vo);

    }

    private void getUserList(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入查询所有user信息");
        UserService us = (UserService) ServiceFactory.getService(new UserServiceImpl());
        List<User> user = us.getUserList();
        PrintJson.printJsonObj(response,user);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入添加市场活动添加操作");
        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());

        Activity activity = new Activity();
        String id = UUIDUtil.getUUID();
        String owner= request.getParameter("owner");
        String name= request.getParameter("name");
        String startDate= request.getParameter("startDate");
        String endDate= request.getParameter("endDate");
        String cost= request.getParameter("cost");
        String description= request.getParameter("description");

        String createTime = DateTimeUtil.getSysTime();
        String createBy = ((User)request.getSession().getAttribute("user")).getCreateBy();


        System.out.println("************************************"+owner+"**"+name);

        activity.setId(id);
        activity.setOwner(owner);
        activity.setName(name);
        activity.setStartDate(startDate);
        activity.setEndDate(endDate);
        activity.setCost(cost);
        activity.setDescription(description);
        activity.setCreateTime(createTime);
        activity.setCreateBy(createBy);


        int result = as.save(activity);
        if (result == 0){
            PrintJson.printJsonFlag(response,false);
        }else {
            PrintJson.printJsonFlag(response,true);
        }
    }

}
