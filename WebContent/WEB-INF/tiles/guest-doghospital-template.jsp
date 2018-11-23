<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/css/mypage.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8732ddf8bab883cf85aa0180da9e413d&libraries=services,clusterer,drawing"></script>
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
<title>개놀자!</title>
</head>
<body>
	<div class="container">
		<div >
			<tiles:insertAttribute name="head"/>
		</div>
		
		<div >
			<tiles:insertAttribute name="menu"/>
		</div>
				<tiles:insertAttribute name="center"/>
			</div>
		</div>
	</div>
</body>
</html>