<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>

<c:if test="${not empty yourId}">
	<script>
		window.alert("일치하는 정보가 없습니다.");
	</script>
</c:if>

  <div class="text-center" style="margin-right: 20%;  margin-left: 20%; margin-top: 10%;">
    <form class="form-signin" action="${pageContext.servletContext.contextPath }/main/findId.do" method="post">
      <img class="mb-4" src="${pageContext.servletContext.contextPath }/image/findIdImage.jpg" alt="" width="200" height="200">
      <h1 class="h3 mb-3 font-weight-normal">아이디 찾기</h1>
      <label class="sr-only">가입 하실때 사용한 이름을 입력해 주세요</label>
      <input type="text" id="name" name = "name" class="form-control" placeholder="이름" required autofocus autocomplete="off">
      <label class="sr-only">가입 하실때 입력한 강아지 이름을 써주세요</label>
      <input type="text" id="dogName" name = "dogName" class="form-control" placeholder="강아지이름" required>
      
      <button class="btn btn-lg btn-warning btn-block" type="submit">아이디 찾기</button>
      <div style="margin-top : 1rem;">
      <a href="${pageContext.servletContext.contextPath }/main/login.do">로그인하기</a>/<a href="${pageContext.servletContext.contextPath }/main/findPassWord.do">비밀번호 찾기</a>
      </div>
    </form>
  </div>
  