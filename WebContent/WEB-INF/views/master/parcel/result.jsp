<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="jumbotron" style="text-align: center;">
  <img class="img" alt="Thank You" src="${pageContext.servletContext.contextPath }/image/result.jpg" width="100px" height="100px">
  <h1 class="display-4" >작성 완료!</h1>
  <p class="lead"></p>
  <hr class="my-4">
  <p>작성하신 게시글 저장이 완료 되었습니다.</p>
  <a class="btn btn-primary btn-lg" href="${pageContext.servletContext.contextPath }/parcel.do" role="button">목록으로</a>
  <a class="btn btn-primary btn-lg" href="${pageContext.servletContext.contextPath }/main/index.do" role="button">메인으로</a>
</div>