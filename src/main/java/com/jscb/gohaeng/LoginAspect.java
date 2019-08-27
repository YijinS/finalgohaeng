package com.jscb.gohaeng;

import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.MemberDto;

@Aspect
@Component
public class LoginAspect {
	
	@Around("execution(* auth*(..))")
	public Object loginCheck(ProceedingJoinPoint joinPoint)
			throws Throwable{
		//aop 가 적용된 메소드에 전달된 값을 Object[] 로 얻어오기
		Object[] args=joinPoint.getArgs();
		//로그인 여부
		boolean isLogin=false;
		HttpServletRequest request=null;
		for(Object tmp:args) {
			//인자로 전달된 값중에 HttpServletRequest type 을 찾아서
			if(tmp instanceof HttpServletRequest) {
				//원래 type 으로 casting
				request=(HttpServletRequest)tmp;
				//HttpSession 객체 얻어내기 
				HttpSession session=request.getSession();
				//세션에 "member" 라는 키값으로 저장된게 있는지 확인(로그인 여부)
				if(session.getAttribute("member") != null) {
					isLogin=true;
				}
			}
		}
		//로그인 했는지 여부
		if(isLogin){
			// aop 가 적용된 메소드를 실행하고 
			Object obj=joinPoint.proceed();
			// 리턴되는 값을 리턴해 주기 
			return obj;
		}
		//원래 가려던 url 정보 읽어오기
		//getReqeustURI 프로젝트명도가져옴 (/gohaeng/...)  <-> getContextPath 프로젝트만 가져옴(/gohaeng)
		String getUrl=request.getRequestURI();		
		String url ="";
		
		String[] a = getUrl.split("/");
		for(int i=2;i<a.length;i++)
			url += "/"+ a[i];
		
		//GET 방식 전송 파라미터를 query string 으로 얻어오기
		String query=request.getQueryString();
		
		String encodedUrl=null;
		if(query==null) {//전달된 파라미터가 없다면 
			//encodedUrl=URLEncoder.encode(url);
			encodedUrl = URLEncoder.encode(url,"utf-8");
		}else {
			encodedUrl=URLEncoder.encode(url+"?"+query,"utf-8");
		}
		//ModelAndView 객체를 생성해서 	
		ModelAndView mView=new ModelAndView();
		//로그인 폼으로 리다일렉트 시키도록 view page 설정
		mView.setViewName
		("redirect:/guest/login?url="+encodedUrl);
		
		//여기서 생성한 객체를 리턴해 준다. 
		return mView;
	}
	

	@Around("execution(* soso*(..))")
	public Object Check(ProceedingJoinPoint joinPoint)
			throws Throwable{
		//aop 가 적용된 메소드에 전달된 값을 Object[] 로 얻어오기
		Object[] args=joinPoint.getArgs();
		//로그인 여부
		boolean isCheck=false;
		HttpServletRequest request=null;
		for(Object tmp:args) {
			//인자로 전달된 값중에 HttpServletRequest type 을 찾아서
			if(tmp instanceof HttpServletRequest) {
				//원래 type 으로 casting
				request=(HttpServletRequest)tmp;
				//HttpSession 객체 얻어내기 
				HttpSession session=request.getSession();
				//세션에 "member" 라는 키값으로 저장된게 있는지 확인(로그인 여부)
				if(session.getAttribute("check") != null) {
					isCheck=true;
				}
			}
		}
		//로그인 했는지 여부
		if(isCheck){
			// aop 가 적용된 메소드를 실행하고 
			Object obj=joinPoint.proceed();
			// 리턴되는 값을 리턴해 주기 
			return obj;
		}
		//원래 가려던 url 정보 읽어오기
		//getReqeustURI 프로젝트명도가져옴 (/gohaeng/...)  <-> getContextPath 프로젝트만 가져옴(/gohaeng)
		String getUrl=request.getRequestURI();		
		String url ="";
		
		String[] a = getUrl.split("/");
		for(int i=2;i<a.length;i++)
			url += "/"+ a[i];
		
		//GET 방식 전송 파라미터를 query string 으로 얻어오기
		String query=request.getQueryString();
		
		String encodedUrl=null;
		if(query==null) {//전달된 파라미터가 없다면 
			//encodedUrl=URLEncoder.encode(url);
			encodedUrl = URLEncoder.encode(url,"utf-8");
		}else {
			encodedUrl=URLEncoder.encode(url+"?"+query,"utf-8");
		}
		//ModelAndView 객체를 생성해서 	
		ModelAndView mView=new ModelAndView();
		//로그인 폼으로 리다일렉트 시키도록 view page 설정
		mView.setViewName
		("redirect:/mypage/personaldata/modifylogin?url="+encodedUrl);
		
		//여기서 생성한 객체를 리턴해 준다. 
		return mView;
	}
	
}
