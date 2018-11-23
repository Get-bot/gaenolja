<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>산책로 선택</title>
<style>
	.map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}

</style>
</head>
<body>
	
	<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <div class="hAddr">
        <span id="centerAddr"></span>
    </div>
</div>


	<div id="clickLatlng"></div>
	<small>현재 설정한 지역 기반의 지도 입니다.<br/>
	정확한 위치를 클릭한 후 , 
	<button type="submit" id="result">확인</button>을 눌러주세요.
	</small>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d54ea73b1e9ac77ebe1409aa939d77e5&libraries=services"></script>
	<script>
		
		
	
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new daum.maps.InfoWindow({
			zIndex : 1
		});

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();
		
		// 키워드로 장소를 검색합니다
		var area = opener.document.getElementById("area").value;
		console.log(area);
		
		ps.keywordSearch(area, placesSearchCB); 

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === daum.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new daum.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		                
		            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}

	
		
		
		//================================================================================
		var imageSrc = "${pageContext.servletContext.contextPath }/image/marker.png", // 마커이미지의 주소입니다    
		imageSize = new daum.maps.Size(50, 55), // 마커이미지의 크기입니다
		imageOption = {
			offset : new daum.maps.Point(18, 40)
		}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
				imageOption), markerPosition = new daum.maps.LatLng(37.54699,
				127.09598); // 마커가 표시될 위치입니다

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition,
			image : markerImage
		// 마커이미지 설정 
		}),infowindow = new daum.maps.InfoWindow({zindex:1});

		//================================================================================
		/* // 지도를 클릭한 위치에 표출할 마커입니다
		 var marker = new daum.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			position : map.getCenter()
		});  */

		//지도에 마커를 표시합니다
		marker.setMap(map);

		//지도에 클릭 이벤트를 등록합니다
		//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;
			// 마커 위치를 클릭한 위치로 옮깁니다
			marker.setPosition(latlng);
			/* var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			message += '경도는 ' + latlng.getLng() + ' 입니다';
			document.getElementById('clickLatlng').innerHTML = message; */
			var area ="";
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === daum.maps.services.Status.OK) {
		            /* var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : ''; */
		            var detailAddr = '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		     		area+=result[0].address.address_name;
		            var content = '<div class="bAddr">' +
		                            '<span class="title">법정동 주소정보</span>' + 
		                            detailAddr + 
		                        '</div>';

		            // 마커를 클릭한 위치에 표시합니다 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);

		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
		        }   
		    });
			
			
			
			// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
			daum.maps.event.addListener(map, 'idle', function() {
			    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			});

			function searchAddrFromCoords(coords, callback) {
			    // 좌표로 행정동 주소 정보를 요청합니다
			    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);   
			    
			}

			function searchDetailAddrFromCoords(coords, callback) {
			    // 좌표로 법정동 상세 주소 정보를 요청합니다
			    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
			    console.log("coords > "+coords);
			}

			// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
			function displayCenterInfo(result, status) {
			    if (status === daum.maps.services.Status.OK) {
			        var infoDiv = document.getElementById('centerAddr');

			        /* for(var i = 0; i < result.length; i++) {
			            // 행정동의 region_type 값은 'H' 이므로
			            if (result[i].region_type === 'H') {
			                infoDiv.innerHTML = result[i].address_name;
			                break;
			            }
			        } */
			    }    
			}
			
			
			
			
			
			
			
			
			
			document.getElementById("result").onclick=function(){
				$.ajax({
					"url":"${pageContext.servletContext.contextPath }/search.do",
					"data":{
						"x":latlng.getLat(),
						"y":latlng.getLng(),
						"area":area
						
					},	
				}).done(function(rst){
						var obj=rst;
						
				});
				
				opener.document.getElementById("address").value=area;
				opener.document.getElementById("x").value=latlng.getLat();
				opener.document.getElementById("y").value=latlng.getLng();
			
				window.close();
			
				
			};
		});
		//=======================================================================
		
		
		
			
			
	</script>
</body>
</html>