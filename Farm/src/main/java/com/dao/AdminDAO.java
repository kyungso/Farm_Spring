package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.AdminDTO;
import com.dto.FreeBoardDTO;
import com.dto.MemberDTO;

@Repository("adminDAO")
public class AdminDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public int admin_memberCount() {
		return template.selectOne("admin_memberCount");
	}
	public int admin_orderCount() {
		return template.selectOne("admin_orderCount");
	}
	
	public AdminDTO adminLogin(Map<String, String> map) {
		return template.selectOne("adminLogin",map);
	}
	
	public List<MemberDTO> adminMemberList() {
		return template.selectList("admin_MemberList");
	}
	
	public List<Integer> admin_FruitCount(){
		
		List<Integer> list = new ArrayList<>();
		for (int i = 1; i < 13; i++) {
			String month="0"+i;
			list.add(template.selectOne("admin_FruitCount",month));
		}
		return list;
	}
	
	public List<FreeBoardDTO> admin_Board(){
		return template.selectList("admin_BoardList");
	}
}
