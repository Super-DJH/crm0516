package com.Day.crm.workbench.service.impl;

import com.Day.crm.settings.dao.UserDao;
import com.Day.crm.settings.domain.User;
import com.Day.crm.settings.service.UserService;
import com.Day.crm.utils.SqlSessionUtil;
import com.Day.crm.vo.PaginationVO;
import com.Day.crm.workbench.dao.ActivityDao;
import com.Day.crm.workbench.dao.ActivityRemarkDao;
import com.Day.crm.workbench.domain.Activity;
import com.Day.crm.workbench.domain.ActivityRemark;
import com.Day.crm.workbench.service.ActivityService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class ActivityServiceImpl implements ActivityService {
    private ActivityDao activityDao = SqlSessionUtil.getSqlSession().getMapper(ActivityDao.class);
    private ActivityRemarkDao activityRemarkDao = SqlSessionUtil.getSqlSession().getMapper(ActivityRemarkDao.class);
    private UserDao userDao = SqlSessionUtil.getSqlSession().getMapper(UserDao.class);


    public int save(Activity activity) {
        int result = activityDao.save(activity);
        //System.out.println("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ=========="+result);
        return result;
    }

    public PaginationVO<Activity> pageList(Map map) {
        //获取total
        int total = activityDao.getTotalByCondition(map);
        //获取dataList
        List<Activity> dataList = activityDao.getActivityListByCondition(map);
        //创建vo
        PaginationVO<Activity> vo = new PaginationVO<Activity>();
        vo.setTotal(total);
        vo.setDatalist(dataList);
        //System.out.println("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP==========="+vo);
        //返回vo
        return vo;
    }

    public boolean delete(String[] ids) {
        boolean s = true;
        //先查询市场活动关联的备注表有多少条信息
        int result1 = activityRemarkDao.getCountByIds(ids);
        //后查询实际市场活动备注表删除了多少条信息
        int result2 = activityRemarkDao.deleteByIds(ids);
        //比较是否一致，不一致返回false
        if (result1 != result2){
            s = false;
        }
        //查询实际市场活动表删除了多少条
        int result3 = activityDao.delete(ids);
        if (result3==0){
            s = false;
        }
        return s;
    }

    public Map<String, Object> getUserListAndActivity(String id) {
        List<User> userList = userDao.getUserList();

        Activity activity = activityDao.getActivityByActivityId(id);

        Map<String,Object> map = new HashMap<String, Object>();
        map.put("userlist",userList);
        map.put("a",activity);
        return map;
    }

    public int update(Activity activity) {
        int result = activityDao.update(activity);
        return result;
    }

    public Activity detail(String id) {
        Activity a = activityDao.detail(id);

        return a;
    }

    public List<ActivityRemark> showRemarkListByAid(String activityId) {
        List<ActivityRemark> remarkList= activityRemarkDao.showRemarkListByAid(activityId);

        return remarkList;
    }

    public boolean deleteRemark(String id) {
        boolean result = true;

        int a = activityRemarkDao.deleteRemark(id);
        if (a == 0){
            result = false;
        }

        return result;
    }

    public boolean saveRemark(ActivityRemark ar) {
        boolean result = true;
        int a = activityRemarkDao.saveRemark(ar);
        if(a==0){
            result = false;
        }
        
        return result;
    }

    public boolean updateRemark(ActivityRemark ar) {
        boolean result = true;
        int a = activityRemarkDao.updateRemark(ar);
        if(a != 1){
            result = false;
        }

        return result;
    }

    public List<Activity> showActivityListByClueId(String id) {
        List<Activity> activityList = activityDao.showActivityListByClueId(id);
        return activityList;
    }

    public List<Activity> getActivityListByNameAndNotByClueId(Map<String, String> map) {
        List<Activity> activityList = activityDao.getActivityListByNameAndNotByClueId(map);
        return activityList;
    }

    public List<Activity> getActivityListByName(String aname) {
        List<Activity> activityList = activityDao.getActivityListByName(aname);


        return activityList;
    }


}
