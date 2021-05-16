package com.Day.crm.workbench.service;

import com.Day.crm.workbench.domain.Tran;
import com.Day.crm.workbench.domain.TranHistory;

import java.util.List;
import java.util.Map;

public interface TranService {
    boolean save(Tran t, String customerName);

    Tran detail(String id);

    List<TranHistory> getTranHistoryListByTranId(String tranId);

    boolean changeStage(TranHistory th);

    Map<String, Object> getCharts();
}
