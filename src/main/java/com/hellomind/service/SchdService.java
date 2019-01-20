package com.hellomind.service;

import java.util.List;
import java.util.Map;

import com.hellomind.dto.ColDto;
import com.hellomind.dto.SchdDto;

public interface SchdService {

	int insertSchd(SchdDto schdDto);
/*
	int updateSched(ColDto colDto);
	
	int updateCStats(String cId);*/

	List<SchdDto> selectSchd(String cId);
	 
	 /* Map<String, Object> selectColList(Map<String, Object> data);*/
}
