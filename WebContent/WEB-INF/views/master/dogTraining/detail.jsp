<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <small style="float: right;">${read.UPDAY}</small>
<table class="table">
	<thead class="thead-dark">
	    <tr>
	      <th scope="col" style="text-align: center;">POST</th>
	    </tr>
	</thead>
	<tbody>
		
		<tr>
			<th scope="row" style="width: 50%"><small>제목 : </small>${read.TITLE} <small style="float: right;">조회수 : ${read.LOOKUP}</small></th>
		</tr>
		<tr>
			<th scope="row" style="width: 4%"><small>ID : </small>${read.DTID}</th>
		</tr>
		<tr>
			<th scope="row" style="width: 12%"><small>내용  :  </small>${read.CONTENT}</th>
		</tr>
		<tr>
			<th scope="row" style="width: 12%;text-align: center;"> <video src="${read.UPLOAD}" controls="controls" style="width: 550px; height: 400px;"></video></th>
		</tr>
	</tbody>
</table>
<div style="text-align: right;">
	<c:if test="${read.DTID eq sessionScope.userInfo.ID || sessionScope.userInfo.NICKNAME eq '관리자'  }">
	<button type="button" class="btn btn-outline-danger" id="endbtn" >
	글 삭제</button><!-- </a> -->
	<script>
		$("#endbtn").on("click",function(){
			var end=window.confirm("정말 삭제 하시겠습니까??");
			if (end==true) {
			window.location.href="${pageContext.servletContext.contextPath}/dogTraining/delete.do?no=${read.NO}";				
			};
		});
	</script>
	</c:if> 
	<a href="${pageContext.servletContext.contextPath }/dogTraining/training.do">
		<button type="button" class="btn btn-outline-dark">메인으로</button>
	</a>
</div>


<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col" style="text-align: center;">COMMENT</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="c" items="${comment }">
    <tr>
      <th scope="row">${c.ID }<small>(${c.UPDAY }) </small><br/>
      <span class="badge badge-pill badge-warning">${c.CONTENT }</span><br/>
      </th>
    </tr>
  	</c:forEach>
    
  </tbody>
</table>
<label for="newReplyText">댓글작성 </label>
<form action="${pageContext.servletContext.contextPath}/dogTraining/detail.do?no=${read.NO}" method="post"> 
<div class="form-row">
  	  <div class="form-group col-md-11">
	<input type="text" class="form-control" aria-describedby="basic-addon1"
		id="comment" name="content" autocomplete="off" placeholder="댓글 입력 후 Enter를 눌러주세요."></div>
	<div class="form-group col-md-1">
	<button style="float: right;" type="submit" class="btn btn-warning">댓글 작성</button>
	</div>
	</div>
</form>



