package com.hellomind.dao;

import java.util.List;
import java.util.Map;

import com.hellomind.dto.SchdDto;

public interface SchdDao {

	int insertSchd(SchdDto schdDto);

	List<SchdDto> selectSchd(String cId);
}
