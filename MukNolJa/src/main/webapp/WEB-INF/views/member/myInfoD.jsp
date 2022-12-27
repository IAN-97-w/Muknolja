<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
    .inbu{height:70px;
          width:25%; 
          background:none;
          border:none;
          border-right: 1px solid RGB(107, 182, 236, 0.3);
          font-weight:600;
          padding-left:0px;
           }
         #bu5{
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
			            		<button class="inbu" type="button" id="bu1" onclick= "location.href='${contextPath }/myInfo.me'"style="padding-left:0px;border-left: 1px solid RGB(107, 182, 236, 0.3);">내가 쓴글</button>
			            		<button class="inbu" type="button" id="bu2" onclick= "location.href='${contextPath }/myInfoA.me'">찜목록</button>
			            		<button class="inbu" type="button" id="bu3" onclick= "location.href='${contextPath }/myInfoB.me'">문의 내역</button>
			            		<button class="inbu" type="button" id="bu4" onclick= "location.href='${contextPath }/myInfoC.me'">동행 확인</button>
			            		<button class="inbu" type="button" id="bu5" onclick= "location.href='${contextPath }/myInfoD.me'">예약 확인</button>
			            		</div>
			            	</div>
			      </div>
			      <div class="row justify-content-center " style="padding-left:0px; padding-right:0px; height:70px; margin-top:30px; ">
	            		<div  class="col-9" style=" height:650px; ">
	            			<div id="dd" style="padding-top:10px;">
	            			
	            			
	            				<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h1 class="modal-title fs-5 title" id="exampleModalLabel" ></h1>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body body" style="border-bottom:1px solid #DEE2E6">
								        예약을 취소하시겠습니까?
								      </div>
								       
								      <div class="modal-footer foot">
								        <button type="button" class="btn btn-secondary" id="de">예약취소</button>
								        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>
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
			url: "${contextPath}/myInfoDD.me",
			traditional : true,
			data: {
				page: page
			},
			success: (data)=>{
				const list = data.list;
				console.log(list);
				console.log(data.pi);
				for(var i =0; i<list.length; i++){
					dHtml=	'<div class="row Small shadow " style="padding-top:20px;  ">'+
							'<div id="l'+i+'" class="col-xl-4 col-12 cll" style="height:260px;"><img alt="왜"src="${ contextPath}/resources/uploadFiles/'+list[i].fileModifyName+'" style="width:100%; height:240px"></div>'+
							'<div class="col-xl-6 col-8" style="float:left; text-align:left; font-size:30px; font-weight:600" >'+list[i].hotelName+'('+list[i].roomName+')<div style=" font-size:25px; margin-top:20px;font-weight:300">예약자 :&nbsp;'+
							list[i].reservationName+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    예약자 번호 :&nbsp; '+list[i].reservationPhone+'<br>체크인 :&nbsp;'+list[i].checkinDate+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;체크아웃 : '+list[i].checkoutDate+
							'<br>결제금액 : '+list[i].paymentAmount+'원 &nbsp;&nbsp;&nbsp;&nbsp; 결제수단: '+list[i].paymentMethod+'</div></div>' +
							'<div class="col-xl-2 col-4"><button  id="'+i+'" style="width:100%; height:90%;border:1px solid #6BB6EC; border-radius:10px; background:none; " data-bs-toggle="modal" data-bs-target="#exampleModal">예약취소</button></div></div>';
					$('#dd').append(dHtml);
					
				}
				$(".cll").click(function(){
					var idNum = $(this).attr('id').substr(1);
					var st = list[idNum].hotelId
					console.log('번호' + st)
					location.href="${ contextPath }/hotelDetail.ho?hotelId="+ st;
				});
					$("#de").click(function(){
						var idNum = $(this).attr('id');
						var st = list[idNum].reservationId
						$.ajax({
							url: "${contextPath}/deleteDD.me",
							data: {
								id : st
							},
							success: (data)=>{
								location.href = "${ contextPath }/myInfoD.me"
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

    
