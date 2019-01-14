package com.hellomind.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hellomind.dto.MemberDto;

public interface MemberService {

	int insertMember(MemberDto memberDto);

	int updateMember(MemberDto memberDto);
	
	int deleteMember(String mid);

	MemberDto selectMember(String mid);

	List<MemberDto> selectAllMember();
}
