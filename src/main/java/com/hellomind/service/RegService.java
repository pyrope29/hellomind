package com.hellomind.service;

import java.util.List;
import java.util.Map;

import com.hellomind.dto.RegDto;

public interface RegService {

	int insertReg(RegDto regDto);
	
	public RegDto selectReg();

	List<RegDto> selectRegByMid(String mId);
	
	/* int updateReg(RegDto RegDto);
	
	RegDto selectReg(Map<String, String> map);

	List<RegDto> selectRegById(String cId);
	
	int deleteReg(Map<String, String> map);
	 
	 Map<String, Object> selectColList(Map<String, Object> data);*/
}
