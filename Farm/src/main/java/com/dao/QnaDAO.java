package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.QnaDTO;

@Repository
public class QnaDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public List<QnaDTO> qnaList(String userid){
		return template.selectList("selectAllQna", userid);
	}
}
