package com.jscb.gohaeng.admin.drawshow.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.DrawShowDao;
import com.jscb.gohaeng.dto.DrawShowDto;
import com.jscb.gohaeng.dto.MemberDto;

@Service
public class DrawShowServiceImpl implements DrawShowService {

   @Autowired
   private DrawShowDao drawshowdao;
   
	static final int PAGE_ROW_COUNT = 5;
	static final int PAGE_DISPLAY_COUNT = 5;

   @Override
   public void getList(HttpServletRequest request, int category) {
      DrawShowDto dto = new DrawShowDto();
      // System.out.println("hiddenValue:"+request.getAttribute("hiddenValue"));
      System.out.println("pramhiddenValue:" + request.getParameter("hiddenValue"));
      // System.out.println("pramhiddenValues:"+request.getParameterValues("hiddenValue"));

      // System.out.println("ckBox:"+request.getParameterValues("ckBox"));
		int pageNum = 1;
		
		String strPageNum = request.getParameter("pageNum");
		if (strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		dto.setCategory(category);
		int totalRow = drawshowdao.getCount(dto);
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		if (totalPageCount < endPageNum) {
			endPageNum = totalPageCount; 
		}
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
      
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
      List<DrawShowDto> list = drawshowdao.getList(dto);

      request.setAttribute("list", list);
      request.setAttribute("startPageNum", startPageNum);
      request.setAttribute("endPageNum", endPageNum);
      request.setAttribute("pageNum", pageNum);
      request.setAttribute("totalPageCount", totalPageCount);
      request.setAttribute("totalRow", totalRow);
      
   }

@Override
public void apply(HttpServletRequest request,HttpSession session) throws ParseException {
	
	 DrawShowDto dto = new DrawShowDto();
	 
	 DateFormat df = new SimpleDateFormat("yyyyMMdd");
	 
	 int category = Integer.parseInt(request.getParameter("category"));
	 
	 String drawDate_ = request.getParameter("drawDate");
	 Date drawDate = df.parse(drawDate_);
	 
	 String name = request.getParameter("name");
	 String email = request.getParameter("email");
	 
	 MemberDto member = (MemberDto)session.getAttribute("member");
	 dto.setMemberId(member.getId());
	 dto.setCategory(category);
	 dto.setDrawDate(drawDate);
	 dto.setName(name);
	 dto.setEmail(email);
	 
	 drawshowdao.insert(dto);
	 
}

@Override
public void getMyList(ModelAndView mView, HttpSession session,HttpServletRequest request) {
	
	 DrawShowDto dto = new DrawShowDto();
	 
	 MemberDto member = (MemberDto) session.getAttribute("member");
	 String memberId = member.getId();
	 
	 int pageNum = 1;
		
		String strPageNum = request.getParameter("pageNum");
		if (strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		System.out.println("********name"+member.getName());
		dto.setName(member.getName());
		int totalRow = drawshowdao.getCount(dto);
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		System.out.println("*******totalRow"+totalRow);
		System.out.println("*******pagenum"+pageNum);
		System.out.println("*******totalPageCount"+totalPageCount);
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		System.out.println("*******startPageNum"+startPageNum);
		System.out.println("*******endPageNum"+endPageNum);
		if (totalPageCount < endPageNum) {
			endPageNum = totalPageCount; 
		}
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		System.out.println("************"+totalPageCount);
		if (memberId != null) {
			dto.setMemberId(memberId);
			List<DrawShowDto> list = drawshowdao.getMyList(dto);
			mView.addObject("list", list);
		}
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("pageNum", pageNum);
		mView.addObject("totalPageCount", totalPageCount);
		mView.addObject("totalRow", totalRow);
}

}