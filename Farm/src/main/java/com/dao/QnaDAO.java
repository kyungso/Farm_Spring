package com.dao;

import java.util.HashMap;
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

	public QnaDTO qnaRetrieve(HashMap<String, String> map) {
		return template.selectOne("selectByNum", map);
	}

	public void QNAWrite(QnaDTO dto) {
		template.insert("qnaWrite", dto);
	}

	public void QNAUpdate(QnaDTO dto) {
		template.update("qnaUpdate",dto);
		
	}

	public void QNADelete(int qna_num) {
		template.delete("qnaDelete", qna_num);
		
	}
}
