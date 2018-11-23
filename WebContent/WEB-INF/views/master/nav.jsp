<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="https://fonts.googleapis.com/css?family=Cute+Font&amp;subset=korean" rel="stylesheet">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/sidebar.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/navcss.css">

<style>

 nav.nav {
   font-family: 'Cute Font', cursive;
   font-size: 30px;
   font-weight: 700;
 }
 a.dropdown-item{
 	font-family: 'Cute Font', cursive;
   font-size: 25px;
   font-weight: 700;
 }

#sidebar {
	position: fixed;
	width: 210px;
	height: 130%;
	background: black;
	left: -210px;
	transition : all 500ms linear;
	opacity: 0.3;
}
#sidebar.active {
	left: 0px;

}
#sidebar ul li {
	color: rgba(230, 230, 230, 0.9);
	list-style: none;
	padding: 15px 10px;
	border-bottom: 1px solid rgba(100, 100, 100, 0.3);
}
#sidebar .toggle-btn {
	position: absolute;
	left: 230px;
	top: 20px;
}
#sidebar .toggle-btn span{ 
	display: block;
	width: 30px;
	height: 5px; 
	background: black;	
	margin: 5px 0px ;
}
button{background: transparent; border:none;}

    #menu{ width: 50px; right: 20px ;top: 20pxwdd;}

    #menu>span{display: block; width: 100%; height: 8px; background: #000; margin: 4px 0 ; border-radius: 10px; transition: all 0.5s;}



    #menu>.on:nth-child(1) {transform: translateY(15px) rotate(225deg); transition-delay: 0.2s; }

    #menu>.on:nth-child(2) {opacity: 0; transform: translateX(50px);}

    #menu>.on:nth-child(3) {transform: translateY(-11px) rotate(-225deg); transition-delay: 0.2s; }
</style>



<nav class="nav d-flex justify-content-between py-2 mb-2" style="z-index: 2;">
		  <a style="color:black;" onclick="togglesidebar()">		
			<button style="outline: none;" type="button" name="button" id="menu" class="toggle-btn p-2 font-weight-bold" >
			  <span></span>
				  <span></span>
			  <span></span>
			</button>
		  </a>  
    <div id="sidebar" style="background-color: black; opacity: 0.7; text-align: center; color: white;">
    		<c:choose>
			<c:when test="${not empty userInfo}">
    		<p style="margin: 10px;">MY Info</p>
    		<div style="text-align: center;"> 
    		이름 : ${userInfo.NAME } <br/>
    		 닉네임 : ${userInfo.NICKNAME }<br/>
    		강아지 이름 : ${userInfo.DOGNAME }<br/>
    		 강아지 견종 : ${userInfo.DOGTYPE } <br/>
    		강아지 성별 : ${userInfo.DOGGENDER }<br/>
    		 </div>
    		 <hr align="center" style="border: solid 0.5px gray; width: 80%;"/>
    		 <p >MY Page</p>
    		 	<a href="${pageContext.servletContext.contextPath }/mypage.do" style="color: silver; ">마이 프로필</a><br/>
    		 	<a href="${pageContext.servletContext.contextPath }/myboard.do" style="color: silver;">내 게시글</a><br/>
    		 	<a href="${pageContext.servletContext.contextPath }/mycomment.do" style="color: silver;">내 댓글</a><br/>
    		 	<a href="${pageContext.servletContext.contextPath }/check.do?mode=memberInfo" style="color: silver;">회원정보 수정</a><br/>
    		 	<a href="${pageContext.servletContext.contextPath }/check.do?mode=password" style="color: silver;">비밀번호 변경</a>
    			 <hr align="center" style="border: solid 0.5px gray; width: 80%;"/>
				</c:when>
				<c:otherwise>
					<div class="justify-content-end">
						<p style="text-align: center;">로그인후 이용가능합니다.</p>
					</div>
				</c:otherwise>
			</c:choose>
   
	</div>

          <a class="p-2 font-weight-bold" style="color:black;" href="${pageContext.servletContext.contextPath }/Nboard/list.do">공지사항</a>
          <a class="p-2 font-weight-bold" style="color:black;"	href="${pageContext.servletContext.contextPath }/board/main.do">Gaekipedia</a>
          <a class="p-2  font-weight-bold"  style="color:black;" href="${pageContext.servletContext.contextPath}/dogTraining/training.do?p=1">개동</a>
          <a class="p-2  font-weight-bold"  style="color:black;" href="${pageContext.servletContext.contextPath }/together/mainboard.do?p=1">같이가시개</a>  
          <a class="p-2  font-weight-bold"  style="color:black;" href="${pageContext.servletContext.contextPath }/parcel.do">데려가시개(분양)</a>
          <a class="p-2 font-weight-bold"	style="color:black;"href="${pageContext.servletContext.contextPath }/find/list.do">찾아주시개</a>          
		  
       	 <div class="dropdown p-2">
       	   <a class="p-2 font-weight-bold"  style="color:black;" id="dropdownMenuButton" data-toggle="dropdown" href="#">개아파</a>
	           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			    <a class="dropdown-item font-weight-bold"  href="${pageContext.servletContext.contextPath}/help/list.do">도와주시개</a>
			    <a class="dropdown-item font-weight-bold" href="${pageContext.servletContext.contextPath}/doghospital.do">개병원ㅜ</a>

			    </div>
		  </div>	
		   <a class="p-2 font-weight-bold" style="color:black;" href="${pageContext.servletContext.contextPath }/dogTalk/index.do">개톡</a>	  
		
</nav>
<script>
function togglesidebar(){
	document.getElementById("sidebar").classList.toggle('active');	
}// sidebar 액션
$(function() {

    $('#menu').click(function() {

      $('#menu>span').toggleClass('on')

    })

  })



</script>
