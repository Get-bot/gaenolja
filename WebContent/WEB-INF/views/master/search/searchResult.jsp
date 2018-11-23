<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div style="margin-bottom:  10%;">
<c:if test="${not empty noResult}">
	<img src="${pageContext.servletContext.contextPath}/image/noResult.jpg" width="1000px" class="justify-content-center">
</c:if>

<c:if test="${not empty find}">
	<div class="alert alert-info" role="alert">찾아주시개 글에서 (검색결과 :
		${fn:length(find)}개)<a href="${pageContext.servletContext.contextPath}/board/main.do" class="justify-content-end"><span class="badge badge-pill badge-primary">게시판으로</span></a></div>
	<div class="container">
		<div class="row">
			<c:forEach var="e" items="${find}">
				<div class="col-md-4" id="post">
					<div class="card mb-4 shadow-sm"
						style="width: 250px; max-height: 300px">
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
							<a
								href="${pageContext.servletContext.contextPath}/find/detail.do?no=${e.NO }">
								<button type="button" class="btn btn-sm btn-outline-secondary"
									style="position: absolute; right: 15px; bottom: 15px"
									id="detailBt" name="detailBt">자세히</button>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</c:if>

<c:if test="${not empty parcel}">
	<div class="alert alert-info" role="alert">데려가시개 글에서 (검색결과 :	${fn:length(parcel)}개)
	<a href="${pageContext.servletContext.contextPath}/parcel.do" class="justify-content-end"><span class="badge badge-pill badge-primary">게시판으로</span></a></div>
	<div class="container">
		<div class="row">
			<c:forEach var="p" items="${parcel}">
				<div class="col-md-4">
					<div class="card mb-4 shadow-sm">
						<img class="card-img-top"
							src="${pageContext.servletContext.contextPath }${p.MAINIMAGE}"
							alt="Card image cap">
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
									<a
										href="${pageContext.servletContext.contextPath }/detail.do?no=${p.NO }"><button
											type="button" class="btn btn-sm btn-outline-secondary">View</button></a>
								</div>
								<small class="text-muted"><fmt:formatDate
										value="${p.REGDATE }" /></small>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</c:if>

<c:if test="${not empty dogList}">
	<div class="alert alert-info" role="alert">Gaekipedia 글에서 (검색결과 : ${fn:length(dogList)}개)
	<a href="${pageContext.servletContext.contextPath}/board/main.do" class="justify-content-end"><span class="badge badge-pill badge-primary">게시판으로</span></a></div>
	<div class="container">
		<div class="row">
			<c:forEach var="list" items="${dogList}">
				<div class="col-sm-3">
					<a href="#"><img
						src="${pageContext.servletContext.contextPath}${list.IMG}"
						width="150" height="150" data-toggle="modal"
						data-target="#exampleModalCenter" data-name="${list.NAME}"
						data-engname="${list.ENGNAME}"
						data-source="${pageContext.servletContext.contextPath}${list.IMG}"
						data-info="${list.INFO }"><br/>
						<span style="text-align: center" data-toggle="modal"data-target="#exampleModalCenter" data-name="${list.NAME}" data-engname="${list.ENGNAME}"
						data-source="${pageContext.servletContext.contextPath}${list.IMG}">${list.NAME}</span></a>
				</div>
			</c:forEach>
		</div>
	</div>
</c:if>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class= "container">
				<div class="row">
					<div class="col">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalCenterTitle"></h5>
							<button type="button" class="close justify-content-end" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="row">
							<div class="col">
								<div class="modal-img"></div>
							</div>
								<div class="col">
									<div class="modal-info">
										<label class="form-control"></label>
									</div>
								</div>
							</div>
						</div>					
					</div>
					<div class="row">
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
					</div>
				</div>
		</div>
	</div>
</div>
<!--========================= 같이가시개 겁색결과 ==================================================-->
<c:if test="${not empty together}">
	<div class="alert alert-info" role="alert">같이가시개 글에서 (검색결과 : ${fn:length(together)}개)
	<a href="${pageContext.servletContext.contextPath}/together/mainboard.do?p=1" class="justify-content-end"><span class="badge badge-pill badge-primary">게시판으로</span></a></div>
	<div class="row">	
		<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col" style="width: 3%"><small>NO</small></th>
						<th scope="col" style="width: 10%"><small>지역</small></th>
						<th scope="col" style="width: 35%"><small>제목</small></th>
						<th scope="col" style="width: 20%"><small>작성자</small></th>
						<th scope="col" style="width: 10%"><small>날짜</small></th>
						<th scope="col" style="width: 9%"><small>추천</small></th>
						<th scope="col" style="width: 9%"><small>조회수</small></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="l" items="${together}">
						<tr>
							<th scope="row">${l.NO }</th>
							<td><small>${l.AREA }</small></td>
							<td><a
								href="${pageContext.servletContext.contextPath  }/together/detail.do?no=${l.NO }">
									${l.TITLE }</a></td>
							<td>-</td>
							<td>${l.DAY }</td>
							<td>${l.GOOD }</td>
							<td>${l.LOOKUP }</td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
		</div>
</c:if>
<!--========================= 개톡 겁색결과 ==================================================-->
<c:if test="${not empty dogTalk}">
	<div class="alert alert-info" role="alert">개톡 글에서 (검색결과 : ${fn:length(dogTalk)}개)
	<a href="${pageContext.servletContext.contextPath}/dogTalk/index.do" class="justify-content-end"><span class="badge badge-pill badge-primary">게시판으로</span></a></div>
	<div class="row">	
		<c:forEach var="list" items="${dogTalk}">		
			<div class="col-md-4">	
						<div class="card" id="form">
							<div class="card-header d-flex bd-highlight" style="background-color: #FFDEAD  "><div class="flex-grow-1">${list.TALKER}'s comment</div>
							 <div class="bd-highlight"><small id="date" class="d-flex justify-content-end">${list.WRITEDATE}</small></div></div>
							<div class="card-body" style="background-color: #AED6F1;">
								<blockquote class="blockquote mb-0" >
									<div class="row align-items-center" >
										<img
											src="${pageContext.servletContext.contextPath }${list.PICTURE}"
											style="width: 80px; height: 80px;" class="rounded-circle"
											id="image">
			
										<p >&nbsp;&nbsp;<span style="background-color: white;">${list.CONTENT}</span></p>
									</div>
									<footer class="blockquote-footer d-flex justify-content-end "><cite title="Source Title">
										<span id="address">${list.ADDRESS}...</span> </cite>
										
									</footer>
			
								</blockquote>
							</div>
						</div>		
			</div>
		</c:forEach>
	</div>
</c:if>
<!--========================= 공지사항 겁색결과 ==================================================-->
<c:if test="${not empty nboard}">
	<div class="alert alert-info" role="alert">공지사항 글에서 (검색결과 : ${fn:length(nboard)}개)
	<a href="${pageContext.servletContext.contextPath}/Nboard/list.do" class="justify-content-end"><span class="badge badge-pill badge-primary">게시판으로</span></a></div>
	<table class="table table-hover">

  		<thead>
	     <tr>
    	  <th scope="col" style="width: 7%"><small>NO</small></th>
    	  <th scope="col" style="width: 50%"><small>제목</small></th>
     	  <th scope="col" style="width: 15%"><small>날짜</small></th>
     	  <th scope="col" style="width: 12%"><small >추천</small></th>
     	  <th scope="col" style="width: 12%"><small>조회수</small></th>
	     </tr>
  		</thead>
  		<tbody>
     	<c:forEach var="l" items="${nboard }">
     		<tr>
     			<th scope="row">${l.BOARD_NUM }</th>
     			<td>
     			<a href="${pageContext.servletContext.contextPath }/Nboard/detail.do?BOARD_NUM=${l.BOARD_NUM }">
     			${l.BOARD_SUBJECT }
     			</a></td>
     			<td>${l.BOARD_DATE }</td>
     			<td>${l.BOARD_COUNT }</td>
     			<td>${l.BOARD_LOOKUP }</td>
     		</tr>     		
     	</c:forEach> 		     	   
		</tbody>
</table>
</c:if>


<c:if test="${not empty dogTraining}">
	<div class="alert alert-info" role="alert" style="margin-top: 3%;">개동 글에서 (검색결과 : ${fn:length(dogTraining)}개)
	<a href="${pageContext.servletContext.contextPath}/dogTraining/training.do?p=1" class="justify-content-end"><span class="badge badge-pill badge-primary">게시판으로</span></a></div>
		<div class="row">	
			<c:forEach var="l" items="${dogTraining}">
							<div class="col-md-4" id="post">
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
	
										<a href="${pageContext.servletContext.contextPath}/dogTraining/detail.do?NUM=${l.NUM }">
										<button type="button" class="btn btn-sm btn-outline-secondary"	style="position: absolute; right: 15px; bottom: 15px"
											id="detailBt" name="detailBt">자세히</button></a>
									</div>
								</div>
							</div>
			</c:forEach>
		</div>
</c:if>

<c:if test="${not empty dogHospital}">
	<div class="alert alert-info" role="alert">동물병원 글에서 (검색결과 : ${fn:length(dogHospital)}개)
	<a href="${pageContext.servletContext.contextPath}/doghospital.do" class="justify-content-end"><span class="badge badge-pill badge-primary">게시판으로</span></a></div>
		<div class="row">	
						
			<div style="width: 900px; margin: auto;">
			<hr />
			<table class="table table-hover">
					<thead>
						<tr>
							<th style="text-align: center;"><small>지역</small></th>
							<th style="text-align: center;"><small>구분</small></th>
							<th style="text-align: center;"><small>병원이름</small></th>
							<th style="text-align: center;"><small>주소</small></th>
							<th style="text-align: center;"><small >전화번호</small></th>
							<th style="text-align: center;"><small>우편번호</small></th>
						</tr>
					</thead>
				<tbody>
				<c:forEach var="dh" items="${dogHospital}" begin="0" end="9">
					<tr>
						<td style="text-align: center;"><small>${dh.GU }</small></td>
						<td style="text-align: center;"><small>${dh.SORT }</small></td>
						<td style="text-align: center;"><small>${dh.HOSPITALNAME }</small></td>
						<td style="text-align: center;"><small>${dh.ADDRESS }</small></td>
						<td style="text-align: center;"><small>${dh.PHONE }</small></td>
						<td style="text-align: center;"><small>${dh.POSTALCODE }</small></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			
		</div>
</c:if>


<c:if test="${not empty help}">
	<div class="alert alert-info" role="alert">도와주시개 글에서 (검색결과 : ${fn:length(help)}개)
	<a href="${pageContext.servletContext.contextPath}/help/list.do" class="justify-content-end"><span class="badge badge-pill badge-primary">게시판으로</span></a></div>
		<div class="row">	
			<table class="table">
		<thead class="thead-light">
			<tr>
				<th scope="col">#</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">날짜</th>
				<th scope="col">조회수</th>
				<th scope="col">추천</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="h" items="${help}">
				<tr>
					<th scope="row">${h.NO }</th>
					<td><a
						href="${pageContext.servletContext.contextPath  }/help/detail.do?no=${h.NO }">
							${h.TITLE }</a></td>
					<td>${h.WRITER }</td>
					<td>${h.REGDATE }</td>
					<td>${h.LOOK }</td>
					<td>${h.GOOD }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		</div>
</c:if>
</div>
<script>	
	
	$('#exampleModalCenter').on('show.bs.modal', function (event) {
	  console.log("original page function");
	  var button = $(event.relatedTarget) ;
	  var targetName = button.data('name');
	  var targetEng = button.data('engname');
	  var targetImg = "<img src=\""+button.data('source')+"\"  width=\"250\" height=\"300\""+">";
	  var targetInfo = button.data('info');
	  var modal = $(this)
	  modal.find('.modal-header label').val(targetName)
	  modal.find('.modal-title').text(targetName+"("+targetEng+")")	  
	  modal.find('.modal-img').html(targetImg)
	  modal.find('.modal-info').text(targetInfo)
	  
	})
</script>