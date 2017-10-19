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
<<<<<<< HEAD
=======

	public MemberDTO memberUpdate(MemberDTO dto) {
		template.update("memberUpdate", dto);
		HashMap<String, String> map=new HashMap<>();
		map.put("userid", dto.getUserid());
		map.put("passwd", dto.getPasswd());
		return this.memberLogin(map);
	}

	public void memberDelete(String userid) {
		template.delete("memberDelete",userid);
	}
>>>>>>> branch 'master' of https://github.com/kyungso/Farm_Spring.git
	

}
