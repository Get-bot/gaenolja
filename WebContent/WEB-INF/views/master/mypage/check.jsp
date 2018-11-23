<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form class="form-signin" action="${pageContext.servletContext.contextPath }/sort.do" method="post" >
	<h1 class="h3 mb-3 font-weight-normal" style="margin-top: 40px;">비밀번호를 입력하세요.</h1>
	
	<c:choose>
		<c:when test="${!empty err }">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<strong>비밀번호 오류!</strong> 입력하신 비밀번호가 다릅니다. 확인 하시고 다시 입력 하시기 바랍니다.
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>
      
	<div class="bd-example">
		<input type="password" id="param" name="param" class="form-control" style="margin-top: 50px;" placeholder="비밀번호" required autofocus>
		<button class="btn btn-primary btn-lg btn-block" type="submit" style="margin-top: 50px;">확인</button>
	</div>
</form>
	<a href="${pageContext.servletContext.contextPath }/mypage.do"><button type="button" class="btn btn-secondary btn-lg btn-block" style="margin-top: 10px;" >취소</button></a>