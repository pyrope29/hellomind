package com.hellomind.dao;

import com.hellomind.dto.ColDetDto;

public interface ColDetDao {

	int insertColDet(ColDetDto colDetDto);

	int updateColDet(ColDetDto colDetDto);

	ColDetDto selectColDet(String cId);

}
