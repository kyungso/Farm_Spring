package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.QnaDAO;
import com.dto.QnaDTO;

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
	
}
