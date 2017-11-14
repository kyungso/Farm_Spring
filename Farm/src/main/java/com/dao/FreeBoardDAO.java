package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.FreeBoardDTO;
import com.dto.MemberDTO;
import com.dto.PageDTO;

@Repository("freeBoardDAO")
public class FreeBoardDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<FreeBoardDTO> selectAll(){
		 List<FreeBoardDTO> list = template.selectList("boardselectAll");
		 return list;
	}
	
	public int boardWrite(HashMap<String, String> map) {
		int n = template.insert("boardWrite",map);
		return n;
	}
	
	public FreeBoardDTO selectByNum(int board_num) {
		FreeBoardDTO dto = template.selectOne("boardselectByNum", board_num);
		return dto;
	}
	
	public int updateByNum(HashMap<String, String> map) {
		int n = template.update("boardupdateByNum", map);
		return n;
	}
	
	public int deleteByNum(int board_num) {
		int n = template.delete("boarddeleteByNum", board_num);
		return n;				
	}
	
	public int readCnt(int board_num) {
		int n = template.update("boardreadCnt", board_num);
		return n;				
	}
		
	public PageDTO page(int curPage,HashMap<String, String> map) {
		PageDTO dto = new PageDTO();
		int sIndex = (curPage-1)*dto.getPerPage(); 
		int perpage = dto.getPerPage(); 	
		
		List<FreeBoardDTO> list = template.selectList("boardselectAll", map, new RowBounds(sIndex, perpage));
		int totalCount = 0;
		dto.setList(list);
		dto.setCurPage(curPage);
		if(map.get("searchValue")==null) {
			totalCount = template.selectOne("boardtotalCount");
		}else { 
			totalCount = template.selectOne("boardtotalCount1", map);
		}
		dto.setTotalCount(totalCount);
		dto.setSearchName(map.get("searchName"));
		dto.setSearchValue(map.get("searchValue"));

		return dto;
		
	}
	
	public List<FreeBoardDTO> list(){
		return template.selectList("boardMain");
	}
	

	

}
