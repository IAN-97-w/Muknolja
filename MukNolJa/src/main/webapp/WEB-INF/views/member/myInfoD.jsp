<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	            		<div class="col-9" style="box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.1); height:600px;">
	            		
	            			
	            		</div>
	            			<nav aria-label="Page navigation example" style="background: white" class="col-9">
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
	<script>
	$(document).ready(function(){
		var page = 1;
		$.ajax({
			url: "${contextPath}/myInfoDD.me",
			data: {
				page: page
			},
			success: (data)=>{
				const list = data.list;
				console.log(list);
				
				
				
			},
			error: (data)=>{
				console.log(data);
			}
		});
	});
	</script>
  </body>
 
</html>

    
