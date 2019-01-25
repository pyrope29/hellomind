package com.hellomind.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellomind.dao.RegDao;
import com.hellomind.dao.SchdDao;
import com.hellomind.dto.RegDto;

@Service
public class RegServiceImpl implements RegService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertReg(RegDto regDto) {
		return sqlSession.getMapper(RegDao.class).insertReg(regDto);
	}

	@Override
	public RegDto selectReg() {
		return sqlSession.getMapper(RegDao.class).selectReg();
	}

	@Override
	public List<RegDto> selectRegByMid(String mId) {
		return sqlSession.getMapper(RegDao.class).selectRegByMid(mId);
	}
}
