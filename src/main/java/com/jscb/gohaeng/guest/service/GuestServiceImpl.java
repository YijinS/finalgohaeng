package com.jscb.gohaeng.guest.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jscb.gohaeng.dao.MemberDao;
import com.jscb.gohaeng.dto.MemberDto;

@Service
public class GuestServiceImpl implements GuestService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Map<String,Object> checkID(String id) {
		
		Map<String,Object> map =new HashMap<>();
		map.put("usedId", memberDao.isExist(id));
		
		return map;
	}

	@Override
	public void addMember(HttpServletRequest request) throws ParseException {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String birth = request.getParameter("birthday");
		Date birthday = df.parse(birth);
		
		String addr = "주소API 필요";
		String hp = request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");
		int checkSms = Integer.parseInt(request.getParameter("checkSms"));
		int checkEmail = Integer.parseInt(request.getParameter("checkEmail"));
		int checkSales = Integer.parseInt(request.getParameter("checkSales"));
		
		MemberDto dto = new MemberDto(id,pwd,name,0,birthday,hp,email,addr,checkSms,checkEmail,checkSales);
		
		memberDao.insert(dto);
	}

	@Override
	public Map<String,Object> checkLogin(String id, String pwd) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		MemberDto dto = memberDao.getData(id);

		if(dto != null)
			if(dto.getPwd().equals(pwd)) {
				map.put("check", true);
				return map;
			}
		
		map.put("check",false);
		return map;
	}

	@Override
	public void successLogin(String id,HttpSession session) {
		
		session.setAttribute("member", memberDao.getData(id));
		
	}

	@Override
	public void logout(HttpSession session) {
		
		session.removeAttribute("member");
		
	}

}
