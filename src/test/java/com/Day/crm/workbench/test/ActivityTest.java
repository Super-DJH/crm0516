package com.Day.crm.workbench.test;

import com.Day.crm.utils.ServiceFactory;
import com.Day.crm.utils.SqlSessionUtil;
import com.Day.crm.utils.UUIDUtil;
import com.Day.crm.workbench.dao.ActivityDao;
import com.Day.crm.workbench.domain.Activity;
import com.Day.crm.workbench.service.ActivityService;
import com.Day.crm.workbench.service.impl.ActivityServiceImpl;
import org.junit.Assert;
import org.junit.Test;

public class ActivityTest {
    @Test
    public void testSave(){
        Activity activity = new Activity();
        activity.setId(UUIDUtil.getUUID());
        activity.setName("城市宣传");

        ActivityService as = (ActivityService) ServiceFactory.getService(new ActivityServiceImpl());
        int result = as.save(activity);
        Assert.assertEquals(2,result);
        System.out.println("完成修改");
    }
}
