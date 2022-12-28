﻿package com.spring.muknolja.member.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.spring.muknolja.common.model.vo.AD;
import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.QA;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.Reservation;
import com.spring.muknolja.hotel.model.vo.Reserve;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.member.model.vo.Visit;

public interface MemberService {

	Member login(Member m);

	int checkEmail(String email);

	int checkId(String id);

	int checkNickName(String nickName);

	int insertMember(Member m);

	

	String findId(String email);

	void visitCount(HashMap<String, String> map);

	Visit selectVisitCounter(String id);

	ArrayList<Member> selectVisitToday();

	ArrayList<Map<String, Integer>> selectVisitList();

	String selectpwd(String id);

	int updateMember(Member m);

	int memberListCount();

	ArrayList<Member> selectMemberList(PageInfo pi, HashMap<String, Object> map);

	ArrayList<Map<String, Integer>> enrollCount();

	int waring(String id);

	int stop(String id);

	int changePassword(Member m);

	String selectEid(String email);

	ArrayList<Map<String, Integer>> bCount();

	int boardListCount();

	ArrayList<Board> selectBoardList(HashMap<String, Object> map, PageInfo pi);

	ArrayList<Map<String, Integer>> incomeCount();

	ArrayList<AD> selectADList(int category);

	ArrayList<Reservation> selectReserve(String id);

	

	int insertsAttm(ArrayList<AttachedFile> list);

	int getListCount(String id);

	

	ArrayList<QA> selectQA(String id, PageInfo pi);

	ArrayList<Hotel> selectHotel(String id, PageInfo pi);

	ArrayList<AttachedFile> selectImg();

	ArrayList<Reservation> selectReserve(PageInfo pi, String id);

	ArrayList<Map<String, Integer>> selectVisitAllList();

	int waringCheck(String id);

	/* ArrayList<AttachedFile> selectImg(int hotelId); */






}
