<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

  		<div class="jumbotron jumbotron-fluid">
		  <div class="container">
		    <h2 class="display-4">공지사항<small>(작성자 : ${read.BOARD_ID})</small></h2>
		    <hr/>
		    <h4>제목 : ${read.BOARD_SUBJECT} </h4>
		    <p class="lead" style="margin-top: 2rem;">${read.BOARD_CONTENT}</p>
		    <p class="d-flex justify-content-end"><small>작성일 :${read.BOARD_DATE} / 조회수 : ${read.BOARD_LOOKUP}</small></p>
		  </div>
		</div>

     	<div style="text-align: right">
     <a href="${pageContext.servletContext.contextPath }/Nboard/list.do" class="btn btn-primary">목록으로</a>
      
       <c:if test="${sessionScope.userInfo.ID eq 'admin' }">
         <button type="button" class="btn btn-primary" id="endbtn">글 삭제</button>
         <script>
			$("#endbtn").on("click",function(){
			var end=window.confirm("정말 삭제 하시겠습니까??");
			if (end==true) {
				window.location.href="${pageContext.servletContext.contextPath}/Nboard/delete.do?no=${read.BOARD_NUM}";				
				};
			});
	</script>
       </c:if>
     </div>
     	
    </html>



