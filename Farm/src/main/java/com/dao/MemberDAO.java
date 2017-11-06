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

	public MemberDTO findSnsId(String sns_id) {
		return template.selectOne("findSnsId",sns_id);
	}

	public void snsAdd(MemberDTO dto) {
		template.insert("snsAdd", dto);
		
	}

	public MemberDTO snsUpdate(HashMap<String, String> map) {
		template.update("snsUpdate", map);
		return template.selectOne("selectBySnsId", map.get("userid"));
		
	}

	public String emailCheck(String email) {
		return template.selectOne("emailCheck", email);
	}

	public void changePw(HashMap<String, String> map) {
		template.update("changePw", map);
		
	}

	public String idCheckForPw(String userid) {
		return template.selectOne("idCheckForPw",userid);
		
	}

	public String NameCheck(HashMap<String, String> map) {
		return template.selectOne("NameCheck",map);
	}

	public void changePw_id(HashMap<String, String> map) {
		template.update("changePw_id",map);
	}

	public MemberDTO mypage(String userid) {
		return template.selectOne("mypage",userid);
	}

}
