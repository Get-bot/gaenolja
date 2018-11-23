<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container" style="margin-bottom: 10%;">
<form
	action="${pageContext.servletContext.contextPath }/together/selectboard.do"
	method="post">
	<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          지역을 선택해주세요
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
					<a onclick="area(강남구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=강남구" class="badge badge-light" style="opacity: 0.5;">강남구</a> 
					<a onclick="area(강동구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=강동구" class="badge badge-light" style="opacity: 0.5;">강동구</a>
					<a onclick="area(강북구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=강북구"	class="badge badge-light" style="opacity: 0.5;">강북구</a>
					<a onclick="area(강서구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=강서구" class="badge badge-light" style="opacity: 0.5;">강서구</a>
					<a onclick="area(관악구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=관악구"	class="badge badge-light" style="opacity: 0.5;">관악구</a>
					<a onclick="area(광진구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=광진구" class="badge badge-light" style="opacity: 0.5;">광진구</a>
					<a onclick="area(구로구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=구로구" class="badge badge-light" style="opacity: 0.5;">구로구</a>
					<a onclick="area(금천구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=금천구" class="badge badge-light" style="opacity: 0.5;">금천구</a>
					<a onclick="area(노원구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=노원구" class="badge badge-light" style="opacity: 0.5;">노원구</a>
					<a onclick="area(도봉구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=도봉구" class="badge badge-light" style="opacity: 0.5;">도봉구</a>
					<a onclick="area(동대문구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=동대문구" class="badge badge-light" style="opacity: 0.5;">동대문구</a>
					<a onclick="area(동작구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=동작구" class="badge badge-light" style="opacity: 0.5;">동작구</a>
					<a onclick="area(마포구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=마포구" class="badge badge-light" style="opacity: 0.5;">마포구</a>
					<a onclick="area(서대문구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=서대문구" class="badge badge-light" style="opacity: 0.5;">서대문구</a>
					<a onclick="area(서초구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=서초구" class="badge badge-light" style="opacity: 0.5;">서초구</a>
					<a onclick="area(성동구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=성동구" class="badge badge-light" style="opacity: 0.5;">성동구</a>
					<a onclick="area(성북구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=성북구" class="badge badge-light" style="opacity: 0.5;">성북구</a>
					<a onclick="area(송파구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=송파구" class="badge badge-light" style="opacity: 0.5;">송파구</a>
					<a onclick="area(양천구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=양천구" class="badge badge-light" style="opacity: 0.5;">양천구</a>
					<a onclick="area(영등포구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=영등포구" class="badge badge-light" style="opacity: 0.5;">영등포구</a>
					<a onclick="area(용산구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=용산구" class="badge badge-light" style="opacity: 0.5;">용산구</a>
					<a onclick="area(은평구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=은평구" class="badge badge-light" style="opacity: 0.5;">은평구</a>
					<a onclick="area(종로구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=종로구" class="badge badge-light" style="opacity: 0.5;">종로구</a>
					<a onclick="area(중구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=중구" class="badge badge-light" style="opacity: 0.5;">중구</a>
					<a onclick="area(중량구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=중량구" class="badge badge-light" style="opacity: 0.5;">중량구</a>
				</div>
			</div>
		</div>
	</div>
	<hr />
	<div id="map" style="width: 100%; height: 300px;"></div>
	<table class="table table-hover">
  		<thead>
	     <tr>
    	  <th scope="col" style="width: 3%"><small>NO</small></th>
     	  <th scope="col" style="width: 10%"><small>지역</small></th>
    	  <th scope="col" style="width: 35%"><small>제목</small></th>
      	  <th scope="col" style="width: 20%"><small>작성자</small></th>
     	  <th scope="col" style="width: 10%"><small>날짜</small></th>     	  
     	  <th scope="col" style="width: 9%"><small>조회수</small></th>
	     </tr>
  		</thead>
  		<tbody>
     	<c:forEach var="l" items="${list }">
    	 		<tr>
     			<th scope="row">${l.NO }</th>
     			<td><small>${l.AREA }</small></td>
     			<td>
				<a href="${pageContext.servletContext.contextPath  }/together/detail.do?no=${l.NO }">     			
     			${l.TITLE }</a>
     			</td>
     			<td>${l.NICK }</td>
     			<td>${l.day }</td>     			
     			<td>${l.LOOKUP }</td>
     			</tr>
     	</c:forEach>
    	
  </tbody>
</table>
<!-- ======================================== -->
	<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">				
				<c:forEach var="p" begin="1" end="${size }">
						<c:choose>
							<c:when test="${p==current}">
								<li class="page-item active">
     							 <a class="page-link" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=${area }&p=${p}">${p }<span class="sr-only">(current)</span>
     							 </a></li>	
     						 </c:when>
     						 <c:otherwise>
     						 	<a class="page-link" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=${area }&p=${p}">${p }</a>
     						</c:otherwise>
     					</c:choose>					
					</c:forEach>			
			</ul>
		</nav>	
		
	
	<a href="${pageContext.servletContext.contextPath }/together/new.do" class="d-flex justify-content-end">
		<button type="button" class="btn btn-outline-success">글 쓰기</button>
	</a>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d54ea73b1e9ac77ebe1409aa939d77e5&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new daum.maps.LatLng(37.531464664279646,
					126.96147681424955), // 지도의 중심좌표
			level : 9
		// 지도의 확대 레벨
		};
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
			<c:forEach var="i" items="${list}" varStatus="vs">
			{
				"content": "<div>${i.TITLE}</div>",
				"latlng" : new daum.maps.LatLng(${i.LATITUDE}, ${i.LONGITUDE})
			}
			<c:if test="${!vs.last}">,</c:if>
			</c:forEach>
		];

		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng
			// 마커의 위치
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new daum.maps.InfoWindow({
				content : positions[i].content
			// 인포윈도우에 표시할 내용
			});

			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			daum.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			daum.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
	</script>
</form>
</div>

