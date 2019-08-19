package com.jscb.gohaeng.admin.drawshow.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jscb.gohaeng.dao.DrawShowDao;
import com.jscb.gohaeng.dto.DrawShowDto;

@Service
public class DrawShowServiceImpl implements DrawShowService {

	@Autowired
	private DrawShowDao drawshowdao;

	@Override
	public void getLottoApplyList(HttpServletRequest request) {
		DrawShowDto dto = new DrawShowDto();

		if (request.getParameter("hiddenValue") != null) {
			String pram = request.getParameter("hiddenValue");
			String[] arr = pram.split(",");

			int[] arr1 = new int[arr.length];
			for (int i = 0; i < arr.length; i++)
				arr1[i] = Integer.parseInt(arr[i]);

			HashMap map = new HashMap();
			map.put("arr1", arr1);
			drawshowdao.updateEnable(map);
		}
		List<DrawShowDto> list = drawshowdao.getLottoApplyList(dto);

		request.setAttribute("list", list);
		
	}

	

}

