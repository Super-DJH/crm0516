package com.Day.crm.workbench.dao;

import com.Day.crm.workbench.domain.ClueRemark;

import java.util.List;

public interface ClueRemarkDao {

    List<ClueRemark> getClueRemarkListByClueId(String clueId);

    int delete(ClueRemark clueRemark);

    List<ClueRemark> showClueRemarkListByClueId(String clueId);

    int deleteRemark(String id);

    int saveClueRemark(ClueRemark cr);

    int updateRemark(ClueRemark cr);
}
