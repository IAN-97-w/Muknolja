package com.spring.muknolja.member.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.member.model.dao.MemberDAO;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.member.model.vo.Visit;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member login(Member m) {
		return mDAO.login(sqlSession, m);
	}

	@Override
	public int checkEmail(String email) {
		return mDAO.checkEmail(sqlSession,email);
	}

	@Override
	public int checkId(String id) {
		return mDAO.checkId(sqlSession,id);
	}

	@Override
	public int checkNickName(String nickName) {
		return mDAO.checkNickName(sqlSession,nickName);
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insert(sqlSession,m);
	}

	@Override
	public void visitCount(String id) {
		mDAO.visitCount(sqlSession, id);
	}

	@Override
	public Visit selectVisitCounter(String id) {
		return mDAO.selectVisitCounter(sqlSession, id);
	}

	@Override
	public ArrayList<Member> selectVisitToday() {
		return mDAO.selectVisitToday(sqlSession);
	}

	@Override
	public ArrayList<Map<String, Integer>> selectVisitList() {
		return mDAO.selectVisitList(sqlSession);
	}

}
