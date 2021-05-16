package com.Day.crm.workbench.dao;


import com.Day.crm.workbench.domain.ClueActivityRelation;
import com.Day.crm.workbench.domain.ContactsActivityRelation;

import java.util.List;
import java.util.Map;

public interface ClueActivityRelationDao {


    int unbund(String id);

    int bund(ClueActivityRelation car);

    List<ClueActivityRelation> getListByClueId(String clueId);

    int delete(ClueActivityRelation clueActivityRelation);
}
