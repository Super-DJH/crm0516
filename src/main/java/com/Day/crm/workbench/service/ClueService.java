package com.Day.crm.workbench.service;

import com.Day.crm.vo.PaginationVO;
import com.Day.crm.workbench.domain.Activity;
import com.Day.crm.workbench.domain.Clue;
import com.Day.crm.workbench.domain.ClueRemark;
import com.Day.crm.workbench.domain.Tran;

import java.util.List;
import java.util.Map;


public interface ClueService {
    boolean save(Clue clue);

    Clue detail(String id);

    boolean unbund(String id);

    boolean bund(String clueId,String[] activityIds);

    boolean convert(String clueId, Tran t, String createBy);

    PaginationVO<Clue> getClueList(Map<String, Object> map);

    List<ClueRemark> showClueRemarkListByClueId(String clueId);

    boolean deleteRemark(String id);

    Boolean saveClueRemark(ClueRemark cr);

    boolean updateRemark(ClueRemark cr);

    boolean delete(String id);

    Clue getClueById(String id);

    boolean update(Clue clue);
}
