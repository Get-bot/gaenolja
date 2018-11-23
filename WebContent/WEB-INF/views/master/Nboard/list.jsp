<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-hover" style="width: 900px; margin: auto;">
	
	<thead>
		<tr class="table-success">
			<th scope="col" style="width:50px; text-align: center;"><small>NO</small></th>
			<th scope="col" style="width:150px; text-align: center;"><small>제목</small></th>
			<th scope="col" style="width:80px; text-align: center;"><small>작성자</small></th>
			<th scope="col" style="width:80px; text-align: center;"><small>날짜</small></th>
			<th scope="col" style="width:50px; text-align: center;"><small>조회수</small></th>
		</tr>
	</thead>
	<tbody style="text-align: center">
		<c:forEach var="e" items="${every}">
			<tr>
				<th scope="row">${e.BOARD_NUM }</th>
				<td><a
					href="${pageContext.servletContext.contextPath }/Nboard/detail.do?BOARD_NUM=${e.BOARD_NUM }">
						${e.BOARD_SUBJECT } </a></td>
				<td>${e.BOARD_ID }</td>
				<td>${e.BOARD_DAY }</td>
				<td>${e.BOARD_LOOKUP }</td>
			</tr>


		</c:forEach>
	</tbody>
</table>


<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">		
		<c:forEach var="p" begin="1" end="${size }">
			<c:choose>
				<c:when test="${p==current}">
					<li class="page-item active"><a class="page-link"
						href="${pageContext.servletContext.contextPath }/Nboard/list.do?p=${p}">${p }<span
							class="sr-only">(current)</span>
					</a></li>
				</c:when>
				<c:otherwise>
					<a class="page-link"
						href="${pageContext.servletContext.contextPath }/Nboard/list.do?p=${p}">${p }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>		
	</ul>
</nav>


<c:if test="${userInfo.ID eq 'admin'}">
	<div style="text-align: right">
		<a href="${pageContext.servletContext.contextPath }/Nboard/write.do"
			class="btn btn-primary">글쓰기</a>
	</div>
</c:if>
