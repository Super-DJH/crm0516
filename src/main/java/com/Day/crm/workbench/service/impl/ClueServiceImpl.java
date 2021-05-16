package com.Day.crm.workbench.service.impl;

import com.Day.crm.utils.DateTimeUtil;
import com.Day.crm.utils.SqlSessionUtil;
import com.Day.crm.utils.UUIDUtil;
import com.Day.crm.vo.PaginationVO;
import com.Day.crm.workbench.dao.*;
import com.Day.crm.workbench.domain.*;
import com.Day.crm.workbench.service.ClueService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ClueServiceImpl implements ClueService {
    //线索相关
    private ClueDao clueDao = SqlSessionUtil.getSqlSession().getMapper(ClueDao.class);
    private ClueActivityRelationDao clueActivityRelationDao = SqlSessionUtil.getSqlSession().getMapper(ClueActivityRelationDao.class);
    private ClueRemarkDao clueRemarkDao = SqlSessionUtil.getSqlSession().getMapper(ClueRemarkDao.class);

    //客户相关
    private CustomerDao customerDao = SqlSessionUtil.getSqlSession().getMapper(CustomerDao.class);
    private CustomerRemarkDao customerRemarkDao = SqlSessionUtil.getSqlSession().getMapper(CustomerRemarkDao.class);

    //联系人相关
    private ContactsDao contactsDao = SqlSessionUtil.getSqlSession().getMapper(ContactsDao.class);
    private ContactsRemarkDao contactsRemarkDao = SqlSessionUtil.getSqlSession().getMapper(ContactsRemarkDao.class);
    private ContactsActivityRelationDao contactsActivityRelationDao = SqlSessionUtil.getSqlSession().getMapper(ContactsActivityRelationDao.class);

    //交易相关
    private TranDao tranDao = SqlSessionUtil.getSqlSession().getMapper(TranDao.class);
    private TranHistoryDao tranHistoryDao = SqlSessionUtil.getSqlSession().getMapper(TranHistoryDao.class);





    public boolean save(Clue clue) {
        boolean result = true;
        int a = clueDao.save(clue);
        if (a != 1){
            result = false;
        }

        return result;
    }

    public Clue detail(String id) {
        Clue clue = clueDao.detail(id);
        return clue;
    }

    public boolean unbund(String id) {
        boolean result = true;
        int a = clueActivityRelationDao.unbund(id);
        if(a != 1){
            result = false;
        }

        return result;
    }

    public boolean bund(String clueId,String[] activityIds) {
        boolean result = true;

        for (String activityId : activityIds) {

            ClueActivityRelation car = new ClueActivityRelation();
            car.setClueId(clueId);
            car.setActivityId(activityId);
            car.setId(UUIDUtil.getUUID());

            int a = clueActivityRelationDao.bund(car);
            if(a != 1){
                result = false;
            }
        }

        return result;
    }

    //线索转换
    public boolean convert(String clueId, Tran t, String createBy) {
        boolean flag = true;
        String createTime = DateTimeUtil.getSysTime();

        //(1) 获取到线索id，通过线索id获取线索对象（线索对象当中封装了线索的信息）
        Clue c = clueDao.getClueById(clueId);
        //(2) 通过线索对象提取客户信息，当该客户不存在的时候，新建客户（根据公司的名称精确匹配，判断该客户是否存在！）
        String company = c.getCompany();
        Customer cus = customerDao.getCustomerByName(company);
        if(cus == null){
            cus = new Customer();
            cus.setWebsite(c.getWebsite());
            cus.setPhone(c.getPhone());
            cus.setOwner(c.getOwner());
            cus.setNextContactTime(c.getNextContactTime());
            cus.setName(company);
            cus.setId(UUIDUtil.getUUID());
            cus.setDescription(c.getDescription());
            cus.setCreateTime(createTime);
            cus.setCreateBy(createBy);
            cus.setContactSummary(c.getContactSummary());
            cus.setAddress(c.getAddress());
            //如果客户不存在添加客户
            int flag2 = customerDao.save(cus);
            if (flag2 != 1){
                flag = false;
            }
        }
        //经过第二步的处理，我们已经拿到了客户的信息，如果要使用客户的id，直接cus.getId
        //-------------------------------------------------------------------------
        //(3) 通过线索对象提取联系人信息，保存联系人
        Contacts con = new Contacts();
        con.setSource(c.getSource());
        con.setOwner(c.getOwner());
        con.setNextContactTime(c.getNextContactTime());
        con.setMphone(c.getMphone());
        con.setJob(c.getJob());
        con.setId(UUIDUtil.getUUID());
        con.setFullname(c.getFullname());
        con.setEmail(c.getEmail());
        con.setDescription(c.getDescription());
        con.setCustomerId(cus.getId());
        con.setCreateTime(createTime);
        con.setCreateBy(createBy);
        con.setContactSummary(c.getContactSummary());
        con.setAppellation(c.getAppellation());
        con.setAddress(c.getAddress());
        //添加联系人
        int flag3 = contactsDao.save(con);
        if(flag3 != 1){
            flag = false;
        }
        //经过第三步的处理，我们已经拿到了联系人的信息，如果要使用联系人的id，直接con.getId
        //-------------------------------------------------------------------------
        //(4) 线索备注转换到客户备注以及联系人备注
        //先通过clueId拿到线索备注集合
        List<ClueRemark> clueRemarkList = clueRemarkDao.getClueRemarkListByClueId(clueId);

        //转换到客户备注以及联系人备注
        CustomerRemark customerRemark = null;
        ContactsRemark contactsRemark = null;
        //遍历拿到的线索备注集合
        for (ClueRemark clueRemark : clueRemarkList) {
            //每次遍历都新建一个客户备注，并把线索备注的信息保存再客户备注内，customerId选用上面拿到的
            customerRemark = new CustomerRemark();
            customerRemark.setId(UUIDUtil.getUUID());
            customerRemark.setNoteContent(clueRemark.getNoteContent());
            customerRemark.setCreateBy(createBy);
            customerRemark.setCreateTime(createTime);
            customerRemark.setEditFlag("0");
            customerRemark.setCustomerId(cus.getId());
            //信息保存完后把客户备注信息添加到表内
            int flag2 = customerRemarkDao.save(customerRemark);
            if (flag2 != 1){
                flag = false;
            }

            //每次遍历都新建一个联系人备注，并把线索备注的信息保存再联系人备注内，contactsId选用上面拿到的
            contactsRemark = new ContactsRemark();
            contactsRemark.setId(UUIDUtil.getUUID());
            contactsRemark.setNoteContent(clueRemark.getNoteContent());
            contactsRemark.setCreateBy(createBy);
            contactsRemark.setCreateTime(createTime);
            contactsRemark.setEditFlag("0");
            contactsRemark.setContactsId(con.getId());
            //信息保存完后把联系人备注信息添加到表内
            int flag4 = contactsRemarkDao.save(contactsRemark);

            if (flag4 != 1){
                flag = false;
            }

        }
        //(5) “线索和市场活动”的关系转换到“联系人和市场活动”的关系
        //先通过clueId拿到表中对应三联表的对象
        List<ClueActivityRelation> carList =clueActivityRelationDao.getListByClueId(clueId);
        //遍历集合，拿到clueId对应的avtivityId，再加上uuid和联系人id创建表
        ContactsActivityRelation car = null;
        for (ClueActivityRelation clueActivityRelation : carList) {
            car = new ContactsActivityRelation();
            car.setId(UUIDUtil.getUUID());
            car.setActivityId(clueActivityRelation.getActivityId());
            car.setContactsId(con.getId());

            //信息保存完后把car添加到联系人和市场活动表中
            int flag2 = contactsActivityRelationDao.save(car);
            if (flag2 != 1){
                flag = false;
            }
        }
        //(6) 如果有创建交易需求，创建一条交易
        if (t != null){
            //这里应该根据客户的需求，添加除了转换前临时加的交易信息外，是否把可以加上的也加上
            //这里采取的是都加上（如果客户没该需求，该条不要加）
            t.setSource(c.getSource());
            t.setOwner(c.getOwner());
            t.setNextContactTime(c.getNextContactTime());
            t.setDescription(c.getDescription());
            t.setCustomerId(cus.getId());
            t.setContactSummary(c.getContactSummary());
            t.setContactsId(con.getId());

            //添加交易
            int flag2 = tranDao.save(t);
            if (flag2 != 1){
                flag = false;
            }

            //(7) 如果创建了交易，则创建一条该交易下的交易历史(所以这一步得再if语句里面，如果没交易的话就没有这一步)
            TranHistory th = new TranHistory();
            th.setCreateBy(createBy);
            th.setCreateTime(createTime);
            th.setExpectedDate(t.getExpectedDate());
            th.setId(UUIDUtil.getUUID());
            th.setMoney(t.getMoney());
            th.setTranId(t.getId());
            th.setStage(t.getStage());
            //创建该交易的交易历史
            int flag4 = tranHistoryDao.save(th);
            if (flag4 != 1){
                flag = false;
            }

        }
        //8) 删除线索备注(也可以通过外键clueId删除，这里采用遍历clueRemarkList集合，通过每个对象的clueId删除)
        for (ClueRemark clueRemark : clueRemarkList) {

            int flag2 = clueRemarkDao.delete(clueRemark);
            if (flag2 != 1){
                flag = false;
            }
        }
        //(9) 删除线索和市场活动的关系
        for (ClueActivityRelation clueActivityRelation : carList) {
            int flag2 = clueActivityRelationDao.delete(clueActivityRelation);
            if (flag2 != 1){
                flag = false;
            }
        }
        //(10) 删除线索
        int flag2 = clueDao.delete(clueId);
        if (flag2 != 1){
            flag = false;
        }




        return flag;
    }

    public PaginationVO<Clue> getClueList(Map<String, Object> map) {
        PaginationVO<Clue> vo = new PaginationVO<Clue>();
        List<Clue> clueList = clueDao.getClueList(map);
        int a = clueDao.getClueCount();
        vo.setDatalist(clueList);
        vo.setTotal(a);


        return vo;
    }

    public List<ClueRemark> showClueRemarkListByClueId(String clueId) {
        List<ClueRemark> crList = clueRemarkDao.showClueRemarkListByClueId(clueId);
        return crList;
    }

    public boolean deleteRemark(String id) {
        boolean flag = true;

        int a = clueRemarkDao.deleteRemark(id);
        if (a != 1){
            flag = false;
        }
        return flag;
    }

    public Boolean saveClueRemark(ClueRemark cr) {
        boolean flag = true;
        int a = clueRemarkDao.saveClueRemark(cr);
        if (a != 1){
            flag = false;
        }

        return flag;
    }

    public boolean updateRemark(ClueRemark cr) {
        boolean flag = true;

        int a = clueRemarkDao.updateRemark(cr);
        if (a != 1){
            flag=false;
        }

        return flag;
    }

    public boolean delete(String id) {
        boolean flag = true;
        int a = clueDao.delete(id);
        if (a != 1){
            flag = false;
        }

        return flag;
    }

    public Clue getClueById(String id) {
        Clue clue = clueDao.getClueById(id);

        return clue;
    }

    public boolean update(Clue clue) {
        boolean flag = true;

        int a = clueDao.update(clue);
        if (a != 1){
            flag = false;
        }

        return flag;
    }


}
