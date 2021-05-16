package com.Day.crm.workbench.service.impl;

import com.Day.crm.utils.SqlSessionUtil;
import com.Day.crm.utils.UUIDUtil;
import com.Day.crm.workbench.dao.CustomerDao;
import com.Day.crm.workbench.dao.TranDao;
import com.Day.crm.workbench.dao.TranHistoryDao;
import com.Day.crm.workbench.domain.Customer;
import com.Day.crm.workbench.domain.Tran;
import com.Day.crm.workbench.domain.TranHistory;
import com.Day.crm.workbench.service.TranService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TranServiceImpl implements TranService {

    private TranDao tranDao = SqlSessionUtil.getSqlSession().getMapper(TranDao.class);
    private TranHistoryDao tranHistoryDao = SqlSessionUtil.getSqlSession().getMapper(TranHistoryDao.class);
    private CustomerDao customerDao = SqlSessionUtil.getSqlSession().getMapper(CustomerDao.class);

    public boolean save(Tran t, String customerName) {
        boolean flag = true;
        //第一步，先判断customerName这个客户是否存在，如果存在，使用它的Id作为customerId，如果不存在，新建该客户
        Customer customer = customerDao.getCustomerByName(customerName);
        if (customer == null){
            customer = new Customer();
            customer.setId(UUIDUtil.getUUID());
            customer.setName(customerName);
            customer.setCreateBy(t.getCreateBy());
            customer.setCreateTime(t.getCreateTime());
            int result = customerDao.save(customer);
            if (result != 1){
                flag = false;
            }
        }
        //第二步，添加交易
        t.setCustomerId(customer.getId());
        int result1 = tranDao.save(t);
        if (result1 != 1){
            flag = false;
        }
        //第三步，同时添加交易历史
        TranHistory th = new TranHistory();
        th.setId(UUIDUtil.getUUID());
        th.setStage(t.getStage());
        th.setTranId(t.getId());
        th.setMoney(t.getMoney());
        th.setExpectedDate(t.getExpectedDate());
        th.setCreateBy(t.getCreateBy());
        th.setCreateTime(t.getCreateTime());
        int result2 = tranHistoryDao.save(th);
        if (result2 != 1){
            flag = false;
        }



        return flag;
    }

    public Tran detail(String id) {
        Tran t = tranDao.detail(id);

        return t;
    }

    public List<TranHistory> getTranHistoryListByTranId(String tranId) {
        List<TranHistory> thList = tranHistoryDao.getTranHistoryListByTranId(tranId);

        return thList;
    }

    public boolean changeStage(TranHistory th) {
        boolean flag = true;
        //更改数据
        Tran t = new Tran();
        t.setId(th.getTranId());
        t.setStage(th.getStage());
        t.setEditBy(th.getCreateBy());
        t.setEditTime(th.getCreateTime());
        int a = tranDao.updateStageById(t);
        if (a != 1){
            flag = false;
        }
        //创建交易历史
        int b = tranHistoryDao.save(th);
        if (b != 1){
            flag = false;
        }
        return flag;
    }

    public Map<String, Object> getCharts() {
        //1、取总数
        int total = tranDao.getCount();
        //2、取list
        List<Map<String,Object>> dataList = tranDao.getStageAndCount();
        //3、封装成Map
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("total",total);
        map.put("dataList",dataList);
        return map;
    }


}
