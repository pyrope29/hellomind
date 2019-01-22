package com.hellomind.service;

import java.util.List;
import java.util.Map;

import com.hellomind.dto.ColDto;
import com.hellomind.dto.SchdDto;

public interface SchdService {

	int insertSchd(SchdDto schdDto);

	int updateSchd(SchdDto schdDto);
	
	SchdDto selectSchd(Map<String, String> map);

	List<SchdDto> selectSchdById(String cId);
	
	int deleteSchd(Map<String, String> map);
	 
	 /* Map<String, Object> selectColList(Map<String, Object> data);*/
}
