package com.hellomind.dao;

import java.util.List;

import com.hellomind.dto.MemberDto;
public interface MemberDao {

	int insertMember(MemberDto memberDto);

	int updateMember(MemberDto memberDto);

	MemberDto selectMember(String mId);

	List<MemberDto> selectAllMember();

	int deleteMember(String mId);

}
