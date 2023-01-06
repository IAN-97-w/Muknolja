﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<style>
    
    body {
  background: #f2f2f2;
}
 .ur{
 box-shadow: 0px 15px 30px 0px rgba(0,0,0,0.3);
 padding-left:0px;
  padding-bottom:0px;
  margin-left:0px;
   border-radius:10px;
   border: 2px solid  RGB(107, 182, 236, 0.3);
  
}
li{list-style:none;}

  .ll{
  font-size: 20px;
  font-weight: 600;
  width:100%;
  
  color: #575757;
  text-align: center;
  height: 60px;
  float:left;
  vertical-align: middle;
  line-height: 3em;
  border: 1px solid #fffcfb;
  border-radius:10px;
  position: relative;
  display: block;
  text-decoration: none;
  box-shadow: 0em 1.5em 0 ,lightgrey;
  transition: all .25s linear;
  }
  .ll:hover {
    background: #6BB6EC;
    color: #fffcfb;
    transform: translate(-.9em, -.9em);
    transition: all .25s linear;
    box-shadow: 0.5em 2em 0 #e1e1e1;
    }
    
    .ll{
      transition: all .25s linear; 
	}
    
    #39{background: #6BB6EC; color:white;}    
    
    

	
	
	
	
	.im{
		height:250px;
		width:260px;
		margin-right:40px;
		box-shadow: 5px 5px 5px 5px rgba(0,0,0,0.3);
		border-radius:10px;
		
		}
	.slide_wrapper{
		paddinf-left:0px;
		position: relative;
		margin-top:30px;
		
		height: 280px;
		overflow:hidden;
		display:flex;
		
		}
		.slides{
		  position: absolute;
		  display:flex;
		  transition:left 0.5s ease-out;
		  padding-left:0px;
		  left:0px;
		  width:3070px;
		 
		 }
		 .slides li{
		 float:left;
		 margin-right: 30px;
		 }
		 .slides li:not(:last-child){
		 	float:left;
		 	margin-right: 30px;
		 }
		 .
		 .controls{
		 text-laign: center;
		 
		 }
		 
		 .slide_wrapper1{
		paddinf-left:0px;
		position: relative;
		margin-top:30px;
		
		height: 280px;
		overflow:hidden;
		display:flex;
	
		}
		.slides1{
		  position: absolute;
		  display:flex;
		  transition:left 0.5s ease-out;
		  padding-left:0px;
		  left:0px;
		  width:3070px;
		 }
		 .slides1 li{
		 float:left;
		 margin-right: 30px;
		 }
		 .slides1 li:not(:last-child){
		 	float:left;
		 	margin-right: 30px;
		 }
		 .
		 .controls1{
		 text-laign: center;
		 
		 }
		
		
		.slide_wrapper2{
		paddinf-left:0px;
		position: relative;
		margin-top:30px;
		
		height: 280px;
		overflow:hidden;
		display:flex;
	
		}
		.slides2{
		  position: absolute;
		  display:flex;
		  transition:left 0.5s ease-out;
		  padding-left:0px;
		  left:0px;
		 width:3070px;
		 }
		 .slides2 li{
		 float:left;
		 margin-right: 30px;
		 }
		 .slides2 li:not(:last-child){
		 	float:left;
		 	margin-right: 30px;
		 }
		 .
		 .controls2{
		 text-laign: center;
		 
		 }
		 #carouselExampleInterval{height: 350px; margin-top: 80px;}
		 #carouselExampleInterval img{height:350px;}
		 #notice_modal1, #notice_modal2{
	      	display: none;
			width: 400px;
			height: 400px;
			padding: 20px 20px;
			background-color: #fefefe;
			border: 1px solid #888;
			border-radius: 3px;
	      }
	      .cn{
			position: absolute;
			top: 10px;
			right: 10px;
			text-decoration: none;
			color: black;
		  }
    </style>
  </head>
  <body style="">
   
   

    <jsp:include page="member/menubar.jsp"/>
    
    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<img src="resources/img/adadad.png" class="d-block w-100 adimg" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="2000">
				<img src="resources/img/adadad.png" class="d-block w-100 adimg" alt="...">
			</div>
			<div class="carousel-item">
				<img src="resources/img/adadad.png" class="d-block w-100 adimg" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
		
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
     <div class="container-fluid text-center pb-5">
	  	<div class="row justify-content-center" style=" min-height:100vh; ">
            <div class="col-9 " style=" min-height:100vh;">
	  		
            <br>
            <div class="row justify-content-center " style="  ">
            <div class="col" style="padding-left:0px; padding-right:0px;"  >
            			<ul class="ur" >
					    	<div style="display:flex;" lass="ur1">
					    		<li class="ll" id="0">전체</li>
						    	<li class="ll" id="1">서울</li>
						    	<li class="ll" id="2">인천</li>
						    	<li class="ll" id="3">대전</li>
						    	<li class="ll" id="4">대구</li>
						    	<li class="ll" id="5">광주</li>
						    	<li class="ll" id="6">부산</li>
						    	<li class="ll" id="7">울산</li>
						    	<li class="ll" id="8">세종</li>
						    
						    	</div>
						    	<div style="display:flex;">
						    	<li class="ll" id="31">경기</li>
						    	<li class="ll" id="32">강원</li>
						    	<li class="ll" id="33">충북</li>
						    	<li class="ll" id="34">충남</li>
						    	<li class="ll" id="35">경북</li>
						    	<li class="ll" id="36">경남</li>
						    	<li class="ll" id="37">전북</li>
						    	<li class="ll" id="38">전남</li>
						    	<li class="ll" id="39">제주</li>
						    	
						    </div>
					    </ul>
					   <br>
					   </div>
					   </div>
					   <div class="row justify-content-center" >
					   	<div class="col-10">
					   <div style="font-size:30px; margin-top:20px; font-weight:600; float: left; margin-l">관광지</div>
					   </div>
					   </div>
				<div class="row justify-content-center" style=" margin-top:10px; box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3); border: 2px solid  RGB(107, 182, 236, 0.3); border-radius:10px;">
					
					<div class="col-1">
						<p class="controls">
            			<h1 class="prev" style="margin-top:130px;"><i class="bi bi-chevron-compact-left"></i></h1>
					</div>
					<div class="col-10" style="float: left;">   
					 
		            	<div class="slide_wrapper" >
		            		<ul class="slides">
		            			<li id="li1" style="display:flex;">
		            				
		            			</li>
		            		</ul>
		            		
		            		</div>
		            		</div>	 
		            		<div class="col-1">
            		<p class="controls">
            			
            			<h1 class="next" style="margin-top:130px;"><i class="bi bi-chevron-compact-right"></i></h1>
            		</p>
            		</div>
            	</div>
            	
            	<div class="row justify-content-center"  >
					   	<div class="col-10">
					   <div style="font-size:30px; margin-top:50px; font-weight:600; float: left; margin-l">맛집</div>
					   </div>
					   </div>
            	
            	<div class="row justify-content-center" style="margin-top:10px; box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3); border: 2px solid  RGB(107, 182, 236, 0.3); border-radius:10px;">
					<div class="col-1">
						<p class="controls1">
            			<h1 class="prev1" style="margin-top:130px;"><i class="bi bi-chevron-compact-left"></i></h1>
					</div>
					<div class="col-10" style="float: left;">    
		            	<div class="slide_wrapper1" >
		            		<ul class="slides1">
		            			<li style="display:flex;" id="li2">
		            				
		            			</li>
		            		</ul>
		            		
		            		</div>
		            		</div>	 
		            		<div class="col-1">
            		<p class="controls1">
            			
            			<h1 class="next1" style="margin-top:130px;"><i class="bi bi-chevron-compact-right"></i></h1>
            		</p>
            		</div>
            	</div>
            	<div class="row justify-content-center"  >
					   	<div class="col-10">
					   <div style="font-size:30px; margin-top:50px; font-weight:600; float: left; margin-l">축제</div>
					   </div>
					   </div>
            	
            	<div class="row justify-content-center" style="margin-top:10px; box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3); border: 2px solid  RGB(107, 182, 236, 0.3); border-radius:10px;">
					<div class="col-1">
						<p class="controls2">
            			<h1 class="prev2" style="margin-top:130px;"><i class="bi bi-chevron-compact-left"></i></h1>
					</div>
					<div class="col-10" style="float: left;">    
		            	<div class="slide_wrapper2" >
		            		<ul class="slides2">
		            			<li style="display:flex;" id="li3">
		            				
		            			</li>
		            		</ul>
		            		
		            		</div>
		            		</div>	 
		            		<div class="col-1">
            		<p class="controls2">
            			
            			<h1 class="next2" style="margin-top:130px;"><i class="bi bi-chevron-compact-right"></i></h1>
            		</p>
            		</div>
            	</div>
            	
            </div>
       </div>
    </div>
    
    <div id="notice_modal1">
    	<a class="close_btn cn"><i class="bi bi-x-circle"></i></a>
    	<div class="container">
		<div class="row text-center">
			<div class="col"><h2 id="noticeTitleDiv"></h2></div>
		</div>
		<br>
		<div class="row text-center">
			<div class="col" id="noticeContentDiv"></div>
		</div>
		<br>
		<div class="row text-center">
			<div class="col">
				<img id="noticeImg" alt="..." src="" style="display:none; max-width: 100%">
			</div>
		</div>
	</div>
    </div>
    <div id="notice_modal2">
    	<a class="close_btn cn"><i class="bi bi-x-circle"></i></a>
    	<div class="container">
		<div class="row text-center">
			<div class="col"><h2 id="noticeTitleDiv2"></h2></div>
		</div>
		<br>
		<div class="row text-center">
			<div class="col" id="noticeContentDiv2"></div>
		</div>
		<br>
		<div class="row text-center">
			<div class="col">
				<img id="noticeImg2" alt="..." src="" style="display:none; max-width: 100%">
			</div>
		</div>
	</div>
    </div>
  		    
    <jsp:include page="common/footer.jsp"/>
    <script>
    
	window.onload = () =>{
		
		// 공지 불러오기
		$.ajax({
			url: 'selectNoticeList.me',
			success: (data) => {
				if(data != null){
					document.getElementById('noticeImg').style.display = 'none';
					
					document.getElementById('noticeTitleDiv').innerText = data[0].boardTitle;
					document.getElementById('noticeContentDiv').innerText = data[0].boardContent;
					document.getElementById('noticeImg').src = 'resources/uploadFiles/' + data[0].fileModifyName;
					document.getElementById('noticeImg').style.display = 'block';
					
					ModalN('notice_modal1');
					if(data[1] != null){
						document.getElementById('noticeImg2').style.display = 'none';
						
						document.getElementById('noticeTitleDiv2').innerText = data[1].boardTitle;
						document.getElementById('noticeContentDiv2').innerText = data[1].boardContent;
						document.getElementById('noticeImg2').src = 'resources/uploadFiles/' + data[1].fileModifyName;
						document.getElementById('noticeImg2').style.display = 'block';
						
						ModalN2('notice_modal2');
					}
				}
			}
		});
		
    var area = "";
    var serviceKey = "\yYiPRe2yVa7guL2Njhvw%2BYtE7ElhOYjn4TqI3gBgD5OUZXhCHXU%2BXYs0vyzWxDH%2FWylixM81RDErIKEfOlZx0Q%3D%3D";
    
    var site1 = "http://apis.data.go.kr/B551011/KorService/areaBasedList?serviceKey=" + serviceKey + "&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=Q&contentTypeId=12&arrange=P";
    var site2 = "http://apis.data.go.kr/B551011/KorService/areaBasedList?serviceKey=" + serviceKey + "&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=Q&contentTypeId=39&arrange=P";
    var site3 = "http://apis.data.go.kr/B551011/KorService/areaBasedList?serviceKey=" + serviceKey + "&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=Q&contentTypeId=15&arrange=P";
    var site = site1 + area
    var site4 = site2 + area
    var site5 = site3 + area 
   
    
    $('#0').css({'color':'white','background':' #6BB6EC'});

    showResult(site,site4,site5);
    
    $('.ll').click(function(){
    	const areaNum = $(this).attr('id');
    	area = "&areaCode=" + areaNum;
		if(areaNum.trim() =="0"){
			
			area = "";
		}
    	site = site1 + area;
    	site4 = site2 + area;
    	site5 = site3 + area; 
    	$('#li1').empty();
    	$('#li2').empty();
    	$('#li3').empty();
    	for(var l=0; l<10; l++){
    		if(l == areaNum.trim()){
    			$('#'+ l).css('color','white');
    		  	$('#'+ l).css('background','#6BB6EC');
    		} else{
    			$('#'+l).css('color','black');
    	    	$('#'+l).css('background','white');
    		}
    	}
    		for(var l=31; l<40; l++){
        		if(l == areaNum.trim()){
        			$('#' + l).css('color','white');
        		  	$('#' + l).css('background','#6BB6EC');
        		} else{
        			$('#'+l).css('color','black');
        	    	$('#'+l).css('background','white');
        		}
    	}
    	
  		showResult(site,site4,site5);
  		
  		
    });
    
    function showResult(site,site4,site5){
    	
    	
    	 $.getJSON(site
 	    		,function(result){
 	    	
 	    	for(var i =0; i < 9; i=i+1){
 	    		var img = result.response.body.items.item[i].firstimage;
 				var mapx = result.response.body.items.item[i].mapx;
 				var mapy = result.response.body.items.item[i].mapy;
 				var contentId = result.response.body.items.item[i].contentid;
 				
 				
 				var imgHtml = '<a href="${contextPath}/travelDetail.tr?mapx=' +mapx+'&mapy=' +mapy+'&contentId='+contentId+'"><img  class="im" src="' + img + '" ><a>';
 				
 				
 				$('#li1').append(imgHtml);
 				}
				});
    
    
    	
	    $.getJSON(site4
	    		,function(result){
	    	
	    	for(var i =0; i < 9; i=i+1){
	    		var img = result.response.body.items.item[i].firstimage;
 				var mapx = result.response.body.items.item[i].mapx;
 				var mapy = result.response.body.items.item[i].mapy;
 				var contentId = result.response.body.items.item[i].contentid;
				
				var imgHtml = '<a href="${contextPath}/foodDetail.tr?mapx=' +mapx+'&mapy=' +mapy+'&contentId='+contentId+'"><img  class="im" src="' + img + '" ><a>';
				
				$('#li2').append(imgHtml);
				}
				
	    		});
	    
    
	    $.getJSON(site5
	    		,function(result){
	    	
	    	for(var i =0; i < 9; i=i+1){
				
	    		var img = result.response.body.items.item[i].firstimage;
 				var mapx = result.response.body.items.item[i].mapx;
 				var mapy = result.response.body.items.item[i].mapy;
 				var contentId = result.response.body.items.item[i].contentid;
				var imgHtml = '<a href="${contextPath}/festivalDetail.tr?mapx=' +mapx+'&mapy=' +mapy+'&contentId='+contentId+'"><img  class="im" src="' + img + '" ><a>';
				
				$('#li3').append(imgHtml);
				}
				
				
	    		});
    	
    	}
    
    	$.ajax({
    		url: 'selectAd.me',
    		data: {type:'M'},
    		success: (data) => {
    			const adimgs = document.getElementsByClassName('adimg');

    			for(const i in data){
    				adimgs[i].src = 'resources/uploadFiles/' + data[i];
    			}
    		}
    	});
    	
	}
	    	
		
    

    
    
    
    
    
    
    
    
  		var slides = document.querySelector('.slides'),
  			slide =  document.querySelectorAll('.slides img'),
  			currentIdx = 0,
  			slideCount = 9,
  			prevBtn = document.querySelector('.prev');
  			nextBtn = document.querySelector('.next');
  			
  			
  			function moveSlide(num){
  				slides.style.left = -num * 300 + 'px';
  				currentIdx = num;
  			}
  			nextBtn.addEventListener('click',function(){
  				
  				if(currentIdx < slideCount - 1){
  					moveSlide(currentIdx + 1);
  					
  				}else{
  					moveSlide(0);
  				}
  				
  				
  			});
  			prevBtn.addEventListener('click',function(){
  				
  				if(currentIdx > 0){
  					moveSlide(currentIdx - 1);
  					
  				}else{
  					moveSlide(slideCount - 1);
  				}
  				
  				
  			});
  			
  			var slides1 = document.querySelector('.slides1'),
  			slide1 =  document.querySelectorAll('.slides1 img'),
  			currentIdx1 = 0,
  			slideCount1 = 9,
  			prevBtn1 = document.querySelector('.prev1');
  			nextBtn1 = document.querySelector('.next1');
  			
  			
  			function moveSlide1(num){
  				slides1.style.left = -num * 300 + 'px';
  				currentIdx1 = num;
  			}
  			nextBtn1.addEventListener('click',function(){
  				
  				if(currentIdx1 < slideCount1 - 1){
  					moveSlide1(currentIdx1 + 1);
  					
  				}else{
  					moveSlide1(0);
  				}
  				
  				
  			});
  			prevBtn1.addEventListener('click',function(){
  				
  				if(currentIdx1 > 0){
  					moveSlide1(currentIdx1 - 1);
  					
  				}else{
  					moveSlide1(slideCount1 - 1);
  				}
  				
  				
  			});
  			
  			var slides2 = document.querySelector('.slides2'),
  			slide2 =  document.querySelectorAll('.slides2 img'),
  			
  			currentIdx2 = 0,
  			slideCount2 = 9,
  			prevBtn2 = document.querySelector('.prev2');
  			nextBtn2 = document.querySelector('.next2');
  			console.log(slides2);
  			console.log(slide2);
  			console.log(slideCount2);
  			function moveSlide2(num){
  				slides2.style.left = -num * 300 + 'px';
  				currentIdx2 = num;
  			}
  			nextBtn2.addEventListener('click',function(){
  				
  				if(currentIdx2 < slideCount2 - 1){
  					moveSlide2(currentIdx2 + 1);
  					
  				}else{
  					moveSlide2(0);
  				}
  				
  				
  			});
  			prevBtn2.addEventListener('click',function(){
  				
  				if(currentIdx2 > 0){
  					moveSlide2(currentIdx2 - 1);
  					
  				}else{
  					moveSlide2(slideCount2 - 1);
  				}
  				
  				
  			});
  			
  			function ModalN(id) {
  			    var zIndex = 9999;
  			    var modal = document.getElementById(id);
  			    console.log(id);
  			
  			    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
  			    modal.querySelector('.close_btn').addEventListener('click', function() {
  			        modal.style.display = 'none';
  			    });
  			
  			    modal.setStyle({
  			        position: 'fixed',
  			        display: 'block',
  			        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
  			
  			        // 시꺼먼 레이어 보다 한칸 위에 보이기
  			        zIndex: zIndex + 1,
  					
  			        // div center 정렬
  			        top: '45%',
  			        left: '30%',

  			        transform: 'translate(-50%, -50%)',
  			        msTransform: 'translate(-50%, -50%)',
  			        webkitTransform: 'translate(-50%, -50%)'
  			    });
  			}
  			
  			function ModalN2(id) {
  			    var zIndex = 9999;
  			    var modal = document.getElementById(id);
  			    console.log(id);
  			
  			    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
  			    modal.querySelector('.close_btn').addEventListener('click', function() {
  			        modal.style.display = 'none';
  			    });
  			
  			    modal.setStyle({
  			        position: 'fixed',
  			        display: 'block',
  			        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
  			
  			        // 시꺼먼 레이어 보다 한칸 위에 보이기
  			        zIndex: zIndex + 1,
  					
  			        // div center 정렬
  			        top: '45%',
  			        left: '70%',

  			        transform: 'translate(-50%, -50%)',
  			        msTransform: 'translate(-50%, -50%)',
  			        webkitTransform: 'translate(-50%, -50%)'
  			    });
  			}
  			
  			// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
  			Element.prototype.setStyle = function(styles) {
  			    for (var k in styles) this.style[k] = styles[k];
  			    return this;
  			};
  			
  			
    </script>
  </body>
</html>
    