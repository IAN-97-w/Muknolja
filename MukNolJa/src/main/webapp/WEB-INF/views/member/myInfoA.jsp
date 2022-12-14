<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
    .inbu{height:70px;
          width:20%; 
          background:none;
          border:none;
          border-right: 1px solid RGB(107, 182, 236, 0.3);
          font-weight:600;
          padding-left:0px;
           }
          #bu2{
         border-bottom: 10px solid RGB(107, 182, 236);}
         
         
         #bu1:hover, #bu2:hover, #bu3:hover, #bu4:hover, #bu5:hover{
         border-bottom: 10px solid RGB(107, 182, 236);
         
         }
    </style>
  </head>
  <body style="">
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    
    <jsp:include page="../member/menubar.jsp"/>
   	
     <div class="container-fluid text-center">
	  	<div class="row justify-content-center " style="  ">
            <div class="col-9 " style="">
		<br><br><br>
	  	
	  		
            <br><br>
	            <div class="row justify-content-center " style="  ">
	            	<div class="col" style="padding-left:0px; padding-right:0px; height:100%"  >
	    				<div style="display:flex;float:left; font-size:40px; font-weight:300;">
	    					마이페이지
	    					<div style="font-size:30px; margin-top:15px; margin-left:25px;">${ loginUser.name}님 
	    					<button onclick="location.href='${contextPath}/myInfo1.me'"style="border: 1px solid RGB(107, 182, 236); font-size:20px; margin-top:-10px; border-radius:10px; background:none ">내정보</button></a></div>
	    				</div>
					</div>
				</div>
			</div>
		</div>
			<br>
				<div class="row justify-content-center " style="  ">
	            	<div class="col " style="padding-left:0px; padding-right:0px; height:70px; border:1px solid lightgrey"  >
	            		<div class="row justify-content-center " style="padding-left:0px; padding-right:0px; height:70px; ">
	            			<div class="col-xs-12; col-sm-9" style="padding-left:0px; padding-right:0px; ">
	            				<div style="display:flex; padding-left:0px; padding-right:0px; ">
			            		<button type="button" class="inbu" id="bu1" onclick= "location.href='${contextPath }/myInfo.me'"style="padding-left:0px;border-left: 1px solid RGB(107, 182, 236, 0.3);">내가 쓴글</button>
			            		<button type="button" class="inbu" id="bu2" onclick= "location.href='${contextPath }/myInfoA.me'">찜목록</button>
			            		<button type="button" class="inbu" id="bu3" onclick= "location.href='${contextPath }/myInfoB.me'">문의 내역</button>
			            		<button type="button" class="inbu" id="bu6" onclick= "location.href='${contextPath }/myInfoE.me'">신고 내역</button>
			            		<button type="button" class="inbu" id="bu4" onclick= "location.href='${contextPath }/myInfoC.me'">동행 확인</button>
			            		<button type="button" class="inbu" id="bu5" onclick= "location.href='${contextPath }/myInfoD.me'">예약 확인</button>
			            		</div>
			            	</div>
			      </div>
			      <div class="row justify-content-center " style="padding-left:0px; padding-right:0px; height:70px; margin-top:30px; ">
	            		<div  class="col-9" style=" height:650px; ">
	            			<div id="dd" style="padding-top:10px;">
	            			
	            			
	            				
	            			 
	            		</div>
	            			<nav aria-label="Page navigation example" style="margin-top:20px;" class="col">
								  <ul class="pagination d-flex justify-content-center">
								    <li class="page-item">
								    	<c:url var="goBack" value="${ loc }">
							            	<c:param name="page" value="${ pi.currentPage-1 }"/>
							        	</c:url>
							        	<a class="page-link" href="${ goBack }" aria-label="Previous">
							        		<span aria-hidden="true">&laquo;</span>
							        	</a>
								    </li>
								    
								    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								    	<c:url var="goNum" value="${ loc }">
								    		<c:param name="page" value="${ p }"/>
								    	</c:url>
								    	 <li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
								    </c:forEach>
								    
								    <li class="page-item">
								    	<c:url var="goNext" value="${ loc }">
									    	<c:param name="page" value="${ pi.currentPage+1 }"/>
								    	</c:url>
									    <a class="page-link" href="${ goNext }" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									    </a>
								    </li>
								  </ul>
								</nav>
								</div>
								</div>
	            </div>
		</div>
	</div>
	<script>
	$(document).ready(function(){
		var page = ${ pi.currentPage };
		$.ajax({
			url: "${contextPath}/myInfoAA.me",
			traditional : true,
			data: {
				page: page
			},
			success: (data)=>{
				const list = data.hotel;
				console.log(list);
				var star = '<i style="color:#FDFF00"class="bi bi-star-fill"></i>';
				
				for(var i =0; i<list.length; i++){
					var sta = '';
					var swim = '';
					var fi = '';
					var wifi = '';
					var park = '';
					var to = '';
					var bread = '';
					for(y = 0; y<list[i].star; y++){
						 sta = sta+star;
					}
					if( list[i].swim == "Y" ){
						swim = '<img alt="1" src="${contextPath }/resources/img/swim.png" style="width:50px; height:50px; margin-left:20px;" >'
					}
					if( list[i].park == "Y" ){
						park = '<img alt="1" src="${contextPath }/resources/img/park.png" style="width:50px; height:50px; margin-left:20px;" >'
					}
					if( list[i].wifi == "Y" ){
						wifi = '<img alt="1" src="${contextPath }/resources/img/wifi.png"  style="width:50px; height:50px; margin-left:20px;">'
					}
					if( list[i].fitness == "Y" ){
						fi = '<img alt="1" src="${contextPath }/resources/img/fi.png" style="width:50px; height:50px; margin-left:20px;">'
					}
					if( list[i].amenity == "Y" ){
						to = '<img alt="1" src="${contextPath }/resources/img/to.png" style="width:50px; height:50px;margin-left:20px; ">'
					}
					if( list[i].breakfast == "Y" ){
						bread = '<img alt="1" src="${contextPath }/resources/img/bread.png" style="width:50px; height:50px; ">'
					}
					var dHtml=	'<div class="row Small shadow " style="padding-top:20px;  ">'+
							'<div id="l'+i+'" class="col-xl-4 col-12 cll" style="height:260px;"><img alt="왜"src="${ contextPath}/resources/uploadFiles/'+list[i].thumbnail+'" style="width:100%; height:240px"></div>'+
							'<div class="col-xl-8 col-8" style="float:left; text-align:left; font-size:30px; font-weight:600" >'+list[i].hotelName +'&nbsp;'+sta+'<i  id="c'+i+'"style="float:right; color:#6BB6EC" class="bi bi-heart-fill imo"></i><div style=" font-size:25px; margin-top:20px;font-weight:300">위치 :&nbsp;'+
							list[i].hotelAddress+'</div><div style="margin-top:20px; margin-bottom:20px;">'+bread+to+swim+fi+park+wifi+'</div></div>'
					$('#dd').append(dHtml);
					
				}
				$('.cll').click(function(){
					var idNum = $(this).attr('id').substr(1);
					var st = list[idNum].hotelId
					console.log('번호' + st)
					location.href="${ contextPath }/hotelDetail.ho?hotelId="+ st;
				});
				$('.imo').click(function(){
					var idNum = $(this).attr('id').substr(1);
					var st = list[idNum].hotelId
					
					$.ajax({
						url: "${contextPath}/deleteAA.me",
						traditional : true,
						data: {
							hotelId : st
						},
						success: (data)=>{
						location.href="";
						},
						error: (data)=>{
							console.log(data);
						}
					});
				});
			},
			error: (data)=>{
				console.log(data);
			}
		});
	});		
	
	</script>
  </body>
</html>

    
