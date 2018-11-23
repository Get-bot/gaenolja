<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<hr class="mb-4">
<h4 class="mb-3" align="center">회원정보수정</h4>
<c:if test="${!empty err }">
	<div class="alert alert-danger alert-dismissible fade show" role="alert">
		<strong>등록 실패!</strong> 입력하지 않은 필수항목이 존재 합니다. 확인 하시고 다시 입력 부탁 드립니다.
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
</c:if>

<form action="${pageContext.servletContext.contextPath}/change_info.do" method="post" enctype="multipart/form-data" style="align-items: center;">
<div class="container">
	<div class="row  justify-content-center">	
		<div class="col-md-8 offset-md-2">
			<div class="alert alert-warning row" role="alert">
			  로그인 정보 입력
			</div>		
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">아이디</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="id" value="${userInfo.ID }" disabled>
				</div>
			</div>
		</div>
		
<!--  ============================================================ -->
		<div class="col-md-8 offset-md-2">
			<div class="alert alert-warning row" role="alert">
			개인 정보 입력
			</div>
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">이름</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="name" value="${userInfo.NAME }" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">닉네임</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="nickname"	placeholder="닉네임" onchange="checkNick(this)" id ="nick" value="${userInfo.NICKNAME }" disabled><span id="checkNick" style="color:white;"></span>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">주소</label>
				<div class="col-sm-6">
					<button type="button" 
						onclick="addressPopUp()" >주소 입력</button>
					<input type="text" class="form-control" name="address" id = "address" value="${userInfo.ADDRESS }" >
					<input type="text" class="form-control" name="address2"  id = "address2" placeholder="상세주소">
				</div>
			</div>			
		</div>
		
		
			<div class="col-md-8 offset-md-2">			
			<div class="alert alert-warning row" role="alert">
			강아지 정보
			</div>
			 <div class="row">
			   <div class="col-4 col-sm-4">
		        <label class="">강아지 사진</label><br>
				<img src="${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE }" class="img-thumbnail" id="preview">
				<input type="file" type = "file" class="btn-outline-info" name="dogProfile" id="dogProfile" value="${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE }">
				
		      </div>
		      <div class="col-8 col-sm-8">
		        	<div class="form-group row">
						<label  class="col-sm-3 col-form-label">강아지 이름</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="dogName" value="${userInfo.DOGNAME }" placeholder="강아지 이름">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">강아지 견종</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="dogType" value="${userInfo.DOGTYPE }" placeholder="강아지견종">
						</div>			
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">강아지 성별</label>
						<div class="col-sm-6">
							<select class="custom-select" required name="dogGender" >
						      <option value="${userInfo.DOGGENDER }">${userInfo.DOGGENDER }</option>
						      <option value="수컷">수컷</option>
						      <option value="암컷">암컷</option>						  
						    </select>
															
						</div>			
					</div>
		      </div>
		      </div>			
			
			</div>
			<div class="col-md-8 offset-md-2" style="margin-top: 10px;">			
				<div class="alert alert-warning row" role="alert">
				하고싶은 말!
				</div>
			<input type="text" placeholder="하고싶은말을 적어주세요!" style="width:600px" name ="usercomment" id="usercomment" value="${userInfo.USERCOMMENT }">			
			</div>
			
			<div class="offset-md-2 justify-content-center">	
				<br>			
				<button type="submit" class="btn btn-primary">수정</button>
				<a href="${pageContext.servletContext.contextPath }/mypage.do"><button type="button" class="btn btn-dark" >취소</button></a>
			</div>
			
			<br>
			<br>
			<br>
			<br>
			<br>
</div>
		
</div>

</form>

<script>
var checkId = function (id) {
	var input =id.value;
			
	console.log("id function");
	var url = "/gaenolja/validate.do";		
	
	var param = {
			"mode"  : "id",
			"input" : input			
	};	
	
	$.get(url, param, function(rst) {	 			
		if(rst==true){
			$("#checkId").html("사용가능한 아이디 입니다.");
			$("#checkId").css("color","blue");
		}else{
			$("#checkId").html("이미 사용중인 아이디 입니다.");
			$("#checkId").css("color","red");
			$("#id").val("");
		}
	
	});
};
var checkNick = function (nick) {
	var input =nick.value;
	
	var url = "/gaenolja/validate.do";		
	
	var param = {
			"mode"  : "nick",
			"input" : input			
	};	
	
	$.get(url, param, function(rst) {	 			
		if(rst==true){
			$("#checkNick").html("사용가능한 닉네임 입니다.");
			$("#checkNick").css("color","blue");
		}else{
			$("#checkNick").html("이미 사용중인 닉네임 입니다.");
			$("#checkNick").css("color","red");
			$("#nickname").val("");
		}
	
	});
};
$("#dogProfile").on("change",function(){
	var f = new FileReader();
	f.onload= function(e){
		$("#preview").attr("src", e.target.result);
	}
	f.readAsDataURL(this.files[0]);
});
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
		            document.getElementById('address').value = data.zonecode; //5자리 새우편번호 사용
		            document.getElementById('address').value = fullAddr;
		
		            // 커서를 상세주소 필드로 이동한다.
		            document.getElementById('address2').focus();
		        }
	   		}).open();
		}
	
</script>