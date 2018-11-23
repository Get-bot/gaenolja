<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${err eq 'off' }">
	<script>window.alert("글이 정상처리 되지 않았습니다.\n필수사항을 다시한번 확인해주세요.")</script>
</c:if>

<form class="needs-validation"
	action="${pageContext.servletContext.contextPath }/together/new.do"
	method="post">
	<input type="hidden" name="latitude" id="x"/>
	<input type="hidden" name="longitude" id="y"/>
	<p style="align-content: center;">
		<small> 현재 페이지는 (같이가요) 글올리기 입니다.<br /> 본 목적은 주변 또는 지역을 설정해 같이
			산책할 친구를 찾는것입니다.<br /> (*) 부분은 필수입니다. 내용을 기재하지않으면 ,등록이 되지 않습니다.<br />
		</small>
	</p>
	<hr />
	<div class="mb-3">
		<label for="text">(*)제 목 <span class="text-muted"></span> <small
			id="size1">(0/15)</small>
		</label> <input type="text" class="form-control" id="title" name="title"
			placeholder="15글자 내외로 작성해주세요" autocomplete="off">
	</div>
	<div class="row">
		<div class="col-md-6 mb-3">
			<label for="exampleFormControlSelect1">(*)산책지역</label> <select
				class="form-control" id="area" name="area">
				<option value="강남구">강남구</option>
				<option value="강동구">강동구</option>
				<option value="강동구">강동구</option>
				<option value="강서구">강서구</option>
				<option value="관악구">관악구</option>
				<option value="광진구">광진구</option>
				<option value="구로구">구로구</option>
				<option value="금천구">금천구</option>
				<option value="노원구">노원구</option>
				<option value="도봉구">도봉구</option>
				<option value="동대문구">동대문구</option>
				<option value="동작구">동작구</option>
				<option value="마포구">마포구</option>
				<option value="서대문구">서대문구</option>
				<option value="서초구">서초구</option>
				<option value="성동구">성동구</option>
				<option value="성북구">성북구</option>
				<option value="송파구">송파구</option>
				<option value="양천구">양천구</option>
				<option value="영등포구">영등포구</option>
				<option value="용산구">용산구</option>
				<option value="은평구">은평구</option>
				<option value="종로구">종로구</option>
				<option value="중구">중구</option>
				<option value="중량구">중량구</option>
				</select>
		</div>
		<div class="col-md-6 mb-3" >
			<label for="text">상세주소 </label>
			<input readonly="readonly" class="form-control" id="address" name="address">
		</div>
		
	</div>
	
	<div class="row">
		<div class="col-md-6 mb-3">
			<label for="date">(*)날짜 </label> <input type="date"
				class="form-control" name="day" id="day">
		</div>
		<div class="col-md-6 mb-3">
			<label for="time">(*)시간 </label> <input type="time"
				class="form-control" name="time" id="time">
		</div>

	</div>


	<div class="mb-3">
		<label for="text">(*)내 용</label><small id="size2">(0/500)</small>
		<textarea class="form-control" id="content" name="content" aria-label="With textarea"
			placeholder="ex)&#13;&#10;견종 : 코카 스파니엘 " style="width: 99%; height: 100px; resize: none;" autocomplete="off"></textarea>
	
	</div>
	<hr />
	<p>(*)상세지역</p>
	<div class="row">

		<div class="col-md-1.5 mb-2">
			<a id="map">
				<button type="button" class="btn btn-outline-light" id="map">
					<img class="btn-img"
						src="${pageContext.servletContext.contextPath }/image/위치.PNG"
						style="opacity: 0.5;"><br /> <span class="label_text">장소</span>
				</button>
			</a>
		</div>
	</div>
	<hr>

	<button class="btn btn-secondary btn-lg btn-block" type="submit" id="b">등록하기</button>

</form>
<script>
		$("#title").on("keyup", function() {
			var len = $("#title").val().length;
			console.log(len);

			var html = "(" + len + "/15)";
			document.getElementById("size1").innerHTML = html;

			if (len >= 15) {
				$("#b").prop("disabled", true);
			} else {
				$("#b").prop("disabled", false);
			}

		});

		$("#content").on("keyup", function() {
			var len = $("#content").val().length;
			console.log(len);

			var html = "(" + len + "/500)";
			document.getElementById("size2").innerHTML = html;

			if (len >= 500) {
				$("#b").prop("disabled", true);
			} else {
				$("#b").prop("disabled", false);
			}

		});
	
		/* $("#b").on("click",function(){
			if ($("#title").val()=="" && $("#area").val()=="" && $("#time").val()=="" && $("#content").val()=="") {
				window.alert("필수항목을 다시 확인해주세요.");
			}	
			
		}); */
		
		$("#map").on("click",function() {
			window.open("${pageContext.servletContext.contextPath }/together/map2.do",
			"map", "width=600,height=450");

			
		}); 
			

</script>




