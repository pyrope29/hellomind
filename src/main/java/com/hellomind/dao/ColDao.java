package com.hellomind.dao;

import java.util.List;
import java.util.Map;

import com.hellomind.dto.ColDto;
public interface ColDao {

	int insertCol(ColDto colDto);

	int updateCol(ColDto colDto);
	
	int updateCStats(String cId);

	ColDto selectCol(String cId);

	List<ColDto> selectColList(Map<String, Object> data);

	int selectCount(Map<String, Object> map);
}
