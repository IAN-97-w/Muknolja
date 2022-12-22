package com.spring.muknolja.hotel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.LikeHotel;
import com.spring.muknolja.hotel.model.vo.Review;
import com.spring.muknolja.hotel.model.vo.Reservation;
import com.spring.muknolja.hotel.model.vo.Room;

public interface HotelService {

	int insertRoom(Room r);

	int insertRoomAttm(ArrayList<AttachedFile> list);
	
	int insertHotelAttm(ArrayList<AttachedFile> list);

	Hotel selectHotel(int hotelId);

	ArrayList<AttachedFile> selectHotelImg(int hotelId);

	ArrayList<Room> selectAllRoom(int hotelId);

	ArrayList<AttachedFile> selectRoomImg(int roomId);

	AttachedFile selectRoomThumbnail(int roomId);

	int insertHotel(Hotel h);
	
	Room selectRoom(int roomId);

	int getCurrentReservationId();

	int insertReservation(HashMap map);

	int isLikeHotel(LikeHotel l);

	int insertLikeHotel(LikeHotel l);

	int deleteLikeHotel(LikeHotel l);

	ArrayList<Reservation> writableReview(HashMap map);

	int insertReview(Review reply);

	ArrayList<Review> selectReviewList(int hotelId);

	ArrayList<AttachedFile> selectAllRoomThumbnail(int hotelId);

	int selectReviewCount(int hotelId);

	double selectAvgRating(int hotelId);

	Hotel selectHotelbyId(String id);

	int getListCount();
	
	int getSearchListCount();

	ArrayList<Hotel> selectHotelList(PageInfo pi);

	ArrayList<AttachedFile> selectHotelImgList(PageInfo pi);

	ArrayList<Hotel> searchHotelList(HashMap searchMap, PageInfo pi);

	ArrayList<AttachedFile> searchHotelImgList(HashMap searchMap, PageInfo pi);

}
