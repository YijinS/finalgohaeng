package com.jscb.gohaeng.dao;


import javax.servlet.http.HttpSession;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.DepositDto;
import com.jscb.gohaeng.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(MemberDto dto) {
		
		sqlSession.insert("member.insert", dto);
		
	}

	@Override
	public String getPwdHash(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDto getData(String id) {
		MemberDto dto = sqlSession.selectOne("member.getData", id);
		return dto;
	}
	


	@Override
	public void delete(String id) {
		sqlSession.delete("member.delete", id);
		
	}

	@Override
	public boolean isExist(String inputId) {
		String id = sqlSession.selectOne("member.isExist", inputId);
		if(id != null && id != "")	
			return true;
		else
			return false;
	}


//	@Override
//	public void updatePwd(Map<String, String> map) {
//		sqlSession.update("member.updatePwd", map);
//		
//	}

	@Override
	public void updateProfile(MemberDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateDeposit(DepositDto dto) {
		
		sqlSession.update("member.updateDeposit",dto);
		
	}

	@Override
	public void updateAuthKey(MemberDto dto) {
		sqlSession.update("member.updateAuthKey",dto);
		
	}

	@Override
	public void userAuthStatus(String email) {
		sqlSession.update("member.userAuthStatus", email);
		
	}

	@Override
	public void update(MemberDto dto) {
		sqlSession.update("member.update", dto);
		
	}

	public String getId(Map<String, String> map) {
		return sqlSession.selectOne("member.getId", map);
	}

}
