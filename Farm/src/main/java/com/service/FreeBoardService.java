package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.FreeBoardDAO;
import com.dto.FreeBoardDTO;
import com.dto.PageDTO;

@Service("freeBoardService")
public class FreeBoardService {
	
	@Autowired
	FreeBoardDAO dao;
	
	public List<FreeBoardDTO> selectAll(){
		return dao.selectAll();
	}
	
	public int boardWrite(FreeBoardDTO dto) {
		return dao.boardWrite(dto);		
	}
	
	public FreeBoardDTO selectByNum(int board_num) {
		int n = dao.readCnt(board_num);
		FreeBoardDTO dto= dao.selectByNum(board_num);
		return dto;
	}
	
	public int updateByNum(FreeBoardDTO dto) {
		return dao.updateByNum(dto);
	}
	
	public int deleteByNum(int board_num) {
		return dao.deleteByNum(board_num);
	}
		
	
	public PageDTO page(int curPage,HashMap<String, String> map) {
		return dao.page(curPage, map);		
	}

}
