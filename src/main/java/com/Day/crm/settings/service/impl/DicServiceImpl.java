package com.Day.crm.settings.service.impl;

import com.Day.crm.settings.dao.DicTypeDao;
import com.Day.crm.settings.dao.DicValueDao;
import com.Day.crm.settings.domain.DicType;
import com.Day.crm.settings.domain.DicValue;
import com.Day.crm.settings.service.DicService;
import com.Day.crm.utils.SqlSessionUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DicServiceImpl implements DicService {
    private DicTypeDao dicTypeDao = SqlSessionUtil.getSqlSession().getMapper(DicTypeDao.class);
    private DicValueDao dicValueDao = SqlSessionUtil.getSqlSession().getMapper(DicValueDao.class);


    /**
     *
     * @return map
     * map里存的所有的DicValue，key是typeCode+"List"
     */
    public Map<String, List<DicValue>> getAll() {

        //创建要返回的空Map,存每个typeCode关联的数据
        Map<String,List<DicValue>> map = new HashMap<String,List<DicValue>>();

        //先拿到DicType表里所有信息    的code（也就是DicValue表里的TypeCode属性）
        List<DicType> typeList = dicTypeDao.getDicTypeList();
        //遍历集合拿到所有的code（也就是DicValue表里的TypeCode属性）
        for (DicType dicType : typeList) {
            String typeCode = dicType.getCode();
            //通过typeCode拿到DicValue表中每一条typeCode关联的数据
            List<DicValue> dicValueList = dicValueDao.getDicValueListByTypeCode(typeCode);
            map.put(typeCode+"List",dicValueList);

        }
        return map;
    }
}
