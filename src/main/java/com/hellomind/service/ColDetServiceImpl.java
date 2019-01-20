package com.hellomind.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellomind.dao.ColDetDao;
import com.hellomind.dto.ColDetDto;

@Service
public class ColDetServiceImpl implements ColDetService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertColDet(ColDetDto colDetDto) {
		return sqlSession.getMapper(ColDetDao.class).insertColDet(colDetDto);
	}

	@Override
	public int updateColDet(ColDetDto colDetDto) {
		return sqlSession.getMapper(ColDetDao.class).updateColDet(colDetDto);
	}

	@Override
	public ColDetDto selectColDet(String cId) {
		return sqlSession.getMapper(ColDetDao.class).selectColDet(cId);
	}

}
