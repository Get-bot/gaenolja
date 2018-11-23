<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900"
	rel="stylesheet">

</head>
<title>	
	개놀자 1:1 채팅방입니다.
</title>
<body style="background-color: #AED6F1;">	
	<div class="alert alert-primary" role="alert">
	   ${recipient} 님과의 개톡
	</div>
	

	<div style="height: 520px; overflow-y: scroll;" id="chatView">		
		<c:forEach var="c" items="${chatlist }">
			<c:choose>
				<c:when test="${c.sender== userInfo.NICKNAME}">
					<small style="float: right;">
					<img src="${pageContext.servletContext.contextPath }${c.senderProfile}" style="width: 20px; height: 20px;" class="rounded-circle" id="image">
					${c.sender }</small>
					<br />
					<span class="badge badge-warning" style="float: right;">
						${c.text } </span>
					<br/>
				</c:when>
				<c:otherwise>
					<small>
					<img src="${pageContext.servletContext.contextPath }${c.senderProfile}" style="width: 20px; height: 20px;" class="rounded-circle" id="image">
					${c.sender }</small>
					<br />
					<span class="badge badge-light">
						${c.text } </span>
					<br />
				</c:otherwise>
			</c:choose>
		</c:forEach>	
	</div>
	<div id="chatView">
	

		<div class="input-group input-group-lg float-bottom">
			<div class="input-group-prepend">
				<span class="input-group-text" >글 입력</span>
			</div>
			<input type="text" class="form-control" id="input"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-lg">
		</div>
	</div>

	<script>
		var onechat = new WebSocket("ws://" + location.host
				+ "${pageContext.servletContext.contextPath}/onechat.do");

		onechat.onopen = function() {
			var param = {"mode":"register", "roomNumber":"${roomNumber}","recipient":"${recipient}","sender" : "${userInfo.NICKNAME}"}
			onechat.send(JSON.stringify(param));
		}
		
		
		
		document.getElementById("input").onchange = function() {
			console.log(this.value);
			console.log("${userInfo.NICKNAME}");
			console.log("${recipient}");			
			var msg = {
				"mode" :"chat",
				"roomNumber" : "${roomNumber}",
				"sender" : "${userInfo.NICKNAME}",
				"recipient" : "${recipient}",
				"senderProfile" : "${userInfo.DOGPROFILE}",
				"text" : this.value
			};
			onechat.send(JSON.stringify(msg));
			this.value = "";
		};

		onechat.onmessage = function(evt) {
			console.log("결과" + evt.data);
			var obj = JSON.parse(evt.data);
			console.log(obj);
			//picture
			switch(obj.mode){
				case "chat" : if (obj.sender == "${userInfo.NICKNAME}") {
								warningHandle(obj);
							} else {
								lightHandle(obj);
							}
							break;
			}
			
		};

		var lightHandle = function(obj) {
				
			var html = "<small style=\"float: left;\">";
			html += "<img src=\"${pageContext.servletContext.contextPath }"+obj.senderProfile+"\""+"style=\"width: 20px; height: 20px;\"class=\"rounded-circle\">";
			html += obj.sender+ "</small><br/>";
			html += "<span class=\"badge badge-light\" >";
			html += obj.text;
			html += "</span></br>";
			document.getElementById("chatView").innerHTML += html;
			document.getElementById("chatView").scrollTop = document
					.getElementById("chatView").scrollHeight;
			

		};

		var warningHandle = function(obj) {			
			var html = "<small style=\"float: right;\">";
			html += "<img src=\"${pageContext.servletContext.contextPath }"+obj.senderProfile+"\""+"style=\"width: 20px; height: 20px;\"class=\"rounded-circle\">";
			html += obj.sender+ "</small><br/>";
			html += "<span class=\"badge badge-warning\"  style=\"float: right;\">";
			html += obj.text;
			html += "</span></br>";
			document.getElementById("chatView").innerHTML += html;
			document.getElementById("chatView").scrollTop = document
					.getElementById("chatView").scrollHeight;

		};
	</script>
</body>
</html>

