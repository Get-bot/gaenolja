<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<h2>강아지 수다공간</h2>

<c:choose>
	<c:when test="${not empty userInfo}">
		<div class="input-group">
	  		<div class="input-group-prepend">
	    	 <img src="${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE}" style="width: 80px; height: 80px;"class="rounded-circle">
	  		</div>
	 		 <textarea class="form-control" aria-label="With textarea" placeholder="댕댕이가 하고싶은말을 써주세요!" id="content"></textarea>
	  <button type="submit" class="btn btn-secondary btn-med " onclick="addComment();">멍멍!</button>
	</div>
	</c:when>
	<c:otherwise>
			<div class="input-group">
	 		 <div class="input-group-prepend">
	    		 <img src="${pageContext.servletContext.contextPath }/image/mainBannerImage.jpg" style="width: 80px; height: 80px;"class="rounded-circle">
	  		</div>
	 			 <textarea class="form-control" aria-label="With textarea" placeholder="로그인이 필요한 서비스 입니다." id="content" readonly></textarea>
	  			<button type="submit" class="btn btn-secondary btn-med " onclick="addComment();" disabled>멍멍!</button>
	</div>
	</c:otherwise>
</c:choose>	
	
	<hr/>
	<div id="list" style="margin-bottom: 10%;" >
	
		<c:forEach var="list" items="${dogTalkList}">	
				<div class="card" id="form">
					<div class="card-header d-flex bd-highlight" style="background-color: #FFDEAD; margin-top: 5px; "><div class="flex-grow-1">${list.TALKER}'s comment</div>

					 <div class="bd-highlight"><small id="date" class="d-flex justify-content-end">${list.WRITEDATE}</small></div></div>
					<div class="card-body" style="background-color: #AED6F1;">
						<blockquote class="blockquote mb-0" >
							<div class="row align-items-center" >
								<img
									src="${pageContext.servletContext.contextPath }${list.PICTURE}"
									style="width: 80px; height: 80px;" class="rounded-circle"
									id="image">
	
								<p >&nbsp;&nbsp;<span style="background-color: white;">${list.CONTENT}</span></p>
							</div>
							<footer class="blockquote-footer d-flex justify-content-end "><cite title="Source Title">
								<span id="address">${list.ADDRESS}...</span> </cite>
								
							</footer>
	
						</blockquote>
					</div>
				</div>		
		</c:forEach>
		
	</div>
	
		<button type="button" class="btn btn-secondary btn-lg" id="addbtn" >더 보 기</button>

	
	
<script>
	
	var addComment = function(){
		console.log("addComment Function");
		var url = "/gaenolja/dogTalk/add.do";
		console.log(document.getElementById("content").value);
		console.log("${userInfo.DOGPROFILE}");		
		var param = {
				"talker"  : "${userInfo.DOGNAME}",
				"content" : document.getElementById("content").value,
				"picture" : "${userInfo.DOGPROFILE}",
				"address" : "${userInfo.ADDRESS}"
		};	
		
		$.get(url, param, function(rst) {					 
			window.alert("글이 등록되었습니다.")
			document.getElementById("content").innerHTML = "";
			
			
			console.log(rst.length);
			console.log("rst.length = "+rst.length);
			var html = "";
			for (var i = 0; i <rst.length; i++) {
				var talker = rst[i].TALKER;
				var content = rst[i].CONTENT;
				var picture = "${pageContext.servletContext.contextPath}" + rst[i].PICTURE;
				var address = rst[i].ADDRESS;
				var date = rst[i].WRITEDATE;
								
					html +=  "<div class=\"card\" id=\"form\">";
					html += "<div class=\"card-header d-flex bd-highlight\"  style=\"background-color: #FFDEAD; margin-top: 5px;\" ><div class=\"flex-grow-1\">"+talker+"'s comment</div>";
					html += "<div class=\"bd-highlight\"><small id=\"date\" class=\"d-flex justify-content-end\">";
					html += date+"</small></div></div>";	
					html += " <div class=\"card-body\" style=\"background-color: #AED6F1;\">";
					html += "<blockquote class=\"blockquote mb-0\">";
					html += "<div class=\"row align-items-center\">";
					html += "<img src=\""+picture+"\" style=\"width: 80px; height: 80px;\"class=\"rounded-circle\" id =\"image\">";
					html += " <p >&nbsp;&nbsp;<span style=\"background-color: white;\">"+content+"</span></p></div>";
					html += "<footer class=\"blockquote-footer d-flex justify-content-end \"><span id=\"address\">";
					html += "<cite title=\"Source Title\">"+address+"..</span></cite></footer>";
					html += "</blockquote>";
					html += "</div>";
					html += "</div>";			
					
					
			}
		
			document.getElementById("list").innerHTML = html;
			document.getElementById("content").value ="";
		});			
	};
	
	
	
	</script>