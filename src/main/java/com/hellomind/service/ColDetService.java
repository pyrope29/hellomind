package com.hellomind.service;

import com.hellomind.dto.ColDetDto;

public interface ColDetService {

	int insertColDet(ColDetDto colDetDto);

	int updateColDet(ColDetDto colDetDto);

	ColDetDto selectColDet(String cId);
}
