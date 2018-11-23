<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">
<div class="d-flex justify-content-center col-12">
	<table class="table table-hover ">
		<thead class="thead-light" style="text-align:center">
			<tr>
				<th scope="col" style="width:5%">#</th>
				<th scope="col" style="width:40%">제목</th>
				<th scope="col" style="width:20%">작성자</th>
				<th scope="col" style="width:15%">날짜</th>
				<th scope="col" style="width:8%">조회수</th>
			</tr>
		</thead>
		<tbody style="text-align:center">
			<c:forEach var="l" items="${list}">
				<tr>
					<th scope="row">${l.NO }</th>
					<td><a
						href="${pageContext.servletContext.contextPath  }/help/detail.do?no=${l.NO }">
							${l.TITLE }</a></td>
					<td>${l.NICK }</td>
					<td><fmt:formatDate value="${l.REGDATE }" /></td>
					<td>${l.LOOK }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
	<br />
	<footer class="text-muted">
		<div class="container">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					
					<c:forEach var="p" begin="1" end="${size }">
						<c:choose>
							<c:when test="${p==current}">
								<li class="page-item active">
     							 <a class="page-link" href="${pageContext.servletContext.contextPath }/help/list.do?p=${p}">${p }<span class="sr-only">(current)</span>
     							 </a></li>	
     						 </c:when>
     						 <c:otherwise>
     						 	<a class="page-link" href="${pageContext.servletContext.contextPath }/help/list.do?p=${p}">${p }</a>
     						</c:otherwise>
     					</c:choose>					
					</c:forEach>
					
				</ul>
			</nav>
			<br/>
			<div>
				<div style="text-align: center" >
					<a href="${pageContext.servletContext.contextPath }/help/write.do">
						<button type="button" class="btn btn-outline-primary">글쓰기</button>
					</a>
					<a href="${pageContext.servletContext.contextPath }/main/index.do">
						<button type="button" class="btn btn-outline-secondary">메인으로</button>
					</a>
				</div>
			</div>
		</div>
		<br />
		
	</footer>