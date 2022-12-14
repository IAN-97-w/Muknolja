package com.spring.muknolja.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public Member login(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.login", m);
	}

	public int checkEmail(SqlSessionTemplate sqlSession, String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}

	public int checkId(SqlSessionTemplate sqlSession, String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.idsol", id);
	}

	public int checkNickName(SqlSessionTemplate sqlSession, String nickName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.checkNickName", nickName);
	}

	public int insert(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertM", m);
	}

}
