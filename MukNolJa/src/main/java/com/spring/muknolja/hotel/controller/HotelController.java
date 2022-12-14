package com.spring.muknolja.hotel.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

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
import com.spring.muknolja.common.model.vo.Report;
import com.spring.muknolja.hotel.model.service.HotelService;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.LikeHotel;
import com.spring.muknolja.hotel.model.vo.Payment;
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
			if(hotel==null) {
				return "redirect:writeHotel.ho";
			}
			ArrayList<AttachedFile> hotelImg = hService.selectHotelImg(hotel.getHotelId());
			model.addAttribute("hotel", hotel);
			model.addAttribute("hotelImgList", hotelImg);
			
			ArrayList<HashMap> stasticsList = hService.selectReservationWeekStastics(hotel.getHotelId());
			model.addAttribute("stasticsList", stasticsList);
			
			return "admin";
		} else {
			throw new CommonException("?????? ???????????? ????????????.");
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
			throw new CommonException("?????? ???????????? ????????????.");
		}
	}
	
	@RequestMapping("manageRoom.ho")
	public String manageRoom(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		if(m.getMemberType().equals("H")) {
			Hotel hotel = hService.selectHotelbyId(m.getId());
			ArrayList<AttachedFile> hotelImg = hService.selectHotelImg(hotel.getHotelId());
			
			model.addAttribute("hotel", hotel);
			model.addAttribute("hotelImgList", hotelImg);
			
			return "manageRoom";
		} else {
			throw new CommonException("?????? ???????????? ????????????.");
		}
	}
	
	@RequestMapping("manageReview.ho")
	public String manageReview(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		if(m.getMemberType().equals("H")) {
			Hotel hotel = hService.selectHotelbyId(m.getId());
			ArrayList<AttachedFile> hotelImg = hService.selectHotelImg(hotel.getHotelId());
			
			HashMap map = new HashMap();
			
			map.put("checkinDate", null);
			map.put("checkoutDate", null);
			map.put("hotelId", hotel.getHotelId());
			ArrayList<Room> roomList = hService.selectAllRoom(map);
			
			model.addAttribute("hotel", hotel);
			model.addAttribute("hotelImgList", hotelImg);
			model.addAttribute("roomList", roomList);
			
			return "manageReview";
		} else {
			throw new CommonException("?????? ???????????? ????????????.");
		}
	}
	
	@RequestMapping("manageReserve.ho")
	public String manageReserve(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		if(m.getMemberType().equals("H")) {
			Hotel hotel = hService.selectHotelbyId(m.getId());
			ArrayList<AttachedFile> hotelImg = hService.selectHotelImg(hotel.getHotelId());
			
			HashMap map = new HashMap();
			
			map.put("checkinDate", null);
			map.put("checkoutDate", null);
			map.put("hotelId", hotel.getHotelId());
			ArrayList<Room> roomList = hService.selectAllRoom(map);
			
			model.addAttribute("hotel", hotel);
			model.addAttribute("hotelImgList", hotelImg);
			model.addAttribute("roomList", roomList);
			
			return "manageReserve";
		} else {
			throw new CommonException("?????? ???????????? ????????????.");
		}
	}
	
	
	@RequestMapping("writeRoom.ho")
	public String writeRoom(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		if(!m.getMemberType().equals("H")) {
			throw new CommonException("????????? ????????? ????????????.");
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
						AttachedFile img = new AttachedFile();
						img.setFileName(file.getOriginalFilename());
						img.setFileModifyName(returnArr[1]);
						img.setFileLink(returnArr[0]);
						
						list.add(img);
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
		
		int imgResult = 0;
		
		if(!list.isEmpty()) {
			imgResult = hService.insertRoomImg(list);
		}
		
		if(roomResult + imgResult == list.size()*2+1) {
			return "redirect:manageRoom.ho";
		} else {
			for(AttachedFile a : list) {
				AttachedFile.deleteFile(a.getFileModifyName(), request);
			}
			throw new CommonException("?????? ?????? ??????");
		}
	}

	
	
	
	@RequestMapping("writeHotel.ho")
	public String writeHotel(HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if(!m.getMemberType().equals("H")) {
			throw new CommonException("????????? ????????? ????????????.");
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
				
				if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg") || fileType.equals("jfif")) {
					String[] returnArr = AttachedFile.saveFile(file, request);
					
					if(returnArr[1] != null) {
						AttachedFile img = new AttachedFile();
						img.setFileName(file.getOriginalFilename());
						img.setFileModifyName(returnArr[1]);
						img.setFileLink(returnArr[0]);
						
						list.add(img);
					}
				} else {
					throw new CommonException("????????? ????????? ?????? ???????????????.");
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
		
		int imgResult = 0;
		
		if(!list.isEmpty()) {
			imgResult = hService.insertHotelImg(list);
		}
		
		if(hotelResult + imgResult == list.size()*2+1) {
			return "redirect:admin.ho";
		} else {
			for(AttachedFile a : list) {
				AttachedFile.deleteFile(a.getFileModifyName(), request);
			}
			throw new CommonException("?????? ?????? ??????");
		}
	}
	
	
	@RequestMapping("modifyHotel.ho")
	public String modifyHotel(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		if(m.getMemberType().equals("H")) {
			Hotel hotel = hService.selectHotelbyId(m.getId());
			ArrayList<AttachedFile> hotelImg = hService.selectHotelImg(hotel.getHotelId());
			
			model.addAttribute("hotel", hotel);
			model.addAttribute("hotelImgList", hotelImg);
			
			return "modifyHotel";
		} else {
			throw new CommonException("?????? ???????????? ????????????.");
		}
	}
	
	
	@RequestMapping("updateHotel.ho")
	public String updateHotel(HttpSession session, HttpServletRequest request, @ModelAttribute Hotel h, @RequestParam(value="newImg", required=false) ArrayList<MultipartFile> newImg, @RequestParam("deleteImg") String deleteImg, @RequestParam("originalImgCount") int originalImgCount) {
		Member m = (Member)session.getAttribute("loginUser");
		if(m.getMemberType().equals("H") && m.getId().equals(h.getEntId())) {
			
			ArrayList<AttachedFile> originalList = hService.selectHotelImg(h.getHotelId());
			ArrayList<String> deleteImgList = new ArrayList<String>();
			
			boolean newThumbnail = false;
			
			// ????????? ???????????? ?????? ??????
			if(deleteImg.length()>0) {
				for(String i : deleteImg.split("/")) {
					AttachedFile.deleteFile(i.substring(0, i.length()-1), request);
					if(i.substring(i.length()-1).equals("Y")) {
						newThumbnail = true;
					}
					deleteImgList.add(i.substring(0, i.length()-1));
				}
				int deleteFileResult = hService.deleteFile(deleteImgList);
			}
			
			// ?????? ????????? ????????? ??????
			boolean deleteAllExisting = originalImgCount-deleteImgList.size()==0 ? true : false;
			
			// ????????? ???????????? ?????? ??????
			ArrayList<AttachedFile> newImgList = new ArrayList();
			if(newImg!=null) {
				for(MultipartFile file : newImg) {
					String fileName = file.getOriginalFilename();
					if(!fileName.equals("")) {
						String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
						
						if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg")) {
							String[] returnArr = AttachedFile.saveFile(file, request);
							
							if(returnArr[1] != null) {
								AttachedFile img = new AttachedFile();
								img.setFileName(file.getOriginalFilename());
								img.setFileModifyName(returnArr[1]);
								img.setFileLink(returnArr[0]);
								
								newImgList.add(img);
							}
						}
					}
				}
				HashMap map = new HashMap();
				map.put("list", newImgList);
				map.put("hotelId", h.getHotelId());
				
				// ????????? ??????
				for(int i = 0; i < newImgList.size(); i++) {
					AttachedFile a = newImgList.get(i);
					if(deleteAllExisting && i==0) {
						a.setFileThumbnail("Y");
					} else {
						a.setFileThumbnail("N");
					}
				}
				int imgResult = hService.updateHotelImg(map);
				
			// ????????? ???????????? ?????? ?????? + ???????????? ????????? ??????
			} else if(newThumbnail && !deleteAllExisting) {
				int updateHotelThumbnailResult = hService.updateHotelThumbnail(h.getHotelId());
			}
			
			
			int result = hService.updateHotel(h);
			
			return "redirect:manageHotel.ho";
		} else {
			throw new CommonException("?????? ???????????? ????????????.");
		}
	}
	
	
	@RequestMapping("modifyRoom.ho")
	public String modifyRoom(@RequestParam("roomId") int roomId, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");

		Room room = hService.selectRoom(roomId);
		ArrayList<AttachedFile> roomImgList = hService.selectRoomImg(roomId);
		
		model.addAttribute("room", room);
		model.addAttribute("roomImgList", roomImgList);
		
		return "modifyRoom";
	}
	
	@RequestMapping("updateRoom.ho")
	public String updateRoom(HttpSession session, HttpServletRequest request, @ModelAttribute Room r, @RequestParam(value="newImg", required=false) ArrayList<MultipartFile> newImg, @RequestParam("deleteImg") String deleteImg, @RequestParam("originalImgCount") int originalImgCount) {
		Member m = (Member)session.getAttribute("loginUser");
		if(m.getMemberType().equals("H")) {
			
			ArrayList<AttachedFile> originalList = hService.selectRoomImg(r.getRoomId());
			ArrayList<String> deleteImgList = new ArrayList<String>();
			
			boolean newThumbnail = false;
			
			// ????????? ???????????? ?????? ??????
			if(deleteImg.length()>0) {
				for(String i : deleteImg.split("/")) {
					AttachedFile.deleteFile(i.substring(0, i.length()-1), request);
					if(i.substring(i.length()-1).equals("Y")) {
						newThumbnail = true;
					}
					deleteImgList.add(i.substring(0, i.length()-1));
				}
				int deleteFileResult = hService.deleteFile(deleteImgList);
			}
			
			// ?????? ????????? ????????? ??????
			boolean deleteAllExisting = originalImgCount-deleteImgList.size()==0 ? true : false;
			
			// ????????? ???????????? ?????? ??????
			ArrayList<AttachedFile> newImgList = new ArrayList();
			if(newImg!=null) {
				for(MultipartFile file : newImg) {
					String fileName = file.getOriginalFilename();
					if(!fileName.equals("")) {
						String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
						
						if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg")) {
							String[] returnArr = AttachedFile.saveFile(file, request);
							
							if(returnArr[1] != null) {
								AttachedFile img = new AttachedFile();
								img.setFileName(file.getOriginalFilename());
								img.setFileModifyName(returnArr[1]);
								img.setFileLink(returnArr[0]);
								
								newImgList.add(img);
							}
						}
					}
				}
				HashMap map = new HashMap();
				map.put("list", newImgList);
				map.put("roomId", r.getRoomId());
				
				// ????????? ??????
				if(newThumbnail) {
					for(int i = 0; i < newImgList.size(); i++) {
						AttachedFile a = newImgList.get(i);
						if(deleteAllExisting && i==0) {
							a.setFileThumbnail("Y");
						} else {
							a.setFileThumbnail("N");
						}
					}
					if(!deleteAllExisting) {
						hService.updateRoomThumbnail(r.getRoomId());
					}
				}
				int imgResult = hService.updateRoomImg(map);
				
			// ????????? ???????????? ?????? ?????? + ???????????? ????????? ??????
			} else if(newThumbnail && !deleteAllExisting) {
				int updateRoomThumbnailResult = hService.updateRoomThumbnail(r.getRoomId());
			}
			
			
			int result = hService.updateRoom(r);
			
			return "redirect:manageRoom.ho";
		} else {
			throw new CommonException("?????? ???????????? ????????????.");
		}
	}
	
	
	@RequestMapping(value="deleteRoom.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void deleteRoom(@RequestParam("roomId") int roomId, HttpServletResponse response) {
		int result = hService.deleteRoom(roomId);
		int imgResult = hService.deleteRoomImg(roomId);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(result, response.getWriter());
			gson.toJson(imgResult, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="insertReply.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void insertReply(HttpServletResponse response, @RequestParam("reviewId") int reviewId, @RequestParam("businessReply") String businessReply) {
		HashMap map = new HashMap();
		map.put("reviewId", reviewId);
		map.put("businessReply", businessReply);
		
		int result = hService.insertReply(map);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(result, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="selectReservationList.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void selectReservationList(HttpServletResponse response, @RequestParam("page") Integer page, @RequestParam("statusCategory") String statusCategory, @RequestParam("roomCategory") int roomCategory, @RequestParam(value="searchValue", required=false) String searchValue, @RequestParam("hotelId") int hotelId) {
		
		HashMap map = new HashMap();
		map.put("hotelId", hotelId);
		map.put("statusCategory", statusCategory);
		map.put("roomCategory", roomCategory);
		map.put("searchValue", searchValue);
		
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		int listCount = hService.getReservationListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 4);
		int maxPage = pi.getMaxPage();
		
		ArrayList<Reservation> list = hService.selectReservationList(map, pi);
		
		HashMap map2 = new HashMap();
		map2.put("list", list);
		map2.put("maxPage", maxPage);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(map2, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="deleteReservation.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void deleteReservation(@RequestParam("reservationId") int reservationId, HttpServletResponse response) {
		int result = hService.deleteReservation(reservationId);
		String imp_uid = String.valueOf(reservationId);
		
		String token = Payment.getToken();
//		int amount = Payment.paymentInfo(imp_uid, token);
		Payment.paymentCancle(token, imp_uid, 100, "????????? ??????");
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(result, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	// ????????????
	
	@RequestMapping("hotelList.ho")
	public String hotelList() {
		return "hotelList";
	}
	
	
	@RequestMapping(value="searchHotelList.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void searchHotelList(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="searchValue", required=false) String searchValue, @RequestParam(value="orderBy", required=false) String orderBy, @RequestParam("checkinDate") Date checkinDate, @RequestParam("checkoutDate") Date checkoutDate, @RequestParam(value="maxPrice", required=false) int maxPrice, @RequestParam(value="minPrice", required=false) int minPrice, @RequestParam(value="maxDistance", required=false) Integer maxDistance, @RequestParam(value="geoX", required=false) Double geoX, @RequestParam(value="geoY", required=false) Double geoY, @RequestParam(value="star", required=false) ArrayList<Integer> star, @RequestParam(value="install", required=false) ArrayList<String> install, HttpServletResponse response) {
		
		String wifi=install.get(0);
		String breakfast=install.get(1);
		String amenity=install.get(2);
		String park=install.get(3);
		String swim=install.get(4);
		String fitness=install.get(5);
		
		HashMap searchMap = new HashMap();
		searchMap.put("searchValue", searchValue);
		searchMap.put("orderBy", orderBy);
		searchMap.put("checkinDate", checkinDate);
		searchMap.put("checkoutDate", checkoutDate);
		searchMap.put("minPrice", minPrice*10000);
		searchMap.put("maxPrice", maxPrice*10000);
		searchMap.put("maxDistance", maxDistance);
		searchMap.put("geoX", geoX);
		searchMap.put("geoY", geoY);
		searchMap.put("star", star);
		searchMap.put("wifi", wifi);
		searchMap.put("breakfast", breakfast);
		searchMap.put("amenity", amenity);
		searchMap.put("park", park);
		searchMap.put("swim", swim);
		searchMap.put("fitness", fitness);
		
		int listCount = hService.getSearchListCount(searchMap);
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 3);
		int maxPage = pi.getMaxPage();
		
		ArrayList<Hotel> hotelList = hService.searchHotelList(searchMap, pi);
		
		HashMap map = new HashMap();
		map.put("hotelList", hotelList);
		map.put("maxPage", maxPage);
		
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
	public String hotelDetail(@RequestParam("hotelId") int hotelId, @RequestParam(value="checkinDate", required=false) Date checkinDate, @RequestParam(value="checkoutDate", required=false) Date checkoutDate, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");

		Hotel hotel = hService.selectHotel(hotelId);
		ArrayList<AttachedFile> hotelImgList = hService.selectHotelImg(hotelId);
		
		if(m!=null) {
			LikeHotel l = new LikeHotel();
			l.setId(m.getId());
			l.setHotelId(hotel.getHotelId());
			
			int isLikeHotel = hService.isLikeHotel(l);
			model.addAttribute("isLikeHotel", isLikeHotel);
		}
		
		model.addAttribute("hotel", hotel);
		model.addAttribute("hotelImgList", hotelImgList);
		model.addAttribute("checkinDate", checkinDate);
		model.addAttribute("checkoutDate", checkoutDate);
		
		return "hotelDetail";
	}
	
	
	@RequestMapping(value="selectAllRoom.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void selectAllRoom(@RequestParam("hotelId") int hotelId, @RequestParam(value="checkinDate", required=false) Date checkinDate, @RequestParam(value="checkoutDate", required=false) Date checkoutDate, @RequestParam(value="searchValue", required=false) String searchValue, @RequestParam(value="orderBy", required=false) String orderBy, Model model, HttpServletResponse response) {
		HashMap map = new HashMap();
		
		map.put("checkinDate", checkinDate);
		map.put("checkoutDate", checkoutDate);
		map.put("hotelId", hotelId);
		map.put("searchValue", searchValue);
		map.put("orderBy", orderBy);
		
		ArrayList<Room> roomList = hService.selectAllRoom(map);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(roomList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
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
	
	
	
	
	// ?????? ????????? ??????
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
	
	//?????? ????????????
	@RequestMapping(value="reviewList.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void reviewList(HttpSession session, @RequestParam(value="page", required=false) Integer page, @RequestParam("hotelId") int hotelId, @RequestParam(value="searchByRoom", required=false) Integer searchByRoom, @RequestParam(value="orderBy", required=false) String orderBy, HttpServletResponse response) {
		String id = (Member)session.getAttribute("loginUser")==null ? null : ((Member)session.getAttribute("loginUser")).getId();
		HashMap map = new HashMap();
		map.put("hotelId", hotelId);
		map.put("id", id);
		map.put("searchByRoom", searchByRoom);
		map.put("orderBy", orderBy);
		
		int listCount = hService.getReviewListCount(map);
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 4);
		int maxPage = pi.getMaxPage();
		
		ArrayList<Review> reviewList = hService.selectReviewList(map, pi);
		int reviewCount = hService.selectReviewCount(hotelId);
		double avgRating = hService.selectAvgRating(hotelId);
		
		HashMap map2 = new HashMap();
		map2.put("reviewList", reviewList);
		map2.put("reviewCount", reviewCount);
		map2.put("avgRating", avgRating);
		map2.put("maxPage", maxPage);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(map2, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}

	
	// ?????? ??????
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
		
		// Reserve ????????? ??????
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
		
		// ???????????? ????????????
		int reservationId = hService.getCurrReservationId();
		r.setReservationId(reservationId);
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
	
	
	@RequestMapping(value="insertReport.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void insertReport(HttpServletResponse response, @ModelAttribute Report report) {
		report.setReportClassification("H");
		int result = hService.insertReport(report);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(result, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
}
