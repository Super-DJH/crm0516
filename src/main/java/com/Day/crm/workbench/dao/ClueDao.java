package com.Day.crm.workbench.dao;


import com.Day.crm.workbench.domain.Activity;
import com.Day.crm.workbench.domain.Clue;
import com.Day.crm.workbench.domain.ClueRemark;

import java.util.List;
import java.util.Map;

public interface ClueDao {


    int save(Clue clue);

    Clue detail(String id);

    Clue getClueById(String clueId);

    int delete(String clueId);

    List<Clue> getClueList(Map<String, Object> map);

    int getClueCount();

    int update(Clue clue);
}
