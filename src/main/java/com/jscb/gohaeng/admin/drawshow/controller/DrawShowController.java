package com.jscb.gohaeng.admin.drawshow.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.admin.drawshow.service.DrawShowService;

@Controller
public class DrawShowController {
   
   @Autowired
   private DrawShowService drawshowservice;
   
   @RequestMapping("/admin/drawshow/lotto/list")
   public ModelAndView list(HttpServletRequest request) {
      
      drawshowservice.getList(request);
      
      return new ModelAndView("admin.drawshow.lotto.list");
      
      
   }
   

}
