<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
 <div class="text-center" style="margin-right: 20%;  margin-left: 20%; margin-top: 10%;">
    
      <img class="mb-4" src="${pageContext.servletContext.contextPath }/image/dal.jpg" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">비밀번호 찾기</h1>
     	 
      <label for="inputEmail" class="sr-only">아이디를 입력해 주세요</label>
      <input type="text" id="id" name = "id" class="form-control" placeholder="아이디" required autofocus autocomplete="off" onchange ="getProfile(this);" >        
      <button class="btn btn-lg btn-success btn-block" type="button" id="button" >인증하기</button>
      <div id = "stepbanner" style="margin-top: 2rem"></div>
      <div class="d-flex justify-content-center">
      <div class="text-center" id="identify" style="width: 300px; height: 300px; margin-top: 2rem;">
      </div>
      </div>
      <span id="result" class="d-flex justify-content-center"></span>
     <div style="margin-top : 1rem; margin-bottom : 10rem;">
      <a href="${pageContext.servletContext.contextPath }/main/findId.do">아이디 찾기</a>/ <a href="${pageContext.servletContext.contextPath }/main/findPassWord.do">비밀번호 찾기</a>
      </div>
    
  </div>
  
  <script>
  
  var id = "";
  var getProfile = function(a){
	  id = a.value;
	  var url = "/gaenolja/main/getUserProfile.do";
	 
	  var param = {
					"id" : id					
				  };	
			
			$.get(url, param, function(rst) {					 
				
				console.log(rst);
								
				var html = "";
				var stepbanner = "<div class=\"alert alert-success\" role=\"alert\" id = \"alertbanner\">  회원가입 하실때 사용한 이미지를 클릭해주세요 .</div>";
				for (var i = 0; i <rst.length; i++) {				
					var picture = "${pageContext.servletContext.contextPath}" + rst[i].profile;
					console.log(picture);
					html += "<a href=\"#\"><img src=\""+picture+"\" style=\"width: 100px; height: 100px;\" name ="+rst[i].value+" onclick=\"checkValue(this);\"></a>";			
				}			
				document.getElementById("stepbanner").innerHTML = stepbanner;
				document.getElementById("identify").innerHTML = html;
				
		});			
		
  }
  var checkValue = function(a){		
	 if(a.name=="true"){		
		 
		;
		 var url = "/gaenolja/main/getUserPassword.do";		 
		  var param = {
						"id" : id					
					  };	
				
				$.get(url, param, function(rst) {
					document.getElementById("stepbanner").innerHTML ="";
					 document.getElementById("id").value ="";					
					 document.getElementById("button").disabled = true;
								
					 
					 var toLogin = "${pageContext.servletContext.contextPath}/main/login.do";
					 var html = "<div class=\"alert alert-primary\" role=\"alert\" id = \"alertbanner\">  회원님의 비밀번호는"+ rst+" 입니다 .</div>";		
					 html +=  "<a href =\""+toLogin+"\"><button class=\"btn btn-lg btn-primary btn-block\" type=\"button\">로그인창으로</button>";
					 
					 document.getElementById("identify").innerHTML = html;
				})
				
	 }else{
		 document.getElementById("stepbanner").innerHTML ="";
		 document.getElementById("id").value ="";
		 document.getElementById("button").disabled = true;	
		 
		 var toIdentify = "${pageContext.servletContext.contextPath}/main/findPassWord.do";
		 var html = "<div class=\"alert alert-danger\" role=\"alert\" id = \"alertbanner\">  인증에 실패하였습니다.</div>";		
		 html +=  "<a href =\""+toIdentify+"\"><button class=\"btn btn-lg btn-warning btn-block\" type=\"button\">다시 인증하기</button>";
		 
		 document.getElementById("identify").innerHTML = html;
	 }
  }
  </script>