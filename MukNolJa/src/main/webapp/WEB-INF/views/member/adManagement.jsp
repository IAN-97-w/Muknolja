<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta name="theme-color" content="#712cf9">

<title>AdminPage</title>

    <style>
    	#addAd_modal, #addModify_modal{
			display: none;
			width: 600px;
			height: 550px;
			padding: 20px 20px;
			background-color: #fefefe;
			border: 1px solid #888;
			border-radius: 3px;
			overflow: auto;
        }
        
        #addDetail_modal{
        	display: none;
			width: 800px;
			height: 400px;
			padding: 20px 20px;
			background-color: #fefefe;
			border: 1px solid #888;
			border-radius: 3px;
        }
        
        #adImg{
        	width: 100%;
			height: 100%;
        }
        
        #addAd_modal::-webkit-scrollbar, #addModify_modal::-webkit-scrollbar{
			width: 8px;
		}
            
        #addDetail_modal>.modal_close_btn{
        	position: absolute;
			top: 10px;
			right: 10px;
			text-decoration: none;
			color: black;
        }    
        
        #noImage{
        	border-radius: 10px;
        }
    
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
      	width: 60px;
      }
      input{
      	text-align: center;	
      }
      #addAdTitle{
      	margin-bottom: 20px;
		border-bottom: 1px solid lightgray;
	  }
	  #logout{
      	position: fixed;
      	bottom: 30px;
      	font-size: 12px;
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
		  <button type="button" class="btn btn-outline-dark cate" id="main">??????</button>
		  <button type="button" class="btn btn-outline-dark cate" id="travel">?????????</button>
		  <button type="button" class="btn btn-outline-dark cate" id="food">??????</button>
		  <button type="button" class="btn btn-outline-dark cate" id="festival">??????</button>
		  <button type="button" class="btn btn-outline-dark cate" id="party">??????</button>
		  <button type="button" class="btn btn-outline-dark cate" id="review">??????</button>
		  <button type="button" class="btn btn-outline-dark cate" id="hotel">??????</button>
		</div>
<!--       <a href="boardManagement.me?category=0"> ??????????????? </a>|<a href="boardManagement.me?category=1"> ??????????????? </a>|<a href="boardManagement.me?category=2"> ???????????? </a> -->
      </div>
      <div class="table-responsive" style="clear: both;">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">?????????</th>
              <th scope="col">?????????</th>
              <th scope="col">?????????</th>
              <th scope="col">?????????</th>
            </tr>
          </thead>
          <tbody>
          	<c:forEach items="${ aList }" var="a">
	            <tr>
	              <td>${ a.boardType }</td>
	              <td>${ a.price }</td>
	              <td>${ a.start }</td>
	              <td>${ a.deadline }</td>
	              <td width="80"><button type="button" class="mukButton adDetail">??????</button></td>
	              <td width="80"><button type="button" class="mukButton adModify">??????</button></td>
	              <input type="hidden" value="${ a.fileId }">
	            </tr>
            </c:forEach>
            <c:forEach begin="1" end="${ 3 - fn:length(aList) }">
            	<tr>
            		<td colspan="6">
            			<button type="button" class="mukButton addAd">?????? ??????</button>
            		</td>
            	</tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </main>
  </div>
</div>

	<div id="addAd_modal">
		<div id="addAdTitle" class="row text-center">
			<h3>?????? ??????</h3>
		</div>
		<form action="${ contextPath }/addAd.me" method="post" enctype="multipart/form-data">
			<div class="row text-center" style="margin-bottom: 20px;">
				<div class="col">
					<label>?????????</label><br>
					<input class="datepicker1" type="date" name="start" required>
				</div>
				<div class="col">
					<label>?????????</label><br>
					<input class="datepicker2" type="date" name="deadline" required>
				</div>
			</div>
			<div class="row text-center" style="margin-bottom: 20px;">
				<div class="col">
					<label>?????????</label>
					<input class="form-control form-control-sm" type="number" min="0" name="price" required>
				</div>
				<div class="col">
					<label>?????????</label>
					<input class="form-control form-control-sm" type="text" value="${ type }" name="boardType" readonly>
				</div>
			</div>
			<div class="row text-center" style="margin-bottom: 20px;">
				<div class="col">
					<img src="${ contextPath }/resources/img/noImage.png" class="img-fluid" alt="..." id="noImage">
					<input id="myFile" type="file" accept="image/*" style="display:none;" name="adImg">
				</div>
			</div>
			<div class="row text-center">
				<div class="col">
					<button type="submit" class="btn btn-outline-primary" id="add" onclick="imgCheck();">??????</button>
					<button type="button" class="btn btn-outline-danger modal_close_btn">??????</button>
				</div>
			</div>
		</form>
     </div>
     
     <div id="addModify_modal">
		<div id="addAdTitle" class="row text-center">
			<h3>?????? ??????</h3>
		</div>
		<form action="${ contextPath }/modifyAd.me" method="post" enctype="multipart/form-data">
			<div class="row text-center" style="margin-bottom: 20px;">
				<div class="col">
					<label>?????????</label><br>
					<input class="datepicker1" type="date" name="start" id="startM" required>
				</div>
				<div class="col">
					<label>?????????</label><br>
					<input class="datepicker2" type="date" name="deadline" id="deadlineM" required>
				</div>
			</div>
			<div class="row text-center" style="margin-bottom: 20px;">
				<div class="col">
					<label>?????????</label>
					<input class="form-control form-control-sm" type="number" min="0" name="price" id="priceM" required>
				</div>
				<div class="col">
					<label>?????????</label>
					<input class="form-control form-control-sm" type="text" value="${ type }" name="boardType" id="boardTypeM" readonly>
				</div>
			</div>
			<div class="row text-center" style="margin-bottom: 20px;">
				<div class="col">
					<img src="${ contextPath }/resources/img/noImage.png" class="img-fluid" alt="..." id="noImageM">
					<input id="myFileM" type="file" accept="image/*" style="display:none;" name="adImg">
					<input type="hidden" name="beforeFileId" id="beforeFileId">
					<input type="hidden" name="beforeFileName" id="beforeFileName">
				</div>
			</div>
			<div class="row text-center">
				<div class="col">
					<button type="submit" class="btn btn-outline-primary" id="addM" onclick="imgCheckM();">??????</button>
					<button type="button" class="btn btn-outline-danger modal_close_btn">??????</button>
				</div>
			</div>
		</form>
     </div>
     
     <div id="addDetail_modal">
    	<a class="modal_close_btn"><i class="bi bi-x-circle"></i></a>
     	<img alt="..." src="${ contextPath }/resources/img/noImage.png" id="adImg">
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
                    	'${ incomeCount[6].START_DATE }','${ incomeCount[5].START_DATE }','${ incomeCount[4].START_DATE }','${ incomeCount[3].START_DATE }','${ incomeCount[2].START_DATE }','${ incomeCount[1].START_DATE }','${ incomeCount[0].START_DATE }'
                    ],
                    datasets: [
                        { //?????????
                            label: '?????? ??????', //?????? ??????
                            fill: true, // line ????????? ???, ??? ????????? ???????????? ???????????????
                            data: [
                            	'${ incomeCount[6].COUNT }','${ incomeCount[5].COUNT }','${ incomeCount[4].COUNT }','${ incomeCount[3].COUNT }','${ incomeCount[2].COUNT }','${ incomeCount[1].COUNT }','${ incomeCount[0].COUNT }'
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
            
            document.getElementById('main').addEventListener('click', function(){
				location.href = 'adManagement.me?category=0';
           	});
            
            document.getElementById('travel').addEventListener('click', function(){
				location.href = 'adManagement.me?category=1';
           	});
            
            document.getElementById('food').addEventListener('click', function(){
				location.href = 'adManagement.me?category=2';
           	});
            
            document.getElementById('festival').addEventListener('click', function(){
				location.href = 'adManagement.me?category=3';
           	});
           	
           	document.getElementById('party').addEventListener('click', function(){
				location.href = 'adManagement.me?category=4';
           	});
           	
           	document.getElementById('review').addEventListener('click', function(){
				location.href = 'adManagement.me?category=5';
           	});
           	document.getElementById('hotel').addEventListener('click', function(){
				location.href = 'adManagement.me?category=6';
           	});
           	
           	const addAdBtns = document.getElementsByClassName('addAd');
           	
           	for(const addAdBtn of addAdBtns){
           		addAdBtn.addEventListener('click', function(){
               		Modal('addAd_modal');
               	});	
           	}
           	
           	function Modal(id) {
                var zIndex = 9999;
                var modal = document.getElementById(id);

                // ?????? ?????? ??????, ????????? ???????????? ?????? div ?????????
                modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                	const noImage = document.querySelector('#noImage');
                	noImage.src = "${ contextPath }/resources/img/noImage.png";
                	
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
            
            <!-- ???????????? -->
    	    $("#noImage").click(function(){
    	    	$('#myFile').click();
    	    });

    	    const myFile = document.querySelector('#myFile');
    	    const noImage = document.querySelector('#noImage');
    	    
    		    myFile.addEventListener('change', ()=>{
    		    	const reader = new FileReader();
    		    	reader.onload = function(e){
    					console.log(e);		    		
    					noImage.src = e.target.result;
    		    	};
    		    	reader.readAsDataURL(myFile.files[0]);
    		    });
    		
    		<!-- ??????????????? ?????? -->
    		const addDetailBtns = document.getElementsByClassName('adDetail');
    		for(const addDetail of addDetailBtns){
    			addDetail.addEventListener('click', function(){
    				const id = this.parentNode.parentNode.querySelector('input[type="hidden"]').value;
    				$.ajax({
    					url: 'selectAttm.me',
    					data: {id:id},
    					success: (data) => {
    						const adImg = document.getElementById('adImg');
    						console.log(data);
    						Modal('addDetail_modal');
    						adImg.src = 'resources/uploadFiles/' + data.fileModifyName;
    					}
    				});
    			});
    		}
    		
    		function imgCheck() {
    			if(document.getElementById('myFile').value == ''){
    				alert('???????????? ???????????????.');
    				event.preventDefault();
    			}
    		}
    		
    		const addModifyBtns = document.getElementsByClassName('adModify');
    		for(const addModify of addModifyBtns){
    			addModify.addEventListener('click', function(){
    				const id = this.parentNode.parentNode.querySelector('input[type="hidden"]').value;
    				const tds = this.parentNode.parentNode.querySelectorAll('td');
    				Modal('addModify_modal');

    				document.getElementById('startM').value = tds[2].innerText;
    				document.getElementById('deadlineM').value = tds[3].innerText;
    				document.getElementById('priceM').value = tds[1].innerText;
    				document.getElementById('boardTypeM').value = tds[0].innerText;
    				
    				$.ajax({
    					url: 'selectAttm.me',
    					data: {id:id},
    					success: (data) => {
    						document.getElementById('myFileM').value = '';
    						
    						document.getElementById('noImageM').src = 'resources/uploadFiles/' + data.fileModifyName;
    						document.getElementById('myFileM').src = 'resources/uploadFiles/' + data.fileModifyName;
    						document.getElementById('beforeFileId').value = data.fileId;
    						document.getElementById('beforeFileName').value = data.fileName;
    						
    						$("#noImageM").click(function(){
    			    	    	$('#myFileM').click();
    			    	    });
    						
    						const myFileM = document.querySelector('#myFileM');
    			    	    const noImageM = document.querySelector('#noImageM');
    			    	    
    			    		    myFileM.addEventListener('change', ()=>{
    			    		    	const reader = new FileReader();
    			    		    	reader.onload = function(e){
    			    					console.log(e);		    		
    			    					noImageM.src = e.target.result;
    			    		    	};
    			    		    	reader.readAsDataURL(myFileM.files[0]);
    			    		    });
    					}
    				});
    			});
    		}
        </script>
        
        <script>
		   $(function() {
		       //input??? datepicker??? ??????
		       $(".datepicker1").datepicker({
		           dateFormat: 'yy-mm-dd' //?????? ?????? ??????
		           ,showOtherMonths: true //??? ????????? ???????????? ???????????? ????????? ??????
		           ,showMonthAfterYear:true // ???- ??? ??????????????? ?????? - ??? ??????
		           ,changeYear: true //option??? ??? ?????? ??????
		           ,changeMonth: true //option???  ??? ?????? ??????                
		           ,showOn: "both" //button:????????? ????????????,????????? ???????????? ?????? ?????? ^ both:????????? ????????????,????????? ???????????? input??? ???????????? ?????? ??????  
		           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //?????? ????????? ??????
		           ,buttonImageOnly: true //?????? ???????????? ???????????? ????????????
		           ,buttonText: "??????" //?????? ?????? ?????????              
		           ,yearSuffix: "???" //????????? ?????? ?????? ??? ?????????
		           ,monthNamesShort: ['1???','2???','3???','4???','5???','6???','7???','8???','9???','10???','11???','12???'] //????????? ??? ?????? ?????????
		           ,monthNames: ['1???','2???','3???','4???','5???','6???','7???','8???','9???','10???','11???','12???'] //????????? ??? ?????? Tooltip
		           ,dayNamesMin: ['???','???','???','???','???','???','???'] //????????? ?????? ?????????
		           ,dayNames: ['?????????','?????????','?????????','?????????','?????????','?????????','?????????'] //????????? ?????? Tooltip
		           ,minDate: "0D" //?????? ????????????(-1D:?????????, -1M:?????????, -1Y:?????????)
		           ,maxDate: "0D" //?????? ????????????(+1D:?????????, -1M:?????????, -1Y:?????????)  
		       });                    
		       
		       //???????????? ?????? ????????? ??????????????? ?????????.
		       $('.datepicker1').datepicker('setDate', 'today'); //(-1D:?????????, -1M:?????????, -1Y:?????????), (+1D:?????????, -1M:?????????, -1Y:?????????)            
		   });
		   
		   $(function() {
		       //input??? datepicker??? ??????
		       $(".datepicker2").datepicker({
		           dateFormat: 'yy-mm-dd' //?????? ?????? ??????
		           ,showOtherMonths: true //??? ????????? ???????????? ???????????? ????????? ??????
		           ,showMonthAfterYear:true // ???- ??? ??????????????? ?????? - ??? ??????
		           ,changeYear: true //option??? ??? ?????? ??????
		           ,changeMonth: true //option???  ??? ?????? ??????                
		           ,showOn: "both" //button:????????? ????????????,????????? ???????????? ?????? ?????? ^ both:????????? ????????????,????????? ???????????? input??? ???????????? ?????? ??????  
		           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //?????? ????????? ??????
		           ,buttonImageOnly: true //?????? ???????????? ???????????? ????????????
		           ,buttonText: "??????" //?????? ?????? ?????????              
		           ,yearSuffix: "???" //????????? ?????? ?????? ??? ?????????
		           ,monthNamesShort: ['1???','2???','3???','4???','5???','6???','7???','8???','9???','10???','11???','12???'] //????????? ??? ?????? ?????????
		           ,monthNames: ['1???','2???','3???','4???','5???','6???','7???','8???','9???','10???','11???','12???'] //????????? ??? ?????? Tooltip
		           ,dayNamesMin: ['???','???','???','???','???','???','???'] //????????? ?????? ?????????
		           ,dayNames: ['?????????','?????????','?????????','?????????','?????????','?????????','?????????'] //????????? ?????? Tooltip
		           ,minDate: "0D" //?????? ????????????(-1D:?????????, -1M:?????????, -1Y:?????????)
		           ,maxDate: "+5y" //?????? ????????????(+1D:?????????, -1M:?????????, -1Y:?????????)  
		       });                    
		       
		       //???????????? ?????? ????????? ??????????????? ?????????.
		       $('.datepicker2').datepicker('setDate', 'today'); //(-1D:?????????, -1M:?????????, -1Y:?????????), (+1D:?????????, -1M:?????????, -1Y:?????????)            
		   });
		</script>
</body>
</html>