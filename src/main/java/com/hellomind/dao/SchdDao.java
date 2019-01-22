package com.hellomind.dao;

import java.util.List;
import java.util.Map;

import com.hellomind.dto.SchdDto;

public interface SchdDao {

	int insertSchd(SchdDto schdDto);

	int updateSchd(SchdDto schdDto);
	
	SchdDto selectSchd(Map<String, String> map);

	List<SchdDto> selectSchdById(String cId);
	
	int deleteSchd(Map<String, String> map);
}
