package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.QnaDTO;
import com.dto.QnaPageDTO;

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

	public void tx(QnaDTO dto) {
		template.update("stateUpdate",Integer.parseInt(dto.getQna_num()));
		template.insert("qnaReplyWrite", dto);
	}

	public QnaPageDTO page(String userid, int curPage) {
		QnaPageDTO dto = new QnaPageDTO();
		  int sIndex = (curPage - 1)* QnaPageDTO.getPerPage();
	      int length  = QnaPageDTO.getPerPage();
	      List<QnaDTO> list =
	    		  template.selectList("selectAllQna",userid,new RowBounds(sIndex, length));
	      System.out.println(userid);
	      int totalCount = template.selectOne("qnaTotalCount",userid);
	      dto.setList(list);
			dto.setCurPage(curPage);
			dto.setTotalCount(totalCount);
	      return dto;
	}
}
