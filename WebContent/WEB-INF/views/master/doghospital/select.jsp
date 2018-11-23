<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="accordion" id="accordionExample" style="width: 900px; margin: auto;">
	<div class="card">
		<div class="card-header" >
			<h5 class="mb-0">
				<strong><label style="font-size: 18px;">지역구를 선택 하시면 해당 지역구의 동물병원이 나옵니다. 원하시는 지역구를 선택 하세요.</label></strong>
      		</h5>
		</div>
		<div>
			<div class="card-body">
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/doghospital.do" >ALL</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=강남구" >강남구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=강북구" >강북구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=강서구" >강서구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=관악구" >관악구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=광진구" >광진구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=구로구" >구로구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=금천구" >금천구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=노원구" >노원구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=도봉구" >도봉구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=동대문구" >동대문구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=동작구" >동작구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=마포구" >마포구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=서대문구" >서대문구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=서초구" >서초구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px; margin-top: 5px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=성동구" >성동구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px; margin-top: 5px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=성북구" >성북구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px; margin-top: 5px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=송파구" >송파구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px; margin-top: 5px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=양천구" >양천구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px; margin-top: 5px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=영등포구" >영등포구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px; margin-top: 5px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=용산구" >용산구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px; margin-top: 5px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=은평구" >은평구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px; margin-top: 5px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=종로구" >종로구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px; margin-top: 5px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=중구" >중구</a>
				<a type="button" class="btn btn-primary btn-sm btn-light" style="font-size: 12px; margin-top: 5px;" href="${pageContext.servletContext.contextPath }/getdh.do?gu=중랑구" >중랑구</a>
			</div>
		</div>
	</div>
<hr />
</div>

<div id="map" style="width: 900px; height: 400px; margin: auto;"></div>

<div style="width: 900px; margin: auto;">
<hr />
	<table class="table table-hover">
			<thead>
				<tr>
					<th style="text-align: center; width: 8% "><small>지역</small></th>
					<th style="text-align: center; width: 10%"><small>구분</small></th>
					<th style="text-align: center; width: 20%"><small>병원이름</small></th>
					<th style="text-align: center; width: 40%"><small>주소</small></th>
					<th style="text-align: center; width: 10%"><small >전화번호</small></th>
					<th style="text-align: center; width: 8%"><small>우편번호</small></th>
				</tr>
			</thead>
		<tbody>
		<c:forEach var="dh" items="${dhlist }">
			<tr>
				<td style="text-align: center;" data="${dh.GU }"><small>${dh.GU }</small></td>
				<td style="text-align: center;"><small>${dh.SORT }</small></td>
				<td style="text-align: center;"><small>${dh.HOSPITALNAME }</small></td>
				<td style="text-align: center;"><small>${dh.ADDRESS }</small></td>
				<td style="text-align: center;"><small>${dh.PHONE }</small></td>
				<td style="text-align: center;"><small>${dh.POSTALCODE }</small></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8732ddf8bab883cf85aa0180da9e413d&libraries=services,clusterer,drawing"></script>
<script>	
	
	var gu = $("td").attr("data");
	
	var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new daum.maps.LatLng(37.54863463182444, 126.99070931296113), // 지도의 중심좌표 
        level : 9 // 지도의 확대 레벨 
    });
    
    // 마커 클러스터러를 생성합니다 
    var clusterer = new daum.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 5 // 클러스터 할 최소 지도 레벨 
    });
 
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    $.ajax({ "url" : "${pageContext.servletContext.contextPath }/gucoordinates.do?gu="+gu," async" : true }).done(function(data) {
    	console.log(data);

		function setCenter() {            
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new daum.maps.LatLng(data.positions[0].LAT, data.positions[0].LNG);
		    
		    // 지도 중심을 이동 시킵니다
		    map.setCenter(moveLatLon);
		}

		function panTo() {
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new daum.maps.LatLng(data.positions[0].LAT, data.positions[0].LNG);
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);            
		}        
		
    	// 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    	var markers = $(data.positions).map(function(i, position) {
    		return new daum.maps.Marker({
    			"position" : new daum.maps.LatLng(position.LAT, position.LNG)
    		});
    	});
    	// 클러스터러에 마커들을 추가합니다
    	clusterer.addMarkers(markers);
    });
    
</script>
