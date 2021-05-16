package com.Day.crm.workbench.service;


import com.Day.crm.vo.PaginationVO;
import com.Day.crm.workbench.domain.Activity;
import com.Day.crm.workbench.domain.ActivityRemark;

import java.util.List;
import java.util.Map;

public interface ActivityService {
    int save(Activity activity);

    PaginationVO<Activity> pageList(Map map);


    boolean delete(String[] ids);

    Map<String, Object> getUserListAndActivity(String id);

    int update(Activity activity);

    Activity detail(String id);

    List<ActivityRemark> showRemarkListByAid(String activityId);

    boolean deleteRemark(String id);

    boolean saveRemark(ActivityRemark ar);

    boolean updateRemark(ActivityRemark ar);

    List<Activity> showActivityListByClueId(String id);

    List<Activity> getActivityListByNameAndNotByClueId(Map<String, String> map);

    List<Activity> getActivityListByName(String aname);
}
