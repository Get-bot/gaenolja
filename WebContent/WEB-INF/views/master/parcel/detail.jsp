<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div style="width: 900px; margin: auto;">
<!------------------------------------------------------- 분양 강아지 정보 보이는 뷰 시작 이미지 / 정보만 보임 -->
<div style="float: left; margin-right: 20px;">
		<img alt="이미지 안나오면 엑박" src="${pageContext.servletContext.contextPath }${one.MAINIMAGE }" style="width: 400px; height: 400px;">
</div>
<div style="float: right; width: 480px;">
	<table class="table">
		<thead>
			<tr>
				<th colspan="2" style="text-align: center; font-size: 20px;">${one.TITLE }</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th style="text-align: center;">견종</th>
				<td style="text-align: center;">${one.BREEDS }</td>
			</tr>
			<tr>
				<th style="text-align: center;">성별</th>
				<td style="text-align: center;">${one.GENDER }</td>
			</tr>
			<tr>
				<th style="text-align: center;">나이</th>
				<td style="text-align: center;">${one.AGE }</td>
			</tr>
			<tr>
				<th style="text-align: center;">분류</th>
				<td style="text-align: center;">${one.SORT }</td>
			</tr>
			<tr>
				<th style="text-align: center;">성격</th>
				<td style="text-align: center;">${one.CHARACTER }</td>
			</tr>
			<tr>
				<th style="text-align: center;">접종</th>
				<td style="text-align: center;">${one.INOCULATION }</td>
			</tr>
			<tr>
				<th style="text-align: center;">분양주소</th>
				<td style="text-align: center;"><small>${one.AREA }</small></td>
			</tr>
			<tr>
				<th style="text-align: center;"><button type="button" class="btn btn-light" type="button" data-toggle="collapse" data-target="#collapseOne">지도	접기</button></th>
				<td style="text-align: center;"><a href="http://map.daum.net/link/to/분양지,${one.LAT },${one.LONGI }"><button type="button" class="btn btn-light">길찾기</button></a></td>
			</tr>
		</tbody>
	</table>
</div>
<div id="collapseOne" class="collapse show">
	<div id="map" style="width:100%; height:350px;"></div>
</div>
<!------------------------------------------------------- 분양 강아지 정보 보이는 뷰 끝 -->

<hr class="mb-4">

<!------------------------------------------------------- 글 상세 내용 및 첨부 파일 뷰 시작 -->
<div style="float: none; margin-right: 20px;">
	<h3>상세내용</h3>
		<p style="margin-top: 20px;">${one.CONTENT }</p>
	<hr/>
	<h3>추가 이미지</h3>
		<img alt="추가 이미지" src="${pageContext.servletContext.contextPath }${one.FILE1 }" style="margin-top: 20px;">
	<hr/>
	<h3>동영상</h3>
		<video src="${pageContext.servletContext.contextPath }${one.FILE2 }" style="margin-top: 20px;" />
	<hr/>
</div>
<!------------------------------------------------------- 글 상세 내용 및 첨부 파일 뷰 끝 -->

<hr style="margin-top: 3px; margin-bottom: 3px;" />

<!------------------------------------------------------- 게시판 댓글 내용 전체 출력 뷰 시작 -->

<label style="margin: 20px;"># 하단부터 입력된 댓글 내용을 확인 하실수 있습니다.</label>
<ul class="list-unstyled"> 
	<c:forEach var="c" items="${comlist }" varStatus="vs">
		<li class="media border-top-0" id="view-listcomment_${vs.count }" data-toggle="collapse" data-target="#collapseExample_${vs.count }" aria-expanded="false" aria-controls="collapseExample" >
			<img class="rounded-circle" src="${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE}" alt="image" style="width: 50px; height: 50px; margin-right: 20px;">
			<div class="media-body">
				<h5 class="mt-0 mb-1" style="font-size: 15px;">${c.NICK}<small>(${c.TALKER })</small></h5>
				<div style="font-size: 13px;">${c.COMMENTS }</div>
			</div>
		</li>
		<hr style="margin: 10px;"/>
	</c:forEach>
	<div id="view_comment"></div>
</ul>
	
<!------------------------------------------------------- 게시판 댓글 내용 전체 출력 뷰 끝 -->

<!------------------------------------------------------- 댓글 입력할수 있는 폼 뷰 시작 -->
<label style="color: blue;">${userInfo.NICKNAME }(${userInfo.ID })</label>
<div class="input-group mb-3" id="input-comment">
<img class="rounded-circle" src="${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE}" alt="image" style="width: 50px; height: 50px; margin-right: 20px;">
	<input type="text" class="form-control" id="new_comment" aria-describedby="button-addon2" style="height: 50px;">
	<div class="input-group-append">
		<button class="btn btn-outline-secondary" type="button" id="btn_comment">New Comment</button>
	</div>
</div>
<!------------------------------------------------------- 댓글 입력할수 있는 폼 뷰 끝 -->

<div class="bd-example">
	<c:choose>
		<c:when test="${userInfo.ID == one.WRITER }">
			<a href="${pageContext.servletContext.contextPath }/detailmodify.do?no=${one.NO }"><button type="button" class="btn btn-primary btn-lg btn-block" >수정</button></a>
			<a href="${pageContext.servletContext.contextPath }/parcel.do"><button type="button" class="btn btn-secondary btn-lg btn-block" style="margin-top: 10px;">취소</button></a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.servletContext.contextPath }/parcel.do"><button type="button" class="btn btn-secondary btn-lg btn-block">Back</button></a>
		</c:otherwise>
	</c:choose>
</div>
</div>

<!-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8732ddf8bab883cf85aa0180da9e413d&libraries=services,clusterer,drawing"></script>
<script>
	var lat = ${one.LAT}
	var lng = ${one.LONGI}

	var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	
	// 지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 마커가 표시될 위치입니다
	var markerPosition  = new daum.maps.LatLng( lat, lng );

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
//=============================================================================================================
	
// 댓글 저장
	$("#new_comment").on("change", function() {
		var comment = $("#new_comment").val();
		console.log(comment);
		var html = "<li class=\"media border-top-0\" id=\"view-listcomment_${vs.count }\" data-toggle=\"collapse\" data-target=\"#collapseExample_${vs.count }\" aria-expanded=\"false\" aria-controls=\"collapseExample\ onclick=\"getReComment(this, '${c.SERIAL }')\">";
			html += "<img class=\"rounded-circle\" src=\"${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE}\" alt=\"프로필 이미지\" style=\"width: 50px; height: 50px; margin-right: 20px;\">";
			html += "<div class=\"media-body\">";
			html += "<h5 class=\"mt-0 mb-1\" style=\"font-size: 15px;\">${userInfo.NICKNAME }(${userInfo.ID })</h5>";
			html += "<div style=\"font-size: 13px;\">" + comment + "</div>";
			html += "</div></li>";
			html += "<div class=\"media\" id=\"view_recomment\"></div>";
			html += "<li class=\"collapse\" id=\"collapseExample_${vs.count }\">";
			html += "<div class=\"input-group mb-3\">";
			html += "<span class=\"input-group-text\" id=\"basic-addon1\">${userInfo.NICKNAME }(${userInfo.ID })</span>";
			html += "<input type=\"text\" class=\"form-control\" aria-describedby=\"basic-addon1\">";
			html += "</div></li>";
			html += "<hr style=\"margin: 10px;\"/>";

		$("#view_comment").append(html);
		document.getElementById("new_comment").value = "";
		
		var param = {"ino":"${one.NO}","talker":"${userInfo.ID}","comments":comment,"nick":"${userInfo.NICKNAME}"};
		console.log(param);
		$.post("${pageContext.servletContext.contextPath }/addcomment.do", param, function(rst) {

		});
	});

</script>
