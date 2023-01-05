<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<meta name="theme-color" content="#6bb6ec">
<title>${hotel.hotelName } :: 관리자 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	.form-control {border:1px solid #e9e9e9 !important}
  	* {font-family: 'Noto Sans KR', sans-serif;}
	::-webkit-scrollbar {width:5px;}
	::-webkit-scrollbar-thumb {background-color:#e9e9e9; border-radius:10px;}
	::-webkit-scrollbar-track {opacity:0;}
		html, body {
		width: 100%;
		height: 100%;
		margin: 0;
		padding: 0;
		font-size: 100%;
	}
	.nav-scroller {
		position: relative;
		z-index: 2;
		height: 2.75rem;
		overflow-y: hidden;
	}
	.nav-scroller .nav {
		display: flex;
		flex-wrap: nowrap;
		padding-bottom: 1rem;
		margin-top: -1px;
		overflow-x: auto;
		text-align: center;
		white-space: nowrap;
		-webkit-overflow-scrolling: touch;
	}
	
	.nav-link {
		color:rgba(0,0,0,.56) !important;
	}
	.nav-link:hover {
		color:#6bb6ec !important;
	}
	
	.room {
		cursor: pointer;
	}
	.table tr td {
		padding:0px;
	}
	
	#roomTable td {
		margin:0px;
		padding:0px;
	}
	.roomDetailModal_roomImg {transition: all 0.3s;}
	.roomDetailModal_roomImg:hover { opacity:0.5; }
	.mukCategory {color:#6BB6EC !important; border-bottom:3px solid #6BB6EC; font-weight:bold;}
	.mukDisplayNone {display:none !important;}
	.mukRound {border-radius: 8px;}
	.mukButton {transition: all 0.3s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.myHover:hover {cursor: pointer; background-color: rgba(205, 92, 92, 0.1);}
	.mukMutedText {color:#B9B9B9;}
	.mukSubText {color:rgba(0,0,0,.56);}
	
	#writeRoomButton {color:#6bb6ec; cursor:pointer;}
	#writeRoomButton:hover {text-decoration:underline;}
	
	#modifyButton {transition: all 0.3s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	#deleteButton {transition: all 0.3s; background: white; height:40px; border-radius: 8px; padding:0px 10px; color: #6BB6EC; border: 1px solid #6BB6EC;}
</style>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>

	
	<div class="container">
	
		<div class="row">
			<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar shadow collapse" style="height:100%; left:0px; position:fixed;">
				<div class="position-sticky sidebar-sticky">
					<div class="text-center pb-4 m-3 mt-5 mb-5" style="border-bottom:1px solid #e9e9e9">
						<img id="hotelImg" class="img-fluid mb-3" style="width:100px; height:100px; border-radius:50%" src="${contextPath }/resources/uploadFiles/${hotelImgList[0].fileModifyName}">
						<h5 class="fw-bold mukSubText">${hotel.hotelName }</h5>
					</div>
					<ul class="nav flex-column">
						<li class="nav-item">
							<a class="nav-link" href="${contextPath }/admin.ho">
								<i class="fa-solid fa-house"></i>
								<span data-feather="home" class="align-text-bottom"></span>
								통계
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${contextPath }/manageHotel.ho">
								<i class="fa-solid fa-hotel"></i>
								<span data-feather="file" class="align-text-bottom"></span>
								호텔 관리
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="${contextPath }/manageRoom.ho">
								<i class="fa-solid fa-door-closed"></i>
								<span data-feather="file" class="align-text-bottom"></span>
								객실 관리
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="${contextPath }/manageReserve.ho">
								<i class="fa-solid fa-book"></i>
								<span data-feather="file" class="align-text-bottom"></span>
								예약 관리
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="${contextPath }/manageReview.ho">
								<i class="fa-solid fa-message"></i>
								<span data-feather="file" class="align-text-bottom"></span>
								리뷰 관리
							</a>
						</li>
					</ul>
				</div>
			</nav>
			
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mb-5">
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-4 pb-3 mb-5" style="border-bottom:1px solid #e9e9e9">
					<h1 class="h2 fw-bold">통계</h1>
				</div>
				<h4>최근 매출</h4>
				<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
			</main>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
		var context = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(context, {
			type : 'line', // 차트의 형태
			data : { // 차트에 들어갈 데이터
				labels : [
					'${stasticsList[0].PAYMENT_DATE}',
					'${stasticsList[1].PAYMENT_DATE}',
					'${stasticsList[2].PAYMENT_DATE}',
					'${stasticsList[3].PAYMENT_DATE}',
					'${stasticsList[4].PAYMENT_DATE}',
					'${stasticsList[5].PAYMENT_DATE}'
				],
				datasets : [
						{ //데이터
							label : '매출액', //차트 제목
							yAxisID: "sum",
							fill : true, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [
								'${stasticsList[0].SUM}',
								'${stasticsList[1].SUM}',
								'${stasticsList[2].SUM}',
								'${stasticsList[3].SUM}',
								'${stasticsList[4].SUM}',
								'${stasticsList[5].SUM}'
							],
							// 색상
							backgroundColor : 'rgba(255, 214, 0, 0.2)',
							// 경계선 색상
							borderColor : 'rgba(255, 214, 0, 1)',
							borderWidth : 1
						//경계선 굵기
						},
						{
							label : '예약건수',
							yAxisID: "count",
							fill : true,
							data : [
								'${stasticsList[0].COUNT}',
								'${stasticsList[1].COUNT}',
								'${stasticsList[2].COUNT}',
								'${stasticsList[3].COUNT}',
								'${stasticsList[4].COUNT}',
								'${stasticsList[5].COUNT}'
							],
							backgroundColor : 'rgba(107, 182, 236, 0.2)',
							borderColor : 'rgba(107, 182, 236, 1)',
							borderWidth : 1
						} ]
			},
			options : {
				scales : {
					yAxes : [
// 						{
// 							ticks : {
// 								beginAtZero : true
// 							}
// 						},
						{
							id: "sum",
							type: 'linear',
							position: "left",
							ticks : {
								beginAtZero : true,
							},
							grid: {
						    	display: false
							}
						},
						{
							id: "count",
							type: 'linear',
							position: "right",
							ticks : {
								beginAtZero : true,
								stepSize: 10,
							},
							grid: {
						    	display: false
							}
						}
					]
				}
			}
		});
	</script>

</body>
</html>