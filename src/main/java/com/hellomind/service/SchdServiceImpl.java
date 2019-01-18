package com.hellomind.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellomind.dao.SchdDao;
import com.hellomind.dto.SchdDto;

@Service
public class SchdServiceImpl implements SchdService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertSchd(SchdDto schdDto) {
		return sqlSession.getMapper(SchdDao.class).insertSchd(schdDto);

	}

	@Override
	public List<String> selectSchd(String cId) {
		return sqlSession.getMapper(SchdDao.class).selectSchd(cId);
	}
}