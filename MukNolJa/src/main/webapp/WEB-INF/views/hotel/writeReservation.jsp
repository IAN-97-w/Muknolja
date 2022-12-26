<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
  	* {font-family: 'Noto Sans KR', sans-serif;}
  	
	.mukRound {border-radius: 8px;}
	.mukButton {background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.myHover:hover {cursor: pointer; background-color: rgba(205, 92, 92, 0.1);}
	.mukMutedText {color:#B9B9B9;}
	
	.termsModalButton {color:#B9B9B9;}
	.termsModalButton:hover {text-decoration:underline}
	
	.mukCheckbox { width:auto; display: block; position:relative; padding-left:30px; margin-bottom: 10px; cursor: pointer; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	.mukCheckbox input[type="checkbox"] { display: none; }
	.on { width: 24px; height: 24px; border:2px solid #f1f1f1; border-radius:4px; position: absolute; top: 0; left: 0; }
	.mukCheckbox input[type="checkbox"]:checked + .on { background: #6BB6EC; border:2px solid #6BB6EC; }
	.on:after { content: ""; position: absolute; display: none; }
	.mukCheckbox input[type="checkbox"]:checked + .on:after { display: block; }
	.on:after { width: 8px; height: 14px; border: solid #fff; border-radius:1px; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; bottom: 5px; }
	
</style>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>
<body>
	<div class="modal fade" id="termsModal" aria-hidden="true" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content p-3">
				<div class="modal-header" style="border-bottom:0;">
					<h5 class="modal-title fw-bold">숙소이용규칙 및 취소/환불 규정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="fw-bold pb-3">이용규칙</div>
					<div class="mukMutedText">
						최대 인원 초과 시 입실 불가합니다.<br>
						정원 기준 요금 외 인원 추가 요금은 현장결제입니다.<br>
						제공 이미지는 배정된 객실과 다를 수 있습니다.<br>
						제공 정보는 숙소 사정에 따라 변경될 수 있습니다.<br>
						미성년자는 보호자 동반 시 투숙이 가능합니다.<br>
						업체 현장에서 객실 컨디션 및 서비스로 인해 발생된 분쟁은 먹놀자에서 책임지지 않습니다.
					</div>
					<div class="fw-bold pt-5 pb-3">취소/환불규정</div>
					<div class="mukMutedText">
						숙소 사정에 의해 취소 발생시 100% 환불이 가능합니다.<br>
						예약 상품 별 숙소 정보에 기재된 취소, 환불 규정을 반드시 확인 후 이용해주시기 바랍니다.<br>
						예약 이후의 취소는 취소/환불 규정에 의거하여 적용됩니다.<br>
						취소, 변경 불가 상품은 규정과 상관없이 취소, 변경이 불가합니다.<br>
						당일 결제를 포함한 체크인 당일 취소는 취소, 변경이 불가합니다.<br>
						예약 취소가 불가능한 시간에 고객 사정에 의한 취소 시, 먹놀자가 제공하는 모든 혜택에서 제외될 수 있으며, 본 예약 시 사용한 쿠폰은 소멸됩니다.<br>
						단! 숙소의 객실 정보가 수시로 변경될 수 있으며 이로 인한 불이익은 먹놀자가 책임지지 않습니다.
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="container mt-5 mb-5">
		<form id="reservationForm" action="insertReservation.ho" class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-2 justify-content-between">
			
			<div class="col-md-6 col-lg-6 pt-5">
			
				<!-- 예약자 정보 시작 -->
				<h4 class="fw-bold pb-3">예약자 정보</h4>
				<div class="mb-5">
					<label for="reservationName" class="form-label mukMutedText">예약자 이름</label>
					<input type="text" class="form-control" name="reservationName" placeholder="체크인시 필요한 정보입니다." value="${loginUser.name }" required>
				</div>
				<div class="mb-5">
					<label for="reservationPhone" class="form-label mukMutedText">휴대폰 번호</label>
					<input type="tel" class="form-control" name="reservationPhone" placeholder="체크인시 필요한 정보입니다." value="${loginUser.phone }" required>
				</div>
				<!-- 예약자 정보 끝 -->
				<!-- 결제수단 선택 시작 -->
				<div class="mt-5 mb-5">
					<h4 class="fw-bold pb-3">결제수단 선택</h4>
					<select class="form-select" name="paymentMethod">
						<option selected value="html5_inicis">신용카드</option>
						<option value="kakaopay">카카오페이</option>
						<option value="tosspay">토스페이</option>
					</select>
				</div>
				<div class="mt-4 mb-5">
					<label for="checkAll" class="mukCheckbox">
						<input type="checkbox" name='terms' id="checkAll"><span class="on"></span>
						<span class="fw-bold">전체동의</span>
					</label>
					<label for="terms1" class="mukCheckbox">
						<input type="checkbox" name='terms' id="terms1"><span class="on"></span>
						<span class="termsModalButton" data-bs-toggle="modal" data-bs-target="#termsModal">숙소이용규칙 및 취소/환불 규정</span>
					</label>
					<label for="terms2" class="mukCheckbox">
						<input type="checkbox" name='terms' id="terms2"><span class="on"></span>
						<span class="termsModalButton">개인정보 수집 및 이용 동의</span>
					</label>
					<label for="terms3" class="mukCheckbox">
						<input type="checkbox" name='terms' id="terms3"><span class="on"></span>
						<span class="termsModalButton">개인정보 제 3자 제공 동의</span>
					</label>
					<label for="terms4" class="mukCheckbox">
						<input type="checkbox" name='terms' id="terms4"><span class="on"></span>
						<span class="termsModalButton">만 14세 이상 확인</span>
					</label>
				</div>
				<!-- 결제수단 선택 끝 -->
			</div>
			
			<div class="col-md-5 col-lg-5 pt-5">
				<div id="reservationInfo">
					<div class="p-5">
						<div class="mb-3">
							<div class="mukMutedText mb-1">호텔 이름</div>
							<h5>${hotel.hotelName }</h5>
							<input type="hidden" name="hotelId" value="${hotel.hotelId }">
							<input type="hidden" name="hotelName" value="${hotel.hotelName }">
						</div>
						<div class="mb-3">
							<div class="mukMutedText mb-1">객실 이름</div>
							<h5>${room.roomName }</h5>
							<input type="hidden" name="roomId" value="${room.roomId }">
							<input type="hidden" name="roomName" value="${room.roomName }">
						</div>
						<div class="mb-3">
							<div class="mukMutedText mb-1">숙박기간</div>
							<fmt:parseNumber value="${r.checkinDate.time / (1000*60*60*24)}" integerOnly="true" var="checkinDate" scope="request"/>
							<fmt:parseNumber value="${r.checkoutDate.time / (1000*60*60*24)}" integerOnly="true" var="checkoutDate" scope="request"/>
							<h5>${checkoutDate - checkinDate }박 ${checkoutDate - checkinDate+1 }일</h5>
						</div>
						<div class="mb-3">
							<div class="mukMutedText mb-1">체크인</div>
							<input type="hidden" name="checkinDate" value="${r.checkinDate }">
							<input type="hidden" name="checkinTime" value="${room.checkinTime }">
							<h5><fmt:formatDate value="${r.checkinDate }" pattern="MM.dd E" /> ${room.checkinTime }</h5>
						</div>
						<div>
							<div class="mukMutedText mb-1">체크아웃</div>
							<input type="hidden" name="checkoutDate" value="${r.checkoutDate }">
							<input type="hidden" name="checkoutTime" value="${room.checkoutTime }">
							<h5><fmt:formatDate value="${r.checkoutDate }" pattern="MM.dd E" /> ${room.checkoutTime }</h5>
						</div>
						<hr class="mukMutedText mt-5 mb-5">
						<div>
							<div class="mb-1">
								<span class="fw-bold">총 결제 금액</span><span>(VAT 포함)</span>
							</div>
							<input type="hidden" name="paymentAmount" value="${r.paymentAmount }">
							<h4 class="fw-bold" style="color:#6BB6EC"><fmt:formatNumber value="${r.paymentAmount }" pattern="#,###원"/></h4>
						</div>
					</div>
					<button type="button" id="reservationButton" class="mukButton" style="width:100%; height:50px;">결제하기</button>
				</div>
			</div>
		</form>
	</div>
	
	
	
	<!-- 약관 관련 시작 -->
	<script>
		$("#checkAll").on("click", function(){
			var boxes = $("input[name=terms]");
			if($(this).is(":checked")) {
				for(i of boxes) {
					if(!i.checked) {
						i.checked=true;
					}
				}
			} else {
				for(i of boxes) {
					if(i.checked) {
						i.checked=false;
					}
				}
			}
			console.log(boxes);
		})
		$("input[name=terms]").on("click", function() {
			var allChecked = true;
			var boxes = $("input[name=terms]");
			for(var i=1;i<boxes.length;i++) {
				if(!boxes[i].checked) {
					allChecked = false;
				}
			}
			if(allChecked) {
				$("#checkAll").prop('checked',true);
			} else {
				$("#checkAll").prop('checked',false);
			}
		});
	</script>
	<!-- 약관 관련 끝 -->
	
	<!-- 아임포트 결제 api 구현 -->
	<script>
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp30848876"); // 예: imp00000000
		
		$("#reservationButton").on("click", function(){
			
			for(i of $(".mukCheckbox")) {
				if(!i.checked) {
					alert("약관에 동의해주세요.");
					break;
				} else {
					requestPay();
				}
			}
		});
		
		function requestPay() {
			// IMP.request_pay(param, callback) 결제창 호출
			IMP.request_pay({ // param
				pg: $("select[name=paymentMethod]").val(),
				merchant_uid: "${currentReservationId}",
				name: "${hotel.hotelName} "+"${room.roomName}",
				amount: 100,
				buyer_email: "gildong@gmail.com",
				buyer_name: "${loginUser.name}",
				buyer_tel: "${loginUser.phone}",
				buyer_addr: "${loginUser.address}",
				buyer_postcode: "null"
			}, function(rsp) {
			  		console.log(rsp);
				if (rsp.success) {
					// 결제 성공 시 로직
					$("form").submit();
				} else {
					// 결제 실패 시 로직
				}
			});
		}
	</script>
	<!-- 아임포트 결제 api 구현 -->


	<!-- 전화번호 입력 설정 시작 -->
	<script>
		function autoHypenTel(str) {
			str = str.replace(/[^0-9]/g, '');
			var tmp = '';

			if (str.substring(0, 2) == 02) {
				// 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
				if (str.length < 3) {
					return str;
				} else if (str.length < 6) {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2);
					return tmp;
				} else if (str.length < 10) {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2, 3);
					tmp += '-';
					tmp += str.substr(5);
					return tmp;
				} else {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2, 4);
					tmp += '-';
					tmp += str.substr(6, 4);
					return tmp;
				}
			} else {
				// 핸드폰 및 다른 지역 전화번호 일 경우
				if (str.length < 4) {
					return str;
				} else if (str.length < 7) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3);
					return tmp;
				} else if (str.length < 11) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 3);
					tmp += '-';
					tmp += str.substr(6);
					return tmp;
				} else {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 4);
					tmp += '-';
					tmp += str.substr(7);
					return tmp;
				}
			}
			return str;
		}
		
		
		$('input[type=tel]').keyup(function(event) {
			event = event || window.event;
			var _val = this.value.trim();
			this.value = autoHypenTel(_val);
		});
	</script>
	<!-- 전화번호 입력 설정 끝 -->
</body>
</html>