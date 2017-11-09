package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	MemberDAO dao;

	public MemberDTO memberLogin(HashMap<String, String> map) {
		return dao.memberLogin(map);
	}

	public MemberDTO memberIdCheck(String userid) {
		return dao.memberIdCheck(userid);
		
	}

	public void memberAdd(MemberDTO dto) {
		dao.memberAdd(dto);
		
	}

	public MemberDTO memberUpdate(MemberDTO dto) {
		return dao.memberUpdate(dto);
	}

	public void memberDelete(String userid) {
		dao.memberDelete(userid);
		
	}

	public MemberDTO findSnsId(String sns_id) {
		return dao.findSnsId(sns_id);
	}

	public void snsAdd(MemberDTO dto) {
		dao.snsAdd(dto);
		
	}

	public MemberDTO SNSmemberUpdate(HashMap<String, String> map) {
		return dao.snsUpdate(map);
	}

	public String emailCheck(String email) {
		return dao.emailCheck(email);
	}

	public void changePw(HashMap<String, String> map) {
		dao.changePw(map);
		
	}

	public String idCheckForPw(String userid) {
		return dao.idCheckForPw(userid);
	}

	public String NameCheck(HashMap<String, String> map) {
		return dao.NameCheck(map);
	}

	public void changePw_id(HashMap<String, String> map) {
		 dao.changePw_id(map);
		
	}

	public MemberDTO mypage(String userid) {
		return dao.mypage(userid);
	}


}
