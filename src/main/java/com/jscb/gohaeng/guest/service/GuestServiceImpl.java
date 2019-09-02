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
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.TempKey;
import com.jscb.gohaeng.dao.MemberDao;
import com.jscb.gohaeng.dao.WidthrawDao;
import com.jscb.gohaeng.dto.MemberDto;
import com.jscb.gohaeng.dto.WidthdrawDto;

@Service
public class GuestServiceImpl implements GuestService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private WidthrawDao wdDao;
	
	// email인증 관련
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public Map<String, Object> checkID(String id) {

		Map<String, Object> map = new HashMap<>();
		map.put("usedId", memberDao.isExist(id));

		return map;
	}

	@Transactional
	@Override
	public void addMember(HttpServletRequest request)
			throws ParseException, MessagingException, UnsupportedEncodingException {
		MemberDto dto = new MemberDto();

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		dto.setName(name);
		dto.setId(id);
		dto.setPwd(encoder.encode(pwd));

		String birth = request.getParameter("birthday");
		Date birthday = df.parse(birth);
		dto.setBirthday(birthday);		
		/* String addr = "주소API 필요"; */
		String addr = request.getParameter("zipCode") +" "+request.getParameter("addr1")+" "+request.getParameter("addr2");
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
		// MemberDto dto = new
		// MemberDto(id,pwd,name,0,birthday,hp,email,addr,checkSms,checkEmail,checkSales);

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
				.append("<a href='http://localhost:8080/gohaeng/guest/emailConfirm?email=").append(dto.getEmail())
				.append("&key=").append(authkey).append("' target='_blenk'>이메일 인증 확인</a>").toString());

		sendMail.setFrom("jeongjihye6@gmail.com", "관리자");
		sendMail.setTo(dto.getEmail());
		sendMail.send();

		request.setAttribute("email", email);
//		request.setAttribute("authkey", authkey);
	}

	@Override
	public Map<String, Object> checkLogin(String id, String pwd) {

		Map<String, Object> map = new HashMap<String, Object>();

		MemberDto dto = memberDao.getData(id);

		if(dto != null)
			if(BCrypt.checkpw(pwd, dto.getPwd())) {
				map.put("check", true);
				map.put("enable", dto.getAuthStatus());
				return map;
			}

		map.put("check", false);
		return map;
	}
	
	public Map<String,Object> check(String id, String email) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		MemberDto dto = memberDao.getData(id);

		if(dto != null)
			if(dto.getEmail().equals(email)) {
				map.put("check", true);
				return map;
			}
		
		map.put("check",false);
		return map;
	}
	
	
	@Override
	public void successLogin(ModelAndView mView, HttpServletRequest request, HttpSession session) {

		String id = request.getParameter("id");
		session.setAttribute("member", memberDao.getData(id));
		String url = request.getParameter("url");
		System.out.println(url);

		
		if(url != null && url != "")
			mView.setViewName("redirect:"+url);
		else
			mView.setViewName("redirect:/");

	}

	@Override
	public void logout(HttpSession session) {

		session.removeAttribute("member");
		session.removeAttribute("check");

	}

	@Override
	public void userAuthStatus(String email) {
		memberDao.userAuthStatus(email);

	}


	@Override
	public void withdraw(HttpSession session) {
		session.removeAttribute("member");
		
	}

	@Override
	public void delete(String id) {
		memberDao.delete(id);
		
	}

	@Override
	public void insert(WidthdrawDto dto) {
		wdDao.insert(dto);
		
	}

	/*-------------------id찾기-----------------------*/
	@Override
	public void findid(String name, String email, ModelAndView mView) {
//		String name = request.getParameter("name");
//		String email = request.getParameter("email");
//		//System.out.println(name+"*****************************");
//		//System.out.println(email+"*****************************");
//		
//		request.setAttribute("name", name);
//		
//		Map<String,String> map = new HashMap<>();
//		map.put("name", name);
//		map.put("email", email);
//		
//		String id = memberDao.getId(map);
//		request.setAttribute("id", id);
		if (name != null && email != null) {
			Map<String, String> map = new HashMap<>();
			map.put("name", name);
			map.put("email", email);

			String id = memberDao.getId(map);
			if (id != null) {
				boolean checkid = memberDao.isExist(id);

				if (checkid) {
					mView.addObject("id", id);
					mView.addObject("name", name);
				} else {
					id = "none";
					mView.addObject("id", id);
					name = "none";
					mView.addObject("name", name);
				}
			}else {
				id = "none";
				mView.addObject("id", id);
				name = "none";
				mView.addObject("name", name);
			}
		}

	}

	/*-------------------pw찾기-----------------------*/
	@Transactional
	@Override
	public void findpw(String id, String email, ModelAndView mView)
			throws MessagingException, UnsupportedEncodingException {

//		MemberDto dto = new MemberDto();
//		
//		String id = request.getParameter("id");
//		String email = request.getParameter("email");
//		
//		if(id != null || email != null) {
//			String pwd = "";
//			for (int i = 0; i < 12; i++) {
//				pwd += (char) ((Math.random() * 26) + 97);
//			}
//			
//			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//			
//			dto.setPwd(encoder.encode(pwd));
//			
//			//dto.setPwd(pwd);
//			
//			
//			Map<String,String> map = new HashMap<>();
//			map.put("id", id);
//			map.put("pwd", encoder.encode(pwd));
//			
//			memberDao.updatePwd(map);
//			
//			// 이메일 작성 관련
//			MailService sendMail = new MailService(mailSender);
//
//			sendMail.setSubject("[Goheang복권] 임시 비밀번호");
//			sendMail.setText(new StringBuffer().append("<h1>[임시 비밀번호 발급]</h1>")
//					.append("임시 비밀번호가 발급되었습니다.<br>")
//					.append("임시 비밀번호로 로그인 후 꼭 비밀번호를 변경해 주세요.<br>")
//					.append(pwd)
//					.toString());
//
//			sendMail.setFrom("jeongjihye6@gmail.com", "관리자");
//			sendMail.setTo(email);
//			sendMail.send();
//			
//			request.setAttribute("id", id);
//			request.setAttribute("email", email);
//		}

		// 1. 입력한 id와 일치하는 MemberDto 데이터를 꺼내옴
		MemberDto dto = memberDao.getData(id);

		// 2. 입력한 id가 db에 존재 할때
		if (dto != null) {
			// 2-1. 입력한 이메일과 꺼내온 email이 같은지
			if (dto.getEmail().equals(email)) {

				String pwd = "";
				for (int i = 0; i < 12; i++) {
					pwd += (char) ((Math.random() * 26) + 97);
				}

				// 임시비밀번호 암호화
				BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
				dto.setPwd(encoder.encode(pwd));

				memberDao.update(dto);

				/*
				 * Map<String, String> map = new HashMap<>(); map.put("id", id); map.put("pwd",
				 * encoder.encode(pwd));
				 * 
				 * memberDao.updatePwd(map);
				 */

				// 이메일 작성 관련
				MailService sendMail = new MailService(mailSender);

				sendMail.setSubject("[Goheang복권] 임시 비밀번호");
				sendMail.setText(new StringBuffer().append("<h1>[임시 비밀번호 발급]</h1>").append("임시 비밀번호가 발급되었습니다.<br>")
						.append("임시 비밀번호로 로그인 후 꼭 비밀번호를 변경해 주세요.<br>").append(pwd).toString());

				sendMail.setFrom("jeongjihye6@gmail.com", "관리자");
				sendMail.setTo(email);
				sendMail.send();

//	            request.setAttribute("id", id);
//	            request.setAttribute("email", email);
				mView.addObject("id", id);
				mView.addObject("email", email);
				mView.addObject("dto", dto);
			}
		} else
			mView.addObject("dto", dto);

	}

	
	//	회원탈퇴
	@Transactional  
	public void deleteMember(HttpSession session, WidthdrawDto dto) {
		MemberDto memberdto = (MemberDto)session.getAttribute("member");
		String id = memberdto.getId();	
		wdDao.insert(dto);
		memberDao.delete(id);
		session.removeAttribute("member");
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
