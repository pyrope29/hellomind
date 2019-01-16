package com.hellomind.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellomind.commons.Constants;
import com.hellomind.dao.ColDao;
import com.hellomind.dto.ColDto;
@Service
public class ColServiceImpl implements ColService {
	@Autowired
	private SqlSession sqlSession; 

	@Override
	public int insertCol(ColDto colDto) {
		return sqlSession.getMapper(ColDao.class).insertCol(colDto);
	}

	@Override
	public int updateCol(ColDto colDto) {
		return sqlSession.getMapper(ColDao.class).updateCol(colDto);
	}

	@Override
	public int updateCStats(String cId) {
		return sqlSession.getMapper(ColDao.class).updateCStats(cId);
	}

	@Override
	public ColDto selectCol(String cId) {
		return sqlSession.getMapper(ColDao.class).selectCol(cId);
	}

	@Override
	public List<ColDto> selectAllCol(Map<String,Object> map) {
		return sqlSession.getMapper(ColDao.class).selectAllCol(map);
	}


/* 페이징 처리  */
	public Map<String, Object> getColList(Map<String, Object> data) {
		Map<String, Object> viewData = new HashMap<String,Object>();
		int totalCount = 0;  	
		Map<String, Object> map = new HashMap<>();
		
		/* 검색 키워드 존재 시*/
		if(data.get("keyword")!=null) {
			String keyword = (String) data.get("keyword");
			map.put("keyword", keyword);		
			viewData.put("keyword", keyword);
			totalCount  = sqlSession.getMapper(ColDao.class).selectCount(keyword); 
		} else {
			map.put("keyword", "");
			totalCount  = sqlSession.getMapper(ColDao.class).selectCount(""); 
		}		
		if(totalCount==0) {
			totalCount = 1;
		}
		
		int numOfMsgPage = (int) data.get("numOfMsgPage");
		int pageTotalCount = calPageTotalCount(totalCount, numOfMsgPage);
		int pageNumber = (int) data.get("pageNumber");
	
		if(pageNumber > pageTotalCount) {
			pageNumber = pageTotalCount;
		}

		int startRow = numOfMsgPage * ( pageNumber - 1 ) ;
		map.put("NUM_OF_MSG_PER_PAGE", numOfMsgPage);
		map.put("START_ROW", startRow);
		
		viewData.put("currentPage", pageNumber);	
		viewData.put("pageTotalCount", pageTotalCount);
		viewData.put("startPage", ((pageNumber - 1) / Constants.Page.NUM_OF_NAVI_PAGE) * Constants.Page.NUM_OF_NAVI_PAGE + 1);
		viewData.put("endPage", (((pageNumber - 1) / Constants.Page.NUM_OF_NAVI_PAGE) + 1) * Constants.Page.NUM_OF_NAVI_PAGE);
		viewData.put("msgPerPage", numOfMsgPage);	
		viewData.put("colList", selectAllCol(map));
		return viewData;
	}

	public int calPageTotalCount(int totalCount, int numOfMsgPage) {
		int pageTotalCount = 0;
		if (totalCount != 0) {
			pageTotalCount = (int) Math.ceil(((double) totalCount / numOfMsgPage));
		}
		return pageTotalCount;
	}
}