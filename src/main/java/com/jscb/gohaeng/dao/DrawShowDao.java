package com.jscb.gohaeng.dao;


import java.util.HashMap;
import java.util.List;

import com.jscb.gohaeng.dto.DrawShowDto;

public interface DrawShowDao {
   
   public List<DrawShowDto> getList(DrawShowDto dto);
   //enable
   public void updateEnable(HashMap map);

}