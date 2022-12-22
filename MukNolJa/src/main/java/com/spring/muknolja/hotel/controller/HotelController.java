package com.spring.muknolja.hotel.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.spring.muknolja.common.exception.CommonException;
import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Pagination;
import com.spring.muknolja.hotel.model.service.HotelService;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.LikeHotel;
import com.spring.muknolja.hotel.model.vo.Reservation;
import com.spring.muknolja.hotel.model.vo.Reserve;
import com.spring.muknolja.hotel.model.vo.ReserveDate;
import com.spring.muknolja.hotel.model.vo.Review;
import com.spring.muknolja.hotel.model.vo.Room;
import com.spring.muknolja.member.model.vo.Member;

@Controller
public class HotelController {
	
	@Autowired
	private HotelService hService;
	
	@RequestMapping("admin.ho")
	public String hotelAdmin(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		if(m.getMemberType().equals("H")) {
			Hotel hotel = hService.selectHotelbyId(m.getId());
			ArrayList<AttachedFile> hotelImg = hService.selectHotelImg(hotel.getHotelId());
			
			model.addAttribute("hotel", hotel);
			model.addAttribute("hotelImgList", hotelImg);
			
			return "admin";
		} else {
			throw new CommonException("호텔 사업자가 아닙니다.");
		}
	}
	
	@RequestMapping("manageHotel.ho")
	public String manageHotel(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		if(m.getMemberType().equals("H")) {
			Hotel hotel = hService.selectHotelbyId(m.getId());
			ArrayList<AttachedFile> hotelImg = hService.selectHotelImg(hotel.getHotelId());
			
			model.addAttribute("hotel", hotel);
			model.addAttribute("hotelImgList", hotelImg);
			
			return "manageHotel";
		} else {
			throw new CommonException("호텔 사업자가 아닙니다.");
		}
	}
	
	
	@RequestMapping("modifyHotel.ho")
	public String updateHotel(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		if(m.getMemberType().equals("H")) {
			Hotel hotel = hService.selectHotelbyId(m.getId());
			ArrayList<AttachedFile> hotelImg = hService.selectHotelImg(hotel.getHotelId());
			hotel.setHotelInfo(hotel.getHotelInfo().replaceAll("<br>", ""));
			hotel.setHotelIntro(hotel.getHotelIntro().replaceAll("<br>", ""));
			
			model.addAttribute("hotel", hotel);
			model.addAttribute("hotelImgList", hotelImg);
			
			return "modifyHotel";
		} else {
			throw new CommonException("호텔 사업자가 아닙니다.");
		}
	}
	
	
	
	
	@RequestMapping("hotelList.ho")
	public String hotelList() {
		return "hotelList";
	}
	
	@RequestMapping(value="selectHotelList.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void selectHotelList(@RequestParam(value="page", required=false) Integer page, HttpServletResponse response) {
		int listCount = hService.getListCount();
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Hotel> hotelList = hService.selectHotelList(pi);
		ArrayList<AttachedFile> hotelImgList = hService.selectHotelImgList(pi);
		
		HashMap map = new HashMap();
		map.put("hotelList", hotelList);
		map.put("hotelImgList", hotelImgList);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(map, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="searchHotelList.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void searchHotelList(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="searchValue", required=false) String searchValue, @RequestParam("checkinDate") Date checkinDate, @RequestParam("checkoutDate") Date checkoutDate, @RequestParam(value="maxPrice", required=false) Integer maxPrice, @RequestParam(value="maxDistance", required=false) Integer maxDistance, @RequestParam(value="star", required=false) ArrayList<Integer> star, @RequestParam(value="install", required=false) ArrayList<String> install, HttpServletResponse response) {
		int listCount = hService.getListCount();
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		System.out.println(install);
		
		String wifi=install.get(0);
		String breakfast=install.get(1);
		String amenity=install.get(2);
		String park=install.get(3);
		String swim=install.get(4);
		String fitness=install.get(5);
		
		HashMap searchMap = new HashMap();
		searchMap.put("searchValue", searchValue);
		searchMap.put("checkinDate", checkinDate);
		searchMap.put("checkoutDate", checkoutDate);
		searchMap.put("maxPrice", maxPrice*10000);
		searchMap.put("maxDistance", maxDistance);
		searchMap.put("star", star);
		searchMap.put("wifi", wifi);
		searchMap.put("breakfast", breakfast);
		searchMap.put("amenity", amenity);
		searchMap.put("park", park);
		searchMap.put("swim", swim);
		searchMap.put("fitness", fitness);
		
		
		HashMap map = new HashMap();
		
		ArrayList<Hotel> hotelList = hService.searchHotelList(searchMap, pi);
		ArrayList<AttachedFile> hotelImgList = hService.searchHotelImgList(searchMap, pi);
		map.put("hotelList", hotelList);
		map.put("hotelImgList", hotelImgList);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(map, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	@RequestMapping("hotelDetail.ho")
	public String hotelDetail(@RequestParam("hotelId") int hotelId, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		
		Hotel hotel = hService.selectHotel(hotelId);
		ArrayList<AttachedFile> hotelImgList = hService.selectHotelImg(hotelId);
		ArrayList<Room> roomList = hService.selectAllRoom(hotelId);
		ArrayList<AttachedFile> roomThumbnail = hService.selectAllRoomThumbnail(hotelId);
		
		if(m!=null) {
			LikeHotel l = new LikeHotel();
			l.setId(m.getId());
			l.setHotelId(hotel.getHotelId());
			
			int isLikeHotel = hService.isLikeHotel(l);
			model.addAttribute("isLikeHotel", isLikeHotel);
		}
		
		model.addAttribute("hotel", hotel);
		model.addAttribute("hotelImgList", hotelImgList);
		model.addAttribute("roomList", roomList);
		model.addAttribute("roomThumbnail", roomThumbnail);
		return "hotelDetail";
	}
	
	@RequestMapping(value="roomDetail.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void roomDetail(@RequestParam int roomId, HttpServletResponse response) {
		HashMap map = new HashMap();
		Room room = hService.selectRoom(roomId);
		ArrayList<AttachedFile> roomImgList = hService.selectRoomImg(roomId);
		
		map.put("room", room);
		map.put("roomImgList", roomImgList);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(map, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	// 작성 가능한 리뷰
	@RequestMapping("writableReview.ho")
	@ResponseBody
	public void reviewWaiting(HttpServletResponse response, @RequestParam("id") String id, @RequestParam("hotelId") int hotelId) {
		
		ArrayList<Reservation> reservationList = new ArrayList<Reservation>();
		HashMap map = new HashMap();
		map.put("memberId", id);
		map.put("hotelId", hotelId);
		reservationList = hService.writableReview(map);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(reservationList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	//리뷰 전체보기
	@RequestMapping(value="reviewList.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void reviewList(@RequestParam("hotelId") int hotelId, HttpServletResponse response) {
		HashMap map = new HashMap();

		ArrayList<Review> reviewList = hService.selectReviewList(hotelId);
		int reviewCount = hService.selectReviewCount(hotelId);
		double avgRating = hService.selectAvgRating(hotelId);
		
		map.put("reviewList", reviewList);
		map.put("reviewCount", reviewCount);
		map.put("avgRating", avgRating);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(map, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	// 리뷰 작성
	@RequestMapping(value="insertReview.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void insertReview(@ModelAttribute Review review) {
		int result = hService.insertReview(review);
	}
	
	
	@RequestMapping("writeReservation.ho")
	public String writeReservation(@ModelAttribute Reservation r, Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		r.setMemberId(m.getId());
		
		Room room = hService.selectRoom(r.getRoomId());
		Hotel hotel = hService.selectHotel(room.getHotelId());
		int currentReservationId = hService.getCurrentReservationId();
		
		int dates = ReserveDate.dateDif(r.getCheckinDate(), r.getCheckoutDate());
		r.setPaymentAmount((room.getRoomPrice())*dates);
		
		model.addAttribute("hotel", hotel);
		model.addAttribute("room", room);
		model.addAttribute("r", r);
		model.addAttribute("currentReservationId", currentReservationId);
		
		return "writeReservation";
	}
	
	@RequestMapping(value="insertReservation.ho")
	public String insertReservation(@ModelAttribute Reservation r, Model model, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		r.setMemberId(m.getId());
		
		// Reserve 테이블 삽입
		ArrayList<Reserve> list = new ArrayList();
		int dates = ReserveDate.dateDif(r.getCheckinDate(), r.getCheckoutDate());
		
		for(int i=0;i<dates;i++) {
			Date d = ReserveDate.datePlus(r.getCheckinDate(), i);
			Reserve reserve = new Reserve();
			reserve.setReservationDate(d);
			reserve.setRoomId(r.getRoomId());
			
			list.add(reserve);
		}
		
		HashMap map = new HashMap();
		map.put("r", r);
		map.put("list", list);
		
		int reservationResult = hService.insertReservation(map);
		
		model.addAttribute("r", r);
		
		return "successReservation";
	}
	
	@RequestMapping(value="insertLikeHotel.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void insertLikeHotel(@ModelAttribute LikeHotel l) {
		int result = hService.insertLikeHotel(l);
	}
	
	@RequestMapping(value="deleteLikeHotel.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void deleteLikeHotel(@ModelAttribute LikeHotel l) {
		int result = hService.deleteLikeHotel(l);
	}
	
	
	
	
	@RequestMapping("writeRoom.ho")
	public String writeRoom(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		if(!m.getMemberType().equals("H")) {
			throw new CommonException("사업자 회원이 아닙니다.");
		}
		
		Hotel hotel = hService.selectHotelbyId(m.getId());
		model.addAttribute("hotel", hotel);
		return "writeRoom";
	}
	
	@RequestMapping("insertRoom.ho")
	public String insertRoom(@ModelAttribute Room r, @RequestParam("roomImg") ArrayList<MultipartFile> files, HttpSession session, HttpServletRequest request) {
		Member m = (Member)session.getAttribute("loginUser");
		
		int roomResult = hService.insertRoom(r);
		
		ArrayList<AttachedFile> list = new ArrayList();
		for(MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")) {
				String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
				
				if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg")) {
					String[] returnArr = AttachedFile.saveFile(file, request);
					
					if(returnArr[1] != null) {
						AttachedFile attm = new AttachedFile();
						attm.setFileName(file.getOriginalFilename());
						attm.setFileModifyName(returnArr[1]);
						attm.setFileLink(returnArr[0]);
						
						list.add(attm);
					}
				}
			}
		}
		
		for(int i = 0; i < list.size(); i++) {
			AttachedFile a = list.get(i);
			if(i == 0) {
				a.setFileThumbnail("Y");
			} else {
				a.setFileThumbnail("N");
			}
			a.setFileType("H");
		}
		
		int attmResult = 0;
		
		if(!list.isEmpty()) {
			attmResult = hService.insertRoomAttm(list);
		}
		
		if(roomResult + attmResult == list.size()*2+1) {
			return "redirect:hotelList.ho";
		} else {
			for(AttachedFile a : list) {
				AttachedFile.deleteFile(a.getFileModifyName(), request);
			}
			throw new CommonException("객실 등록 실패");
		}
	}

	
	
	
	@RequestMapping("writeHotel.ho")
	public String writeHotel(HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if(!m.getMemberType().equals("H")) {
			throw new CommonException("사업자 회원이 아닙니다.");
		}
		return "writeHotel";
	}
	
	@RequestMapping("insertHotel.ho")
	public String insertHotel(@ModelAttribute Hotel h, @RequestParam("hotelImg") ArrayList<MultipartFile> files, HttpServletRequest request, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		
		h.setEntId(m.getId());
		int hotelResult = hService.insertHotel(h);
		
		ArrayList<AttachedFile> list = new ArrayList();
		for(MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")) {
				String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
				
				if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg")) {
					String[] returnArr = AttachedFile.saveFile(file, request);
					
					if(returnArr[1] != null) {
						AttachedFile attm = new AttachedFile();
						attm.setFileName(file.getOriginalFilename());
						attm.setFileModifyName(returnArr[1]);
						attm.setFileLink(returnArr[0]);
						
						list.add(attm);
					}
				}
			}
		}
		
		for(int i = 0; i < list.size(); i++) {
			AttachedFile a = list.get(i);
			if(i == 0) {
				a.setFileThumbnail("Y");
			} else {
				a.setFileThumbnail("N");
			}
			a.setFileType("H");
		}
		
		int attmResult = 0;
		
		if(!list.isEmpty()) {
			attmResult = hService.insertHotelAttm(list);
		}
		
		if(hotelResult + attmResult == list.size()*2+1) {
			return "redirect:hotelList.ho";
		} else {
			for(AttachedFile a : list) {
				AttachedFile.deleteFile(a.getFileModifyName(), request);
			}
			throw new CommonException("호텔 등록 실패");
		}
	}
	
	
	
}
