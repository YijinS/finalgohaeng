package com.jscb.gohaeng.guest.service;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.TempKey;
import com.jscb.gohaeng.dao.MemberDao;
import com.jscb.gohaeng.dto.MemberDto;

@Service
public class GuestServiceImpl implements GuestService {

	@Autowired
	private MemberDao memberDao;
	//email인증 관련
	@Autowired 
	private JavaMailSender mailSender; 

	
	@Override
	public Map<String,Object> checkID(String id) {
		
		Map<String,Object> map =new HashMap<>();
		map.put("usedId", memberDao.isExist(id));
		
		return map;
	}
	
	@Transactional
	@Override
	public void addMember(HttpServletRequest request) throws ParseException, MessagingException, UnsupportedEncodingException {
		MemberDto dto = new MemberDto();
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		dto.setName(name);
		dto.setId(id);
		dto.setPwd(pwd);
		
		String birth = request.getParameter("birthday");
		Date birthday = df.parse(birth);
		dto.setBirthday(birthday);
		
		String addr = "주소API 필요";
		String hp = request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		String email = request.getParameter("email");
		dto.setAddr(addr);
		dto.setHp(hp);
		dto.setEmail(email);
		
		int checkSms = Integer.parseInt(request.getParameter("checkSms"));
		int checkEmail = Integer.parseInt(request.getParameter("checkEmail"));
		int checkSales = Integer.parseInt(request.getParameter("checkSales"));
		dto.setCheckSms(checkSms);
		dto.setCheckEmail(checkEmail);
		dto.setCheckSales(checkSales);
		//MemberDto dto = new MemberDto(id,pwd,name,0,birthday,hp,email,addr,checkSms,checkEmail,checkSales);
		
		memberDao.insert(dto);

		// 임의의 authKey 생성
		String authkey = new TempKey().getKey(50, false);

		// 인증키 저장
		dto.setAuthKey(authkey);
		System.out.println("----------->key" + authkey);
		memberDao.updateAuthKey(dto);
		
		// 이메일 작성 관련
		MailService sendMail = new MailService(mailSender);

		sendMail.setSubject("[Goheang복권] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<a href='http://localhost:8080/gohaeng/guest/emailConfirm?email=")
				.append(dto.getEmail())
				.append("&key=")
				.append(authkey)
				.append("' target='_blenk'>이메일 인증 확인</a>").toString());

		sendMail.setFrom("jeongjihye6@gmail.com", "관리자");
		sendMail.setTo(dto.getEmail());
		sendMail.send();

//		request.setAttribute("email", email);
//		request.setAttribute("authkey", authkey);
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
	public void successLogin(ModelAndView mView
			,HttpServletRequest request
			,HttpSession session
			) {
		
		String id = request.getParameter("id");
		session.setAttribute("member", memberDao.getData(id));
		String url = request.getParameter("url");
		System.out.println(url);

		
//		if(url != null && url != "") {
//			mView.setViewName("");
//		}
		
		mView.setViewName("redirect:"+url);
			
	}

	@Override
	public void logout(HttpSession session) {
		
		session.removeAttribute("member");
		
	}

	@Override
	public void userAuthStatus(String email) {
		memberDao.userAuthStatus(email);
		
	}
	
	
//	@Override
//	public void emailAuth(HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
//		
//		MemberDto dto = new MemberDto();
//		
//		//임의의 authKey 생성
//		String authkey = new TempKey().getKey(50, false);
//		//파라미터로 이메일 전달받기
//		String email = request.getParameter("email");
//		dto.setEmail(email);
//		//인증키 저장
//		dto.setAuthKey(authkey);
//		System.out.println("----------->key"+authkey);
//		memberDao.updateAuthKey(dto);
//		
//		//이메일 작성 관련 
//		MailService sendMail = new MailService(mailSender);
//		
//		sendMail.setSubject("[Goheang복권] 회원가입 이메일 인증번호 발송");
//		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증번호]</h1>")
//				.append("<br>다음의 인증번호를 입력해주세요")
//				.append(authkey)
//				.toString());
//		sendMail.setFrom("jeongjihye6@gmail.com", "관리자");
//		sendMail.setTo(dto.getEmail());
//		sendMail.send();
//		
//		request.setAttribute("email", email);
//		request.setAttribute("authkey", authkey);
//	}

}
