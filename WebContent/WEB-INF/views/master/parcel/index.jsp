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
			
			<c:if test="${paging.curRange ne 1 }">
				<a href="javascript:void(0)" onclick="parcelpaging(1)">[처음]</a>
			</c:if>
		
			<c:if test="${paging.curRange ne 1 }">
				<a href="javascript:void(0)" onclick="parcelpaging(${paging.prevPage})">[이전]</a>
			</c:if>
			
			<c:forEach var="pageNum" begin="${paging.startPage }" end="${paging.endPage }">
				<c:choose>
					<c:when test="${pageNum eq paging.curPage }">
						<span><a href="javascript:void(0)" onclick="parcelpaging(${pageNum})">${pageNum }</a></span>
					</c:when>
					<c:otherwise>
						<a href="javascript:void(0)" onclick="parcelpaging(${pageNum})">${pageNum }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.curPage ne paging.pageCnt && paging.pageCnt > 0 }">
				<a href="javascript:void(0)" onclick="parcelpaging(${paging.nextPage})">[다음]</a>
			</c:if>
			<c:if test="${paging.curPage ne paging.pageCnt && paging.pageCnt > 0 }">
				<a href="javascript:void(0)" onclick="parcelpaging(${paging.pageCnt})">[끝]</a>
			</c:if>
			
		</ul>
		</nav>
</div>

<script type="text/javascript">

	function parcelpaging(target) {
		location.href = "${pageContext.servletContext.contextPath }/parcel.do?curPage=" + target;
	}

</script>




