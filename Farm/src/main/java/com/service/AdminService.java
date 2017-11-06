package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminDAO;
import com.dto.AdminDTO;
import com.dto.FreeBoardDTO;
import com.dto.MemberDTO;

@Service("adminService")
public class AdminService {

	@Autowired
	AdminDAO aDAO;
	
	public int admin_memberCount() {
		return aDAO.admin_memberCount();
	}
	public int admin_orderCount() {
		return aDAO.admin_orderCount();
	}
	
	public AdminDTO adminLogin(Map<String, String> map) {
		return aDAO.adminLogin(map);
	}
	
	public List<MemberDTO> adminMemberList(){
		return aDAO.adminMemberList();
	}
	
	public List<Integer> admin_FruitCount(){
		return aDAO.admin_FruitCount();
	}
	
	public List<FreeBoardDTO> admin_Board(){
		return aDAO.admin_Board();
	}
}
	
