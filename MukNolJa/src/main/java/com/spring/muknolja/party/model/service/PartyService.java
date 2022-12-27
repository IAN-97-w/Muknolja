package com.spring.muknolja.party.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.party.model.vo.Party;

public interface PartyService {

	int insertBoard(HashMap<String, Object> map);

	int getListCount();

	ArrayList<Party> selectPartyList(PageInfo pi);

	Party selectParty(int pId);

}
