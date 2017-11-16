package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CommentDTO;
import com.dto.FreeBoardDTO;
import com.dto.FreeBoardPageDTO;

@Repository("commentDAO")
public class CommentDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<CommentDTO> selectComment(int board_num) {
		List<CommentDTO> list = template.selectList("selectComment", board_num);
		return list;
	}
	
	public int insertComment(CommentDTO dto) {
		int n = template.insert("insertComment", dto);
		return n;
	}
	
	public int deleteByComment(int co_num) {
		return template.delete("deleteByComment",co_num);
	}
	
	

}
