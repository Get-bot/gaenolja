<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://fonts.googleapis.com/css?family=Anton" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cute+Font&amp;subset=korean" rel="stylesheet">


<style>
h6 {
  font-family: 'Cute Font', cursive;
  font-size: 30px;
  font-weight: 200;
}
af.f {
  font-weight: 200;
}
</style>
<body >

<div class= "container" style="margin-bottom: 10%;" >
	<div class = "row">
		<div class="my-3 p-3 bg-white rounded shadow-sm border border-info" style="width:100%">
			<h6 class="border-bottom border-gray pb-2 mb-0">개동  <a href="${pageContext.servletContext.contextPath }/dogTraining/training.do?p=1" >
			<small><span class="badge badge-pill badge-info">+더보기</span></small></a></h6>			
				<div class="container">
					<div class="row">
						<c:forEach var="l" items="${dogTraining}" begin="0" end="3">
						<div class="col-md-3" id="post">
							<div class="card mb-4 shadow-sm" style="width: 250px; max-height: 300px">
								<video class="card-img-top" src="${l.UPLOAD }"	width="200" height="225" controls="controls"></video>
								<div class="card-body">
									<p class="card-text">
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted"
											style="position: absolute; bottom: 30px">${l.TITLE}</small> <small
											class="text-muted" style="position: absolute; bottom: 10px">${l.DTID}
										</small>
									</div>									
									<a href="${pageContext.servletContext.contextPath}/dogTraining/detail.do?no=${l.NO }">
									<button type="button" class="btn btn-sm btn-outline-secondary"	style="position: absolute; right: 15px; bottom: 15px"
										id="detailBt" name="detailBt">자세히</button></a>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>		
	</div>
	<div class="row">				
		<div class="col-md-6">		
		<div class="my-3 p-3 bg-white rounded shadow-sm border border-warning" style="width:100%">
			<h6 class="border-bottom border-gray pb-2 mb-0">Recent GaeTalk</h6>			
			<div style="height: 300px; overflow-y: scroll;" id="recentUpdates">				
					<c:forEach var="list" items="${dtrList}">	
					<div class="media text-muted pt-3 media-body pb-3 mb-0 small lh-125 border-bottom border-gray ">	
						<div class="col-sm-2">
							<img src="${pageContext.servletContext.contextPath }${list.PICTURE}" style="width: 45px; height:45px;" class="rounded-circle" id="image">
								
						</div>
						<div class="col">
							<div class="row">
								${list.TALKER} 
								<small class="d-flex justify-content-end">(${list.WRITEDATE})</small>
							</div>
							<div class="row">
								 ${list.CONTENT}
							</div>
						</div>
											
					
					</div>
					</c:forEach>
			</div>	
			<small class="d-block text-right mt-3">
			 <a href="${pageContext.servletContext.contextPath }/dogTalk/index.do">
			<img src="${pageContext.servletContext.contextPath }/image/talkimg.png" style="width:25px; height: 25px;">개톡 더보기</a>
			</small>		
			</div>			
		
			
		</div>	
		
		<div class="col-md-6">
		<div class="my-3 p-3 bg-white rounded shadow-sm border border-success">
			<h6 class="border-bottom border-gray pb-2 mb-0">찾아주시개</h6>
			<div class="container">
				<div class="row">
					<c:forEach var="e" items="${findList}" begin="0" end="1">
						<div class="col-sm-6" id="post">
							<div class="card mb-4 shadow-sm" style="width: 240px; max-height: 300px">
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
									<button type="button" class="btn btn-sm btn-outline-secondary"
										style="position: absolute; right: 15px; bottom: 15px"
										id="detailBt" name="detailBt">자세히</button></a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<small class="d-block text-right mt-3"> <a href="${pageContext.servletContext.contextPath }/find/list.do">+더보기</a>
			</small>
		</div>
	</div>
	</div>	
	<div class="my-3 p-3 bg-white rounded shadow-sm border border-primary">
	<h6 class="border-bottom border-gray pb-2 mb-0">데려가시개  
	 <a href="${pageContext.servletContext.contextPath }/parcel.do">
	 <small><span class="badge badge-pill badge-primary">+더보기</span></small></a></h6>
	<div class= "row">	
		<c:forEach var="p" items="${parcelList }" begin="0" end="1">
			 <div class="col-md-6">
	          <div class="card flex-md-row mb-4 shadow-sm h-md-250">
	         	 <img class="card-img-left flex-auto d-none d-lg-block" src="${pageContext.servletContext.contextPath }${p.MAINIMAGE}" style="width:250px; height:250px;" alt="Card image cap">
	            <div class="card-body d-flex flex-column align-items-start">
	              <strong class="d-inline-block mb-2 text-primary">
	              	<c:choose>
                		<c:when test="${p.CHOICE == 1 }">
	                		<p class="card-text">[분양중]</p>
                		</c:when>
                		<c:otherwise>
							<p class="card-text">[분양완료]</p>
                		</c:otherwise>
                	</c:choose>
	              </strong>
	              <h5 class="mb-0">
	                <a class="text-dark" href="#">${p.TITLE }</a>
	              </h5>
	              <div class="mb-1 text-muted"><fmt:formatDate value="${p.REGDATE }" /></div>
	              <p class="card-text mb-auto">견종 : ${p.BREEDS}<br> 성별 : ${p.GENDER } <br> 나이 : ${p.AGE }</p>
	              <a href="${pageContext.servletContext.contextPath }/detail.do?no=${p.NO }"><span class="badge badge-pill badge-success">View</span></a>
	            </div>  
	          </div>
	        </div>
        </c:forEach>   
      
      </div>        
	</div>

</div>
	<script>
   	
   </script>

</body>
