﻿package com.spring.muknolja.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.common.model.vo.AD;
import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.QA;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.LikeHotel;
import com.spring.muknolja.hotel.model.vo.Reservation;
import com.spring.muknolja.hotel.model.vo.Reserve;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.member.model.vo.Visit;
import com.spring.muknolja.party.model.vo.Party;

@Repository("mDAO")
public class MemberDAO {

	public Member login(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.login", m);
	}

	public int checkEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}

	public int checkId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.idsol", id);
	}

	public int checkNickName(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("memberMapper.checkNickName", nickName);
	}

	public int insert(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertM", m);
	}

	public String findId(SqlSessionTemplate sqlSession, String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.findId", email);
	}
	public void visitCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		sqlSession.insert("memberMapper.visitCount", map);
	}

	public Visit selectVisitCounter(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.selectVisitCounter", id);
	}

	public ArrayList<Member> selectVisitToday(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectVisitToday", null, rowBounds);
	}

	public ArrayList<Map<String, Integer>> selectVisitList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectVisitList");
	}
	
	public ArrayList<Map<String, Integer>> selectVisitAllList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectVisitAllList");
	}

	public String selectPwd(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.selectPwd", id);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int memberListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("memberMapper.memberListCount", map);
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList", map, rowBounds);
	}

	public ArrayList<Map<String, Integer>> enrollCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.enrollCount");
	}

	public int waring(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.waring", id);
	}

	public int stop(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.stop", id);
	}

	public int changePassword(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.changePassword",m);
	}

	public String selectEid(SqlSessionTemplate sqlSession, String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectEid",email);
	}

	public ArrayList<Map<String, Integer>> bCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.bCount");
	}

	public int boardListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("memberMapper.boardListCount", map);
	}

	public ArrayList<Object> selectBoardList(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectBoardList", map, rowBounds);
	}

	public ArrayList<Map<String, Integer>> incomeCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.incomeCount");
	}

	public ArrayList<AD> selectADList(SqlSessionTemplate sqlSession, int category) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectADList", category);
	}

	

	

	public int insertAttm(SqlSessionTemplate sqlSession, ArrayList<AttachedFile> list) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertAttm",list);
	}

	public int getListCount(SqlSessionTemplate sqlSession, String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.myInfoBCount",id);
	}

	

	public ArrayList<QA> selectQA(SqlSessionTemplate sqlSession, String id, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectQA", id, rowBounds);
	}

	public ArrayList<Hotel> selectHotel(SqlSessionTemplate sqlSession, String id, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectHotel", id, rowBounds);
	}

	public ArrayList<Reservation> selectReserve(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectReserve", id, rowBounds);
	
		
		
	}

	public int deleteDD(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.deleteDD",id);
	}

	public int waringCheck(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.waringCheck", id);
	}

	public int getListCount1(SqlSessionTemplate sqlSession, String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.myInfoBCount1",id);
	}

	public int deleteBB(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.deleteBB",id);
	}

	public int getListCount2(SqlSessionTemplate sqlSession, String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.myInfoBCount2",id);
	}

	public int deleteAA(SqlSessionTemplate sqlSession, LikeHotel list) {
		// TODO Auto-generated method stub
		System.out.println("리스트는2"+list);
		return sqlSession.delete("memberMapper.deleteAA",list);
	}

	public int getListCount3(SqlSessionTemplate sqlSession, String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.myInfoBCount3",id);
	}

	public ArrayList<Party> selectParty(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectParty", id, rowBounds);
	}

	public int getListCount4(SqlSessionTemplate sqlSession, String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.myInfoBCount4",id);
	}

	public int getListCount5(SqlSessionTemplate sqlSession, String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.myInfoBCount5",id);
	}

	public ArrayList<Board> selectB(SqlSessionTemplate sqlSession, String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectB", id);
	}
	public int insertAd(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("memberMapper.insertAd", map);
	}

	public AttachedFile selectAttm(SqlSessionTemplate sqlSession, int id) {
		return sqlSession.selectOne("memberMapper.selectAttm", id);
	}

	public int updateAttm(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("memberMapper.updateAttm", map);
	}

	public int updateAd(SqlSessionTemplate sqlSession, HashMap<String, Object> aMap) {
		return sqlSession.update("memberMapper.updateAd", aMap);
	}

	public int reportListCount(SqlSessionTemplate sqlSession, String search) {
		return sqlSession.selectOne("memberMapper.reportListCount", search);
	}

	public ArrayList<Object> selectReportList(SqlSessionTemplate sqlSession, String search, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectReportList", search, rowBounds);
	}

	public String selectBoardType(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.selectBoardType", id);
	}

	public int updateProcessing(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.updateProcessing", id);
	}

	public ArrayList<Map<String, Integer>> QACount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.QACount");
	}

	public ArrayList<QA> selectQAList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectQAList", null, rowBounds);
	}

	public int insertQA(SqlSessionTemplate sqlSession, QA q) {
		return sqlSession.insert("memberMapper.insertQA", q);
	}

	public QA selectQAOne(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.selectQAOne", id);
	}

	public int updateQAReply(SqlSessionTemplate sqlSession, QA q) {
		return sqlSession.update("memberMapper.updateQAReply", q);
	}

	public ArrayList<String> selectAd(SqlSessionTemplate sqlSession, String type) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectAd", type);
	}

	public int selectPBoardFileId(SqlSessionTemplate sqlSession, int id) {
		return sqlSession.selectOne("memberMapper.selectPBoardFileId", id);
	}

	public int reportReply(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("memberMapper.reportReply", map);
	}

	public String selectBoardId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.selectBoardId", id);
	}

	public ArrayList<Board> selectNList(SqlSessionTemplate sqlSession, String search) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectNList", search);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		System.out.println(map.get("b"));
		return sqlSession.insert("memberMapper.insertNotice", map);
	}

	public AttachedFile selectNAttm(SqlSessionTemplate sqlSession, int id) {
		return sqlSession.selectOne("memberMapper.selectNAttm", id);
	}

	public int updateNAttm(SqlSessionTemplate sqlSession, AttachedFile attm) {
		return sqlSession.update("memberMapper.updateNAttm", attm);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("memberMapper.updateNotice", b);
	}

	public int insertNAttm(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("memberMapper.insertNAttm", map);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int id) {
		return sqlSession.update("memberMapper.deleteNotice", id);
	}

	public int insertMemberH(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertAttm", map);
	}

	public int insertMemberHH(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMemberH", m);
	}
	public int approval(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.approval", id);
	}

	public int soptClrear(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.soptClrear", id);
	}

	public Member selectMimg(SqlSessionTemplate sqlSession, String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectMimg",id);
	}

	public int countMimg(SqlSessionTemplate sqlSession, String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.countMimg",id);
	}

	public int insertMimg(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMimg",map);}
	public String selectBusinessLicense(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.selectBusinessLicense", id);
	}

	public int qaListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.qaListCount");
	}

	public int todayCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.todayCount");
	}
	
	/*
	 * public ArrayList<AttachedFile> selectImg(SqlSessionTemplate sqlSession, int
	 * hotelId) { // TODO Auto-generated method stub return
	 * (ArrayList)sqlSession.selectList("memberMapper.selectImg", hotelId); }
	 */
	}

	
	


