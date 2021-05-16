package com.Day.crm.workbench.dao;

import com.Day.crm.workbench.domain.TranHistory;
import com.Day.crm.workbench.service.TranService;

import java.util.List;

public interface TranHistoryDao {

    int save(TranHistory th);

    List<TranHistory> getTranHistoryListByTranId(String tranId);
}
