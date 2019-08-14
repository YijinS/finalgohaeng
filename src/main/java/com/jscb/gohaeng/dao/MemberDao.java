package com.jscb.gohaeng.dao;

import com.jscb.gohaeng.dto.DepositDto;
import com.jscb.gohaeng.dto.MemberDto;

public interface MemberDao {

	//회원 정보를 저장하는 메소드
	public void insert(MemberDto dto);
	//암호화된 비밀번호를 리턴해주는 메소드
	public String getPwdHash(String id);
	//인자로 전달된 아이디에 해당하는 개인정보를 리턴해주는 메소드
	public MemberDto getData(String id);
	//회원정보를 삭제하는 메소드 
	public void delete(String id);
	//인자로 전달된 아이디가 이미 존재 하는지 여부를 리턴하는
	//메소드
	public boolean isExist(String inputId);
	//회원정보를 수정하는 메소드
	public void update(MemberDto dto);
	//비밀번호 수정하는 메소드
	public void updatePwd(MemberDto dto);
	//프로파일 이미지를 수정하는 메소드
	public void updateProfile(MemberDto dto);
	//예치금 수정
	public void updateDeposit(DepositDto dto);
}
