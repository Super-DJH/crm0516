package com.Day.crm.vo;

import java.util.List;

public class PaginationVO<T> {
    private List<T> datalist;
    private int total;

    @Override
    public String toString() {
        return "PaginationVO{" +
                "datalist=" + datalist +
                ", total=" + total +
                '}';
    }

    public List<T> getDatalist() {
        return datalist;
    }

    public void setDatalist(List<T> datalist) {
        this.datalist = datalist;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
