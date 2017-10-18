package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.FreeBoardDTO;
import com.dto.PageDTO;

@Repository("freeBoardDAO")
public class FreeBoardDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<FreeBoardDTO> selectAll(){
		 List<FreeBoardDTO> list = template.selectList("selectAll");
		 return list;
	}
	
	public int boardWrite(FreeBoardDTO dto) {
		int n = template.insert("boardWrite",dto);
		return n;
	}
	
	public FreeBoardDTO selectByNum(int board_num) {
		FreeBoardDTO dto = template.selectOne("selectByNum", board_num);
		return dto;
	}
	
	public int updateByNum(FreeBoardDTO dto) {
		int n = template.update("updateByNum", dto);
		return n;
	}
	
	public int deleteByNum(int board_num) {
		int n = template.delete("deleteByNum", board_num);
		return n;				
	}
	
	public int readCnt(int board_num) {
		int n = template.update("readCnt", board_num);
		return n;				
	}
	
	
	
	public PageDTO page(int curPage,HashMap<String, String> map) {
		PageDTO dto = new PageDTO();
		int sIndex = (curPage-1)*dto.getPerPage(); 
		int perpage = dto.getPerPage(); 	
		
		List<FreeBoardDTO> list = template.selectList("selectAll", map, new RowBounds(sIndex, perpage));
		int totalCount = 0;
		dto.setList(list);
		dto.setCurPage(curPage);
		if(map.get("searchValue")==null) {
			totalCount = template.selectOne("totalCount");
		}else { 
			totalCount = template.selectOne("totalCount1", map);
		}
		dto.setTotalCount(totalCount);
		dto.setSearchName(map.get("searchName"));
		dto.setSearchValue(map.get("searchValue"));

		return dto;
		
	}
	

	

}
