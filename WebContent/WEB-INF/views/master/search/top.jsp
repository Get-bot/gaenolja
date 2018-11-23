<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Anton" rel="stylesheet">
<style>
      af {
        font-family: "Nanum Gothic", sans-serif;
        font-size: 50px;
      }
      af.f {
        font-weight: 800;
      
      }
</style>
<div id="topad" class = "topad " data-ride="topad" style="background-color: 	#DCDCDC;">
	 <div class="topad-inner">
	  <div class="container form-inline">
	  		<img src="${pageContext.servletContext.contextPath }/image/searchimg.jpg" style="width:200px; height:200px;" class="img" >
              <div class="topad-caption text-left" style="color: black;">
              	<h1>
              		<af class= "f" style="color: blue;">G</af>
              		<af class= "f" style="color: red;">a</af>
              		<af class= "f" style="color: yellow;">e</af>
              		<af class= "f" style="color: blue;">g</af>
              		<af class= "f" style="color: green;">l</af>
              		<af class= "f" style="color: red;">e</af>
              	</h1>		
			<h3>검색 요청어 :  <span style="color: orange;">${search}</span></h3>         
              </div>
              
      </div>
      </div>
</div>