<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content=""> 

    <title>테스트 템플릿</title>

    <!-- Bootstrap core CSS -->    
    
    <link href="http://getbootstrap.com/docs/4.1/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="http://getbootstrap.com/docs/4.1/assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="http://getbootstrap.com/docs/4.1/assets/js/vendor/popper.min.js"></script>  
    <script src="http://getbootstrap.com/docs/4.1/dist/js/bootstrap.min.js"></script>    
    <script src="http://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"></script>
	
    <!-- Custom styles for this template -->
    <link href="${pageContext.servletContext.contextPath }/css/test/carousel.css" rel="stylesheet">    
   <!-- JQuery -->
   <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
   
  </head>
<body>	
	<header class="row">
      	<tiles:insertAttribute name="nav"/>
    </header>
    <div>
    	<tiles:insertAttribute name="top"/>
    </div>
	<div class="container marketing">
	 	<tiles:insertAttribute name="main"/>
	</div>  
  <div class="row align-self-end"> 
  	<tiles:insertAttribute name="bottom"/>
  </div>
 </body>
</html>