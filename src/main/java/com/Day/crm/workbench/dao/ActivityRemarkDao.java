package com.Day.crm.workbench.dao;


import com.Day.crm.workbench.domain.ActivityRemark;

import java.util.List;

public interface ActivityRemarkDao {

    //先查询市场活动关联的备注表有多少条信息
    int getCountByIds(String[] ids);
    //后查询实际市场活动备注表删除了多少条信息
    int deleteByIds(String[] ids);

    List<ActivityRemark> showRemarkListByAid(String activityId);

    /*备注信息删除操作*/
    int deleteRemark(String id);

    //备注信息添加
    int saveRemark(ActivityRemark ar);

    //备注信息修改
    int updateRemark(ActivityRemark ar);
}
