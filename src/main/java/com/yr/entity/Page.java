package com.yr.entity;


import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class Page<T> {

    private Integer totalPage;
    private Integer pageNum;
    private List<T> list = new ArrayList<>();

}