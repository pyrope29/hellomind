package com.hellomind.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellomind.commons.Constants;
import com.hellomind.dao.MemberDao;
import com.hellomind.dto.MemberDto;
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession; 

	@Override
	public int insertMember(MemberDto memberDto) {
		return sqlSession.getMapper(MemberDao.class).insertMember(memberDto);
	}

	@Override
	public int updateMember(MemberDto memberDto) {
		return sqlSession.getMapper(MemberDao.class).updateMember(memberDto);
	}

	@Override
	public MemberDto selectMember(String mId) {
		return sqlSession.getMapper(MemberDao.class).selectMember(mId);
	}

	@Override
	public List<MemberDto> selectAllMember() {
		return sqlSession.getMapper(MemberDao.class).selectAllMember();
	}

	@Override
	public int deleteMember(String mId) {
		return sqlSession.getMapper(MemberDao.class).deleteMember(mId);
	}

/*	@Override
	public boolean login(String mberId, String mberPw) {
		MemberDto member = memberDao.selectById(mberId);
		boolean result = false;

		if (member == null || member.getMstats().equals("2")) {//탈퇴회원 경우 로그인 금지
			result = false;
		} else if(member.getMpw().equals(mberPw)){
			result = true;
		}
		return result;
	}

	@Override
	public boolean join(MemberDto member) {
		int rowCount = memberDao.insertMember(member);
		
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean modify(MemberDto member) {
		try {
			int rowCount = memberDao.updateMember(member);			
			if (rowCount > 0) {		
				return true;
			} 
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	public boolean deleteMember(MemberDto member) {
		// 회원탈퇴
		member.setMstats("2");
		int rowCount = memberDao.updateMember(member);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public MemberDto getMember(int mberIndex) {
		return memberDao.selectMember(mberIndex);
	}
	
	@Override
	public MemberDto getMemberById(String mberId) {
		return memberDao.selectById(mberId);				
	}

	 페이징 처리 
	public Map<String, Object> getMemberMessageList(Map<String, Object> data) {
		Map<String, Object> viewData = new HashMap<String,Object>();
		int totalCount = 0;  	
		Map<String, Object> map = new HashMap<>();
		
		 검색 키워드 존재 시
		
		  if(data.get("keyword")!=null) {
			String keyword = (String) data.get("keyword");
			map.put("keyword", keyword);		
			viewData.put("keyword", keyword);
			totalCount  = memberDao.selectMemberCount(keyword); 
		} else {
			map.put("keyword", "");
			totalCount  = memberDao.selectMemberCount(""); 
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
		viewData.put("startPage", getStartPage(pageNumber));
		viewData.put("endPage", getEndPage(pageNumber));
		viewData.put("msgPerPage", numOfMsgPage);	
		viewData.put("boardList", memberDao.selectMemberList(map));
		System.out.println(memberDao.selectMemberList(map));
		return viewData;
	}


	public int calPageTotalCount(int totalCount, int numOfMsgPage) {
		int pageTotalCount = 0;
		if (totalCount != 0) {
			pageTotalCount = (int) Math.ceil(((double) totalCount / numOfMsgPage));
		}
		return pageTotalCount;
	}

	public int getStartPage(int pageNum) {
		int startPage = ((pageNum - 1) / Constants.Page.NUM_OF_NAVI_PAGE) * Constants.Page.NUM_OF_NAVI_PAGE + 1;
		return startPage;
	}

	public int getEndPage(int pageNum) {
		int endPage = (((pageNum - 1) / Constants.Page.NUM_OF_NAVI_PAGE) + 1) * Constants.Page.NUM_OF_NAVI_PAGE;
		return endPage;
	}*/
	
/*	public Map<String, Object> getAdminMessageList(Map<String, Object> data) {
		Map<String, Object> viewData = new HashMap<String,Object>();
		int totalCount = 0;  	
		Map<String, Object> map = new HashMap<>();
		
		 검색 키워드 존재 시
		if(data.get("keyword")!=null) {
			String keyword = (String) data.get("keyword");
			map.put("keyword", keyword);		
			viewData.put("keyword", keyword);
			totalCount  = memberDao.selectAdminCount(keyword); 
		} else {
			map.put("keyword", "");
			totalCount  = memberDao.selectAdminCount(""); 
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
		viewData.put("startPage", getStartPage(pageNumber));
		viewData.put("endPage", getEndPage(pageNumber));
		viewData.put("msgPerPage", numOfMsgPage);	
		viewData.put("boardList", memberDao.selectAdminList(map));
		return viewData;
	}
*/
}
