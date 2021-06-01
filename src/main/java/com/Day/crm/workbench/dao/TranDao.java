package com.Day.crm.workbench.dao;

import com.Day.crm.workbench.domain.Tran;

import java.util.List;
import java.util.Map;

public interface TranDao {

    int save(Tran t);

    Tran detail(String id);

    int updateStageById(Tran t);

    int getCount();

    //返回List里套的Map
    List<Map<String, Object>> getStageAndCount();
}
