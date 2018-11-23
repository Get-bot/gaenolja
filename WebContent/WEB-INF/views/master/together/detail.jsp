<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table">
	<thead class="thead-dark">
		<tr>
			<th scope="col" style="text-align: center;">POST</th>

		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row" style="text-align: left;"><small> 제목 :</small>
				${list.TITLE }<span class="text-gray-dark"><small style="float: right;">조회 > ${list.LOOKUP }</small></span>	</th>
		<tr>
			<small style="float: right;">[${list.AREA}]${list.DAY }</small>
		</tr>
		</tr>
		<tr>
			<th scope="row" style="text-align:left;"><small> 닉네임 :</small>
				${list.NICK }</th>
		</tr>
		<tr>
			<th scope="row" style="text-align:left;"><small> 내용 :</small>
				${list.CONTENT }</th>
		</tr>
	</tbody>
</table>

<div id="map" style="width: 50%; height: 150px; margin-left: 25%;"></div>

<small style="float: right;">주소 > ${list.ADDRESS }</small><br/>

<div style="text-align: right;">
	<c:if test="${list.NICK eq sessionScope.userInfo.NICKNAME || sessionScope.userInfo.NICKNAME eq '관리자'  }">
	<button type="button" class="btn btn-outline-danger" id="endbtn" >
	글 삭제</button>
	<script>
		$("#endbtn").on("click",function(){
			var end=window.confirm("정말 삭제 하시겠습니까??");
			if (end==true) {
			window.location.href="${pageContext.servletContext.contextPath}/together/delete.do?no=${list.NO}";				
			};
		});
	</script>
	
	</c:if> 
	<a href="${pageContext.servletContext.contextPath }/together/mainboard.do">
		<button type="button" class="btn btn-outline-dark">메인으로</button>
	</a>
</div>



<!-- 댓글 -->
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th scope="col" style="text-align: center;">COMMENT</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="c" items="${comment }">
			<tr>
				<th scope="row">${c.NICK }<small>(${c.day }) </small><br /> <span
					class="badge badge-pill badge-warning">${c.MENT }</span><br />
				</th>
			</tr>
		</c:forEach>

	</tbody>
</table>
<label for="newReplyText">댓글작성 </label>
<form action="${pageContext.servletContext.contextPath}/together/detail.do?no=${list.NO}"
	method="post">
	<div class="form-row">
  	  <div class="form-group col-md-11">
	<input type="text" class="form-control" aria-describedby="basic-addon1"
		id="comment" name="comment" autocomplete="off" placeholder="댓글 입력 후 Enter를 눌러주세요."></div>
	<div class="form-group col-md-1">
	<button style="float: right;" type="submit" class="btn btn-warning">댓글 작성</button>
	</div>
	</div>
</form>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d54ea73b1e9ac77ebe1409aa939d77e5&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(${list.LATITUDE},${list.LONGITUDE}), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(${list.LATITUDE},${list.LONGITUDE}); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>

