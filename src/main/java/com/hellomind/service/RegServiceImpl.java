package com.hellomind.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellomind.dao.RegDao;
import com.hellomind.dto.RegDto;

@Service
public class RegServiceImpl implements RegService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertReg(RegDto regDto) {
		return sqlSession.getMapper(RegDao.class).insertReg(regDto);
	}


}
