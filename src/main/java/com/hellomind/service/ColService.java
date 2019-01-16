package com.hellomind.service;

import java.util.List;
import java.util.Map;

import com.hellomind.dto.ColDto;

public interface ColService {

	int insertCol(ColDto colDto);

	int updateCol(ColDto colDto);
	
	int updateCStats(String cId);

	ColDto selectCol(String cId);

	List<ColDto> selectAllCol(Map<String,Object> map);
	
	 Map<String, Object> getColList(Map<String, Object> data);
}
