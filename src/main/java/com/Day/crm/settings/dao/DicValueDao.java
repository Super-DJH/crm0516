package com.Day.crm.settings.dao;

import com.Day.crm.settings.domain.DicValue;

import java.util.List;

public interface DicValueDao {
    List<DicValue> getDicValueListByTypeCode(String typeCode);
}
