<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">



<style>
 div.topad{
   font-family: 'Jua', cursive;
   font-size: 40px;
   font-weight: 700;
 }
 h1{
   font-family: 'Jua', cursive;
   font-size: 50px;
   font-weight: 700;
   margin-top: 0.2rem;
 }

 </style>

<div id="topad" class = "topad " data-ride="topad" style="background-color: rgb(251,227,0);">
	 <div class="topad-inner">
	  <div class="container form-inline">
	  		<img src="${pageContext.servletContext.contextPath }/image/talkimg.png" style="width:200px; height:200px;" class="img" >
              <div class="topad-caption text-left" style="color: black;">
              	<h1 id="title" >개톡</h1>		
				<p>Gae Talk</p>         
              </div>
      </div>
      </div>
</div>