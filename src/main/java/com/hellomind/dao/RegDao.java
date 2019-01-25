package com.hellomind.dao;

import java.util.List;
import java.util.Map;

import com.hellomind.dto.RegDto;

public interface RegDao {

	int insertReg(RegDto RegDto);
	
	RegDto selectReg();
	
	List<RegDto> selectRegByMid(String mid);
}
