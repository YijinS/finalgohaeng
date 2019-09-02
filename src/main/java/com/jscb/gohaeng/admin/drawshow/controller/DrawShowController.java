package com.jscb.gohaeng.admin.drawshow.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.jscb.gohaeng.admin.drawshow.service.DrawShowService;

@Controller
@RequestMapping("/admin/drawshow/")
public class DrawShowController {
   
   @Autowired
   private DrawShowService drawshowservice;
   
   @RequestMapping("lotto/list")
   public ModelAndView lottolist(HttpServletRequest request) {
	   
	   int category = 0;
      drawshowservice.getList(request,category);
      
      return new ModelAndView("admin.drawshow.lotto.list");
      
      
   }
   
   @RequestMapping("pension/list")
   public ModelAndView pensionList(HttpServletRequest request) {
      
	   int category = 1;
      drawshowservice.getList(request,category);
      
      return new ModelAndView("admin.drawshow.pension.list");
      
      
   }
   

}
