<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">

<hr size="30px" width="100%">
<div class="container" style="margin-left: 3%;">	
	<div class="album ">
			<div class="container bg-white rounded">
				<div class="row">
					<c:forEach var="e" items="${every}">
						<div class="col-md-4" id="post">
							<div class="card mb-4 shadow-sm" style="width: 250px; max-height: 300px">
								<img class="card-img-top"
								src="${pageContext.servletContext.contextPath}${e.PICTURE}"
								width="200" height="225">
								<div class="card-body">
									<p class="card-text">
									<div class="d-flex justify-content-between align-items-center">
								
										<small class="text-muted"
											style="position: absolute; bottom: 30px">${e.TITLE}</small> <small
											class="text-muted" style="position: absolute; bottom: 10px">${e.NICK}
										</small>
								
									</div>
									<a href="${pageContext.servletContext.contextPath}/find/detail.do?no=${e.NO }">
									<button type="button" class="btn btn-sm btn-outline-primary"
										style="position: absolute; right: 15px; bottom: 15px"
										id="detailBt" name="detailBt">자세히</button></a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	<br/>	
	<footer class="text-muted">
		<div class="container">
			<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
					
					<c:forEach var="p" begin="1" end="${size }">
						<c:choose>
							<c:when test="${p==current}">
								<li class="page-item active">
     							 <a class="page-link" href="${pageContext.servletContext.contextPath }/find/list.do?p=${p}">${p }
     							 <span class="sr-only">(current)</span>
     							 </a></li>	
     						 </c:when>
     						 <c:otherwise>
     						 	<a class="page-link" href="${pageContext.servletContext.contextPath }/find/list.do?p=${p}">${p }</a>
     						</c:otherwise>
     					</c:choose>					
					</c:forEach>
				
			</ul>
			</nav>
			
			<div>
				<div style="text-align:center">
				<a href="${pageContext.servletContext.contextPath }/find/write.do">
				<button type="button" class="btn btn-outline-primary">글쓰기</button></a>
				</div>
				<div style="text-align:right">
					<a href="${pageContext.servletContext.contextPath }/main/index.do">
				<button type="button" class="btn btn-outline-secondary btn-sm">메인으로</button></a>
				</div>
			</div>
			<br/>
		</div>		
	</footer>
</div>

