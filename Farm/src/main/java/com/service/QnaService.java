package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.QnaDAO;
import com.dto.FreeBoardPageDTO;
import com.dto.QnaDTO;
import com.dto.QnaPageDTO;

@Service
public class QnaService {

	@Autowired
	QnaDAO dao;
	
	public List<QnaDTO> qnaList(String userid){
		return dao.qnaList(userid);
	}

	public QnaDTO QNARetrieve(HashMap<String, String> map) {
		return dao.qnaRetrieve(map);
	}

	public void QNAWrite(QnaDTO dto) {
		dao.QNAWrite(dto);
	}

	public void QNAUpdate(QnaDTO dto) {
		dao.QNAUpdate(dto);
	}

	public void QNADelete(int qna_num) {
		dao.QNADelete(qna_num);
	}

	@Transactional
	public void QNAReplyWrite(QnaDTO dto) {
		dao.tx(dto);
		
	}

	public QnaPageDTO page(String userid, int curPage) {
	return dao.page(userid,curPage);
	}
	
}
