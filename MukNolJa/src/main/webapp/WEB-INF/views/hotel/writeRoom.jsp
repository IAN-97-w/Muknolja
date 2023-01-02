<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>객실 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
  	* {font-family: 'Noto Sans KR', sans-serif;}
  	input {font-family: 'Noto Sans KR', sans-serif;}
  	select {font-family: 'Noto Sans KR', sans-serif;}
  	.form-control {border:1px solid #e9e9e9 !important; border-radius:20px !important}
	.form-select {border:1px solid #e9e9e9 !important; border-radius:20px !important}
  	::-webkit-scrollbar {width:5px;}
	::-webkit-scrollbar-thumb {background-color:#e9e9e9; border-radius:10px;}
	::-webkit-scrollbar-track {opacity:0;}
  	
	ul li {
		list-style: none;
		float: left;
		padding: 10px;
	}
	
	.mukCheckbox { width:auto; display: block; position:relative; padding-left:30px; margin-bottom: 10px; cursor: pointer; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	.mukCheckbox input[type="checkbox"] { display: none; }
	.on { width: 24px; height: 24px; border:2px solid #f1f1f1; border-radius:4px; position: absolute; top: 0; left: 0; }
	.mukCheckbox input[type="checkbox"]:checked + .on { background: #6BB6EC; border:2px solid #6BB6EC; }
	.on:after { content: ""; position: absolute; display: none; }
	.mukCheckbox input[type="checkbox"]:checked + .on:after { display: block; }
	.on:after { width: 8px; height: 14px; border: solid #fff; border-radius:1px; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; bottom: 5px; }

    .mukRound {border-radius: 8px;}
	.mukButton {transition: all 0.5s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.myHover:hover {cursor: pointer; background-color: rgba(205, 92, 92, 0.1);}
	.mukMutedText {color:#B9B9B9;}
	
	#searchAddressButton {color:#6bb6ec; cursor:pointer;}
	#searchAddressButton:hover {text-decoration:underline;}
</style>
</head>
<body>

	<div class="container-sm mt-5 mb-5" style="max-width:800px;">
		<form action="${ contextPath }/insertRoom.ho" enctype="multipart/form-data" method="post">
			<input type="hidden" name="hotelId" value="${hotel.hotelId }">
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">객실 이름</h5>
				<input type="text" class="form-control" name="roomName" required>
			</div>
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">가격</h5>
				<input type="number" class="form-control" name="roomPrice" min="1000" required>
			</div>
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">체크인 시간</h5>
				<input type="time" class="form-control" id="checkinTime" name="checkinTime" required>
			</div>
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">체크아웃 시간</h5>
				<input type="time" class="form-control" id="checkoutTime" name="checkoutTime" required>
			</div>

			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">최대 인원</h5>
				<select class="form-select" name="maxAccept">
					<option selected>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">총 객실 수</h5>
				<input type="number" class="form-control" name="totalNumber" min="1" required>
			</div>
			
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">객실 소개</h5>
				<textarea class="form-control" name="roomIntro" rows="2" style="height:100px; resize:none" required></textarea>
			</div>
			
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">상세정보</h5>
				<textarea class="form-control" name="roomInfo" rows="10" style="height:300px; resize:none" required></textarea>
			</div>
			
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3" style="display:inline-block">사진</h5>
				<span class="mukMutedText insertImgButton">최소 1장, 최대 5장의 사진을 등록할 수 있습니다.</span>
				<span id="insertImgButton" class="fw-bold" style="color:#6bb6ec; cursor:pointer">사진추가</span>
				<div id="roomImgDiv" class="col-2" style="display:none">
					<img src="#" class="img-fluid mukRound">
					<input type="file" name="roomImg" style="display:none">
				</div>
				<div id="roomImgList" class="row g-3">
				</div>
			</div>
			<div class="d-grid gap-2">
				<button type="button" id="submitButton" class="mukButton" style="width:100%; align:bottom !important">등록하기</button>
			</div>
		</form>
	</div>
	
	
	<!-- 사진 첨부 시작 -->
	<script>
	    $("#insertImgButton").on("click", function(){
	    	$("#roomImgDiv").find("input[name=roomImg]").click();
	    });
	    
	    $("input[name=roomImg]").on("change", function(e) {
			var tmp = e.target.files[0];
			var img = URL.createObjectURL(tmp);
			
			console.log($(this).parent().find("input"));
			var div = $(this).parent().clone();

			div.find("img").attr("src", img);
			div.prop("style").removeProperty("display");
			div.addClass("roomImg");
			$("#roomImgList").append(div);
			
			$(this).val("");
			$.viewInsertImgButton();
		});
	    
	    $(document).on('click', '.roomImg', function(){
	    	$(this).remove();
	    	$.viewInsertImgButton();
	    });
	    
	    $.viewInsertImgButton=()=>{
	    	const count = $("#roomImgList").children().length;
	    	if(count>=5) {
	    		$("#insertImgButton").css("display", "none");
	    	} else {
	    		$("#insertImgButton").prop("style").removeProperty("display");
	    	}
	    }
	    $.viewInsertImgButton();
	    
	</script>
	<!-- 사진 첨부 끝 -->
	
	<!-- 호텔 정보 엔터 구현, hotelImgDiv 삭제 시작 -->
	<script>
		$("#submitButton").on("click", function(){
			if($("#roomImgList").children().length==0) {
				alert("1개 이상의 이미지를 첨부해주세요.");
			} else {
				$("#roomImgDiv").remove();
				$("form").submit();
			}
		});
	</script>
	<!-- 호텔 정보 엔터 구현 끝 -->
</body>
</html>