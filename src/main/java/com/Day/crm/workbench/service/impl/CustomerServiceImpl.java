package com.Day.crm.workbench.service.impl;

import com.Day.crm.utils.SqlSessionUtil;
import com.Day.crm.workbench.dao.CustomerDao;
import com.Day.crm.workbench.domain.Customer;
import com.Day.crm.workbench.service.CustomerService;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {

    private CustomerDao customerDao = SqlSessionUtil.getSqlSession().getMapper(CustomerDao.class);

    public List<String> getCustomerName(String name) {
        List<String> sList = customerDao.getCustomerName(name);

        return sList;
    }
}
