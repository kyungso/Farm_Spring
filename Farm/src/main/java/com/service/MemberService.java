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


}
