package com.spring.muknolja.hotel.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.Room;

@Repository("hDAO")
public class HotelDAO {

	public int insertRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.insert("hotelmapper.insertRoom", r);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, ArrayList<AttachedFile> list) {
		return sqlSession.insert("hotelmapper.insertAttm", list);
	}

	public Hotel selectHotel(SqlSessionTemplate sqlSession, int hotelId) {
		return sqlSession.selectOne("hotelmapper.selectHotel", hotelId);
	}

	public AttachedFile selectHotelImg(SqlSessionTemplate sqlSession, int hotelId) {
		return sqlSession.selectOne("hotelmapper.selectHotelImg", hotelId);
	}

	public ArrayList<Room> selectAllRoom(SqlSessionTemplate sqlSession, int hotelId) {
		return (ArrayList)sqlSession.selectList("hotelmapper.selectAllRoom", hotelId);
	}

	public ArrayList<AttachedFile> selectRoomImg(SqlSessionTemplate sqlSession, int roomId) {
		return (ArrayList)sqlSession.selectList("hotelmapper.selectRoomImg", roomId);
	}

	public AttachedFile selectRoomThumbnail(SqlSessionTemplate sqlSession, int roomId) {
		return sqlSession.selectOne("hotelmapper.selectRoomThumbnail", roomId);
	}

}
