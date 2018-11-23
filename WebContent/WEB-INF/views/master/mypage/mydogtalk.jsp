<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>강아지 수다</h2>
	<div id="list">
		<c:forEach var="d" items="${dogtalk}">			
				<div class="card" id="form">
					<div class="card-header d-flex bd-highlight"><div class="flex-grow-1">${d.TALKER}'s comment</div>
					 <div class="bd-highlight"><small id="date" class="d-flex justify-content-end">${d.WRITEDATE}</small></div></div>
					<div class="card-body">
						<blockquote class="blockquote mb-0">
							<div class="row align-items-center">
								<img
									src="${pageContext.servletContext.contextPath }${d.PICTURE}"
									style="width: 80px; height: 80px;" class="rounded-circle"
									id="image">
	
								<p>${d.CONTENT}</p>
							</div>
							<footer class="blockquote-footer d-flex justify-content-end "><cite title="Source Title">
								<span id="address">${d.ADDRESS}...</span> </cite>
								
							</footer>
	
						</blockquote>
					</div>
				</div>		
		</c:forEach>
	</div>