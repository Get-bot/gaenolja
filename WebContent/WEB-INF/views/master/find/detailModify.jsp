<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<form method="post" enctype="multipart/form-data"
	action="${pageContext.servletContext.contextPath }/find/updateDetail.do" id="formAction">
	<hr class="mb-4">
	<br />
	<div class="row">
		<div class="col-md-6 mb-3">
			<label for="lastName">제목</label> <input type="text"
				class="form-control" id="title" name="title" value="${one.TITLE }">
		</div>

		<div class="col-md-6 mb-3">
			<label for="lastName">강아지 이름</label> <input type="text"
				class="form-control" id="dogname" name="dogname" value="${one.DOGNAME}">
		</div>

		<div class="col-md-6 mb-3">
			<label for="lastName">연락처</label> <input type="text"
				class="form-control" id="phone" name="phone" value="${one.PHONE} ">
		</div>
		<div class="col-md-6 mb-3">
			
				<label for="lastName">사진 첨부</label>
			
			<div class="custom-file ">
				<input type="file" class="custom-file-input"
					aria-describedby="inputGroupFileAddon03" id="picture"
					name="picture" accept="image/*" disabled>
					<label class="custom-file-label" for="inputGroupFile03"> 
					사진이 필요하신가요?</label>
			</div>
		</div>
	</div>
		<br />
		<div style="text-align: center">
			<div class="form-group">
				<div class="row" style="height: 250px;">
					<div class="col-6">
						<img src="${pageContext.servletContext.contextPath}${one.PICTURE}" 
							id="preview" style="height: 240px" onchange="putImage(this)" class="rounded img-fluid" />
					</div>
					<div class="col">
						<textarea class="form-control"
							style="resize: none; height: 240px;" placeholder="특징을 적어주세요"
							id="fcontent" name="fcontent">${one.FCONTENT}</textarea>
					</div>
				</div>
				<div class="row" style="height: 250px;">
					<div class="col">
						<textarea class="form-control" placeholder="자세한 상황, 위치 등을 적어주세요"
							style="resize: none; height: 245px;" id="scontent"
							name="scontent">${one.SCONTENT}</textarea>
					</div>
				</div>
				<div id="map" style="width: 100%; height: 350px;"></div>
				<p style="text-align: center">
					<b><em>지도를 확대해서 위치를 클릭해주세요</em></b>
				</p>
				<div id="clickLatlng"></div>
				
				<input type="hidden" name="mapx" value="${one.MAPX}" id="mapx"/>
				<input type="hidden" name="mapy" value="${one.MAPY }" id="mapy"/>
				<input type="hidden" name="no" value="${param.no}" id="no"/>
				<div>
					<button type="button" class="btn btn-outline-primary"
						onclick="modify();">수정 완료</button>
					<div style="text-align: center">
					<br/>
						<a href="${pageContext.servletContext.contextPath }/find/list.do">
							<button type="button" class="btn btn-outline-secondary btn-sm">목록으로
							</button>
						</a> <a href="${pageContext.servletContext.contextPath }/main/index.do">
							<button type="button" class="btn btn-outline-secondary btn-sm">메인으로
							</button>
						</a>
					</div>
				</div>
			</div>
		</div>
</form>

<script>
	$("#picture").on("change", function() {
		var f = new FileReader();
		f.onload = function(e) {
			$("#preview").attr("src", e.target.result);
		}
		f.readAsDataURL(this.files[0]);
	});

	var modify = function() {
		if (document.getElementById("title").value != ""
				&& document.getElementById("picture").files[0] != ""
				&& document.getElementById("fcontent").value != ""
				&& document.getElementById("scontent").value != "") {
			window.alert("작성 완료되었습니다.");
			$("#formAction").trigger("submit");
		} else {
			window.alert("빠짐없이 작성해주세요.");
			window.location.reload(true);
		}
	}
</script>

<!-- 지도API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5194c970c18885a8e81f75b8cefdd048&libraries=services,clusterer,drawing"></script>
<script>
	var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(37.566842, 126.978629), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 지도를 클릭한 위치에 표출할 마커입니다	
	var marker = new daum.maps.Marker({
		// 지도 중심좌표에 마커를 생성합니다 
		position : map.getCenter()
	});
	// 지도에 마커를 표시합니다
	marker.setMap(map);

	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {

		// 클릭한 위도, 경도 정보를 가져옵니다 
		var latlng = mouseEvent.latLng;

		// 마커 위치를 클릭한 위치로 옮깁니다
		marker.setPosition(latlng);

		
		document.getElementById('mapx').value = latlng.getLat();
		document.getElementById('mapy').value = latlng.getLng();
	});
</script>
