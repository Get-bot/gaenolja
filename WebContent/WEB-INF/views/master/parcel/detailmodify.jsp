<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<hr class="mb-4">
<h4 class="mb-3" align="center">분양 글 수정</h4>

<form action="${pageContext.servletContext.contextPath }/updatedetail.do" method="post" >
	<input type="hidden" name="lat" value="${one.LAT }" id="lat"/>
	<input type="hidden" name="longi" value="${one.LONGI }" id="longi"/>
	<input type="hidden" name="no" value="${one.NO }" id="no"/>
	<div class="row">
		<div class="col-md-6 mb-3">
			<label for="lastName">제목</label>
			<input type="text" class="form-control" id="title" name="title" value="${one.TITLE }">
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">메인이미지</label>
			<input type="file" class="form-control" id="mainimage" name="mainimage" disabled>
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">분양정보</label>
			<div>
				<c:choose>
					<c:when test="${one.CHOICE == 1 }">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="choice" value="1" checked="checked"><label class="form-check-label" for="inlineCheckbox1">분양중</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="choice" value="0"><label class="form-check-label" for="inlineCheckbox2">분양완료</label>
						</div>
					</c:when>
					<c:otherwise>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="choice" value="1"><label class="form-check-label" for="inlineCheckbox1">분양중</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="choice" value="0" checked="checked"><label class="form-check-label" for="inlineCheckbox2">분양완료</label>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">분양자 ID</label>
			<input type="text" class="form-control" id="writer" name="writer" value="${userInfo.ID }" disabled>
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">분양자 핸드폰 번호</label>
			<input type="text" class="form-control" id="phone" name="phone" value="${one.PHONE }">
		</div>
		<div class="col-md-6 mb-3">

			<label for="lastName">분양장소(상세주소입력)</label>			
			<!-- ======================================================= -->
			<button type="button" onclick="addressPopUp()" >간편 주소 입력</button>
					<input type="text" class="form-control" id="area" placeholder="간편 주소" readonly="readonly" onchange="address(this);" name="area" value="${one.AREA }">					
			<!-- ======================================================= -->

		</div>
	</div>
	<hr class="mb-4">
		<div id="map" style="width:100%;height:350px;"></div>
	<hr class="mb-4">
	<h4 class="mb-3" align="center">강아지 정보</h4>
	<div class="row">
		<div class="col-md-6 mb-3">
			<label for="firstName">견종</label>
			<input type="text" class="form-control" id="breeds" name="breeds" value="${one.BREEDS }">
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">성별</label>
			<input type="text" class="form-control" id="gender" name="gender" value="${one.GENDER }">
		</div>	
		<div class="col-md-6 mb-3">
			<label for="lastName">분류<small style="color: green;">(소형견, 중형견, 대형견..)</small></label></label>
			<input type="text" class="form-control" id="sort" name="sort" value="${one.SORT }">
		</div>	
		<div class="col-md-6 mb-3">
			<label for="lastName">나이</label>
			<input type="text" class="form-control" id="age" name="age" value="${one.AGE }">
		</div>	
		<div class="col-md-6 mb-3">
			<label for="lastName">성격</label>
			<input type="text" class="form-control" id="character" name="character" value="${one.CHARACTER }">
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">접종</label>
			<input type="text" class="form-control" id="inoculation" name="inoculation" value="${one.INOCULATION }">
		</div>
		
		<div class="col-md-12">
			<div class="input-group-prepend">
				<span class="input-group-text">상세내용</span>
			</div>
			<textarea class="form-control" aria-label="With textarea" id="content" name="content" >${one.CONTENT }</textarea>
		</div>
		
	</div>
	<hr class="mb-4">

 	<div class="form-group">
		<label>파일 업로드</label>
			<input name="file1" type="file" class="form-control" disabled>
			<input name="file2" type="file" class="form-control" disabled>
	</div>
	<div class="row">
		<div class="col-md-6 mb-3">
			<button type="submit" class="form-control btn btn-outline-primary">Save</button>
		</div>
		<div class="col-md-6 mb-3">
			<a href="${pageContext.servletContext.contextPath }/parcel.do"><button type="button" class="form-control btn btn-outline-primary" >Cencel</button></a>
		</div>
	</div>

</form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8732ddf8bab883cf85aa0180da9e413d&libraries=services,clusterer,drawing"></script>
<script>
/* 	var address = function() {
		// 주소 작성 값 추출
		var area = document.getElementById("area").value;
		console.log(area);
	} */

	var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);


	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	var address = function(target) {
		// 주소 작성 값 추출
		var area = $("#area").val();
	
	// 주소로 좌표를 검색합니다
		geocoder.addressSearch(area, function(result, status) {
	
		// 정상적으로 검색이 완료됐으면 
			if (status === daum.maps.services.Status.OK) {
		
				var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				console.log(coords);
				var lat = new daum.maps.LatLng(result[0].y);
				console.log(lat);
				var longi = new daum.maps.LatLng(result[0].x);
				console.log(longi);
				console.log(lat + " , " + longi);
				
				
				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new daum.maps.Marker({
					map : map,
					position : coords
				});
		
				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new daum.maps.InfoWindow(
						{
							content : '<div style="width:150px;text-align:center;padding:6px 0;">분양장소</div>'
						});
				infowindow.open(map, marker);
		
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
				
				var data = {"lat" : result[0].y,"longi" : result[0].x}
				console.log(data);
				$("#lat").val(result[0].y);
				$("#longi").val(result[0].x);
			}
		});
	}
	
	var addressPopUp = function(){
		
		new daum.Postcode({
	        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var fullAddr = ''; // 최종 주소 변수
		            var extraAddr = ''; // 조합형 주소 변수
		
		            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                fullAddr = data.roadAddress;
		
		            } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                fullAddr = data.jibunAddress;
		            }
		
		            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		            if(data.userSelectedType === 'R'){
		                //법정동명이 있을 경우 추가한다.
		                if(data.bname !== ''){
		                    extraAddr += data.bname;
		                }
		                // 건물명이 있을 경우 추가한다.
		                if(data.buildingName !== ''){
		                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		            }
		
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.		            
		            document.getElementById('area').value = fullAddr;
		            
		            //
		            address();
		
		            // 커서를 상세주소 필드로 이동한다.
		            document.getElementById('area').focus();
		        }
	   		}).open();
		}
	
</script>