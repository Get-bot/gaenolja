<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div class="container">
		<div class="card flex-md-row shadow-sm ">
			<div class="card-body d-flex flex-column align-items-start">
				<div class="content-md-center">
					<br />
					<h3 class="mb-0">
						<a class="text-dark">${map.dogname}</a>
					</h3>
				</div>
				<br />
			
				<div class="mb-1 text-muted">
					<p class="card-text mb-auto">
						회원님의 소중한 가족 <b>${map.dogname}</b>이(가)<br/> 
						<br />
						다시 회원님의 곁으로 가길 바랍니다.
					</p>
				</div>
			</div>
			<img class="card-img-right flex-auto d-none d-lg-block"
				data-src="holder.js/200x250?theme=thumb" alt="Thumbnail [200x250]"
				style="width: 200px; height: 250px;"
				src="${pageContext.servletContext.contextPath}${map.picture}"
				data-holder-rendered="true">
		</div>
		<br/>
		<div style="text-align:center">
					<a href="${pageContext.servletContext.contextPath }/find/list.do">
					<button type="button" class="btn btn-outline-secondary btn-sm">목록으로 </button></a>
				</div>
	</div>
</body>