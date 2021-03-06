package com.ict.dao;

import java.util.List;

import com.ict.vo.VO;

public interface MyDAO {
	// list
	List<VO> selectAll() throws Exception;

	// 삽입
	int insert(VO vo) throws Exception;
	
	// 상세보기
	VO selectOne(String idx) throws Exception;

	// 삭제
	int deleteOne(String idx) throws Exception;

	// 업데이트
	int updateOne(VO vo) throws Exception;
}
