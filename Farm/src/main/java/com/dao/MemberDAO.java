package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate template;

	public MemberDTO memberLogin(HashMap<String, String> map) {
		return template.selectOne("memberLogin", map);
	}

	public MemberDTO memberIdCheck(String userid) {
		return template.selectOne("idCheck",userid);
	}

	public void memberAdd(MemberDTO dto) {
		template.insert("memberJoin", dto);	
	}
	

}
