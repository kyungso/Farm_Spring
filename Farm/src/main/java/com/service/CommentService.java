package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CommentDAO;
import com.dao.FreeBoardDAO;
import com.dto.CommentDTO;
import com.dto.FreeBoardDTO;
import com.dto.PageDTO;

@Service("commentService")
public class CommentService {
	
	@Autowired
	CommentDAO dao;

	public List<CommentDTO> selectComment(int board_num) {
		return dao.selectComment(board_num);	
	}
	
	public int insertComment(CommentDTO dto) {
		return dao.insertComment(dto);
	}
	
	public int deleteByComment(int co_num) {
		return dao.deleteByComment(co_num);
	}
	

}
