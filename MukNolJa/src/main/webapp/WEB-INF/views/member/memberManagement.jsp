<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">

<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<meta name="theme-color" content="#712cf9">

<title>AdminPage</title>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
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
      .nav-link{
      	color: black;
      }
      tr, th, td{
      	text-align: center;
      }
      a{
      	text-decoration: none;
      	color: black;
      }
      .cate{
      	width: 88px;
      }
      #logout{
      	position: fixed;
      	bottom: 30px;
      	font-size: 12px;
      }
      #businessLicense_modal{
			display: none;
			width: 600px;
			height: 550px;
			padding: 20px 20px;
			background-color: #fefefe;
			border: 1px solid #888;
			border-radius: 3px;
			overflow: auto;
        }
        
      #businessLicense_modal>.modal_close_btn{
        	position: absolute;
			top: 10px;
			right: 10px;
			text-decoration: none;
			color: black;
        }
        
        #businessLicenseImg{
        	width: 100%;
        	height: 100%;
        }
      .mukButton {transition: all 0.3s; background: #6BB6EC; color:white; height:30px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	  .mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
    </style>
   
</head>
<body>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3 sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="adminPage.me">
              <i class="bi bi-house-door"></i>
              <span data-feather="home" class="align-text-bottom"></span>
              ????????? ??????
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="memberManagement.me">
              <i class="bi bi-people"></i>
              <span data-feather="file" class="align-text-bottom"></span>
              ?????? ??????
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="boardManagement.me">
              <i class="bi bi-clipboard-data"></i>
              <span data-feather="shopping-cart" class="align-text-bottom"></span>
              ????????? ??????
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adManagement.me">
              <i class="bi bi-camera-video"></i>
              <span data-feather="users" class="align-text-bottom"></span>
              ?????? ??????
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="QA.me">
              <i class="bi bi-question-circle"></i>
              <span data-feather="users" class="align-text-bottom"></span>
              ?????? ??????
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="notice.me">
              <i class="bi bi-exclamation-octagon"></i>
              <span data-feather="users" class="align-text-bottom"></span>
              ?????? ??????
            </a>
          </li>
        </ul>
        <a href="${ contextPath }/logout.me" id="logout"><i class="bi bi-box-arrow-right"></i> ????????????</a>
      </div>
    </nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">?????? ??????</h1>
      </div>

      <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

      <h2 style="display: inline-block;">?????? ??????</h2>
      <div style="float:right; margin: 10px;">
      	<div class="btn-group btn-group-sm" role="group" aria-label="Basic outlined example">
		  <button type="button" class="btn btn-outline-dark cate" id="nomal">????????????</button>
		  <button type="button" class="btn btn-outline-dark cate" id="hotel">???????????????</button>
		  <button type="button" class="btn btn-outline-dark cate" id="admin">?????????</button>
		  <button type="button" class="btn btn-outline-dark cate" id="stop">????????????</button>
		  <button type="button" class="btn btn-outline-dark cate" id="wait">???????????????</button>
		</div>
      	<form action="memberManagement.me">
      		<div class = "input-group input-group-sm" style="margin-top: 10px;">
      			<input type="hidden" name="category" value="${ category }">
	            <input type = "text" class = "form-control" id="search" name="search" placeholder = "?????????">
		        <div class = "input-group-btn">
		            <button class="btn btn-outline-secondary" type="submit"><i class="bi bi-search"></i></button>
		  		</div>
     	 	</div>
     	 </form>
<!--       <a href="memberManagement.me?category=0"> ???????????? </a>|<a href="memberManagement.me?category=1"> ??????????????? </a>|<a href="memberManagement.me?category=2"> ????????? </a> -->
      </div>
      <div class="table-responsive" style="clear: both;">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">?????????</th>
              <th scope="col">?????????</th>
              <th scope="col">??????</th>
              <th scope="col">????????????</th>
              <th scope="col">?????????</th>
              <th scope="col">??????</th>
              <c:if test="${ category != 3 && category != 4 }">
              	<th scope="col">?????? ?????????</th>
              </c:if>
              <c:if test="${ category == 3 }">
              	<th scope="col">?????????</th>
              </c:if>
            </tr>
          </thead>
          <tbody>
          		<c:forEach items="${ list }" var="m">
	            <tr class="members">
	              <td>${ m.id }</td>
	              <td>${ m.nickName }</td>
	              <td>${ m.name }</td>
	              <td>${ m.phone }</td>
	              <td>${ m.enrollDate }</td>
	              <td>${ m.report }</td>
	              <c:if test="${ category != 3 && category != 4 }">
	             	<td>${ m.lastVisit }</td>
	              </c:if>
	               <c:if test="${ category == 3 }">
	             	<td>${ m.stopDate }</td>
	              </c:if>
	              <c:if test="${ category < 2 }">
		              <td><button class="mukButton">??????</button></td>
		              <td><button class="mukButton">??????</button></td>
	              </c:if>
	              <c:if test="${ category == 3 }">
	              	<td><button class="mukButton">????????????</button></td>
	              </c:if>
	              <c:if test="${ category == 4 }">
	              	<td><button class="mukButton">???????????????</button></td>
	              	<td><button class="mukButton">??????</button></td>
	              </c:if>
	            </tr>
	            </c:forEach>
          </tbody>
        </table>
      </div>
      
       <!-- ????????? -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination d-flex justify-content-center">
			    <li class="page-item">
			    	<c:url var="goBack" value="${ loc }">
			    		<c:param name="page" value="${ pi.currentPage-1 }"/>
			    		<c:param name="category" value="${ category }"/>
			    		<c:if test="${ search != null }">
			    			<c:param name="search" value="${ search }"/>
			    		</c:if>
			    	</c:url>
			      	<a class="page-link" href="${ goBack }" aria-label="Previous">
			        	<span aria-hidden="true"><i class="fa-solid fa-angle-left"></i></span>
			      	</a>
			    </li>
			    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			    	<c:url var="goNum" value="${ loc }">
			    		<c:param name="page" value="${ p }"/>
			    		<c:param name="category" value="${ category }"/>
			    		<c:if test="${ search != null }">
			    			<c:param name="search" value="${ search }"/>
			    		</c:if>
			    	</c:url>
				    <li class="page-item"><a class="page-link num" href="${ goNum }">${ p }</a></li>
			    </c:forEach>
			    <li class="page-item">
			    	<c:url var="goNext" value="${ loc }">
			    		<c:param name="page" value="${ pi.currentPage+1 }"/>
			    		<c:param name="category" value="${ category }"/>
			    		<c:if test="${ search != null }">
			    			<c:param name="search" value="${ search }"/>
			    		</c:if>
			    	</c:url>
				    <a class="page-link" href="${ goNext }" aria-label="Next">
				    	<span aria-hidden="true"><i class="fa-solid fa-angle-right"></i></span>
				    </a>
			    </li>
			  </ul>
			</nav>
    </main>
  </div>
</div>
<div id="businessLicense_modal">
	<a class="modal_close_btn"><i class="bi bi-x-circle"></i></a>
	<img alt="..." src="${ contextPath }/resources/img/noImage.png" id="businessLicenseImg">
</div>

<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
<script type="text/javascript">

            var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // ????????? ??????
                data: { // ????????? ????????? ?????????
                    labels: [
                        //x ???
                    	'${ eList[6].ENROLL_DATE }','${ eList[5].ENROLL_DATE }','${ eList[4].ENROLL_DATE }','${ eList[3].ENROLL_DATE }','${ eList[2].ENROLL_DATE }','${ eList[1].ENROLL_DATE }','${ eList[0].ENROLL_DATE }'
                    ],
                    datasets: [
                        { //?????????
                            label: '????????????', //?????? ??????
                            fill: true, // line ????????? ???, ??? ????????? ???????????? ???????????????
                            data: [
                            	'${ eList[6].MEMBER_COUNT }','${ eList[5].MEMBER_COUNT }','${ eList[4].MEMBER_COUNT }','${ eList[3].MEMBER_COUNT }','${ eList[2].MEMBER_COUNT }','${ eList[1].MEMBER_COUNT }','${ eList[0].MEMBER_COUNT }'
                            ],
                            backgroundColor: [
                                //??????
                                'rgba(107, 182, 236, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //????????? ??????
                                'rgba(107, 182, 236, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //????????? ??????
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
            
            const pageItems = document.getElementsByClassName('num');
            pageItems['${pi.currentPage}'-1].style.backgroundColor = 'lightgray';
            
            function Modal(id) {
                var zIndex = 9999;
                var modal = document.getElementById(id);

                // ?????? ?????? ??????, ????????? ???????????? ?????? div ?????????
                modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                    modal.style.display = 'none';
                });

                modal.setStyle({
                    position: 'fixed',
                    display: 'block',
                    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

                    // ????????? ????????? ?????? ?????? ?????? ?????????
                    zIndex: zIndex + 1,

                    // div center ??????
                    top: '50%',
                    left: '50%',
                    transform: 'translate(-50%, -50%)',
                    msTransform: 'translate(-50%, -50%)',
                    webkitTransform: 'translate(-50%, -50%)'
                });
            }
           	
           	Element.prototype.setStyle = function(styles) {
                for (var k in styles) this.style[k] = styles[k];
                return this;
            };
            
            const members = document.getElementsByClassName('members');
           	for(const m of members){
           		const id = m.querySelector('td').innerText;
           		const buttons = m.querySelectorAll('button');
           		
           		if(buttons.length != 0){
	           		if(${ category < 2 }){
	           			buttons[0].addEventListener('click', function(){
		           			if(confirm('?????? ????????? ?????????????????????????')){
			           			$.ajax({
			           				url: 'waring.me',
			           				data: {id:id},
			           				success: (data) => {
			           					alert('????????? ?????????????????????.');
			           					const reportCount = this.parentNode.parentNode.querySelectorAll('td')[5].innerText;
			           					
			           					if(reportCount > 1){
			           						this.parentNode.parentNode.remove();
			           					} else {
			           						this.parentNode.parentNode.querySelectorAll('td')[5].innerText = reportCount * 1 + 1;
			           					}
			           				}
			           			});
		           			}
		           		});
						buttons[1].addEventListener('click', function(){
							if(confirm('?????? ????????? ?????????????????????????')){
								$.ajax({
			           				url: 'stop.me',
			           				data: {id:id},
			           				success: (data) => {
			           					alert('????????? ?????????????????????.');
			           					this.parentNode.parentNode.remove();
			           				}
			           			});
							}
		           		});
	           		} else if(${ category == 3}){
	           			buttons[0].addEventListener('click', function(){
		           			if(confirm('?????? ???????????? ???????????????????')){
			           			$.ajax({
			           				url: 'soptClear.me',
			           				data: {id:id},
			           				success: (data) => {
			           					alert('???????????? ???????????????.');
			           					this.parentNode.parentNode.remove();
			           				}
			           			});
		           			}
		           		});
	           		} else if(${ category == 4}){
	           			buttons[0].addEventListener('click', function(){
	           				$.ajax({
	           					url: 'selectBusinessLicense.me',
	           					data: {id:id},
	           					success: (data) => {
	           						document.getElementById('businessLicenseImg').src = 'resources/uploadFiles/' + data;
	           						Modal('businessLicense_modal');
	           					}
	           				});
	           			});
	           			
	           			buttons[1].addEventListener('click', function(){
	           				if(confirm('?????? ?????? ???????????????????')){
	           					$.ajax({
	           						url: 'approval.me',
	           						data: {id:id},
	           						success: (data) => {
	           							alert('?????? ??????');
	           							this.parentNode.parentNode.remove();
	           						}
	           					});
	           				}
	           			});
	           		}
	           		
           		}
           	}
           	
           	document.getElementById('nomal').addEventListener('click', function(){
				location.href = 'memberManagement.me?category=0';
           	});
           	
           	document.getElementById('hotel').addEventListener('click', function(){
				location.href = 'memberManagement.me?category=1';
           	});
           	
           	document.getElementById('admin').addEventListener('click', function(){
				location.href = 'memberManagement.me?category=2';
           	});
           	
           	document.getElementById('stop').addEventListener('click', function(){
				location.href = 'memberManagement.me?category=3';
           	});
           	
           	document.getElementById('wait').addEventListener('click', function(){
				location.href = 'memberManagement.me?category=4';
           	});
            
        </script>
</body>
</html>