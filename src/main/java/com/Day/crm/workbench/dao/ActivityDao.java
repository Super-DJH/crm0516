package com.Day.crm.workbench.dao;

import com.Day.crm.settings.domain.User;
import com.Day.crm.workbench.domain.Activity;

import java.util.List;
import java.util.Map;

public interface ActivityDao {
    int save(Activity activity);

    //获取total
    int getTotalByCondition(Map map);

    //获取dataList
    List<Activity> getActivityListByCondition(Map map);

    //查询实际市场活动表删除了多少条
    int delete(String[] ids);

    //市场活动更新模块展示
    Activity getActivityByActivityId(String id);

    //市场活动修改操作
    int update(Activity activity);

    //市场活动信息详情信息展示
    Activity detail(String id);

    List<Activity> showActivityListByClueId(String id);

    List<Activity> getActivityListByNameAndNotByClueId(Map<String, String> map);

    List<Activity> getActivityListByName(String aname);
}
