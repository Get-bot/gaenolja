<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="album py-5 bg-light" style="width: 900px; margin: auto;">
	<div class="container">
		<div class="row">
			<c:forEach var="p" items="${every }">
            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                <img class="card-img-top" src="${pageContext.servletContext.contextPath }${p.MAINIMAGE}" alt="Card image cap">
                <div class="card-body">
                	<c:choose>
                		<c:when test="${p.CHOICE == 1 }">
	                		<p class="card-text">[분양중]</p>
                		</c:when>
                		<c:otherwise>
							<p class="card-text">[분양완료]</p>
                		</c:otherwise>
                	</c:choose>
                  <p class="card-text">${p.TITLE }</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <a href="${pageContext.servletContext.contextPath }/detail.do?no=${p.NO }"><button type="button" class="btn btn-sm btn-outline-secondary">View</button></a>
                    </div>
                    <small class="text-muted"><fmt:formatDate value="${p.REGDATE }" /></small>
                  </div>
                </div>
              </div>
			</div>
			</c:forEach>
		</div>
	</div>
	<a href="${pageContext.servletContext.contextPath }/new.do" class="btn btn-sm btn-outline-secondary" >글쓰기</a>
		<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:forEach var="s" begin="1" end="${size }">
					<c:choose>
						<c:when test="${s==current}">
							<li class="page-item active">
    							 <a class="page-link" href="${pageContext.servletContext.contextPath }/parcel.do?p=${s}">${s }<span class="sr-only">(current)</span>
    							 </a></li>	
    						 </c:when>
    						 <c:otherwise>
    						 	<a class="page-link" href="${pageContext.servletContext.contextPath }/parcel.do?p=${s}">${s }</a>
    						</c:otherwise>
    					</c:choose>					
				</c:forEach>
		</ul>
		</nav>
</div>




