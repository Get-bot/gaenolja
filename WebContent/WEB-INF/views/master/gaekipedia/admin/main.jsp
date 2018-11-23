<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<a href = "${pageContext.servletContext.contextPath}/admin/dogBoard/add.do">
<button type="button" class="btn btn-info btn-lg btn-block">강아지 정보 추가하기</button>
</a>
<div class="container marketing">
<ul class="nav nav-tabs" id="myTab" role="tablist">
	<li class="nav-item"><a class="nav-link active" id="all-tab"
		data-toggle="tab" href="#home" role="tab" aria-controls="all"
		aria-selected="true">전체</a></li>
	<li class="nav-item"><a class="nav-link" id="bigDog-tab"
		data-toggle="tab" href="#bigDog" role="tab" aria-controls="bigDog"
		aria-selected="false">대형견</a></li>
	<li class="nav-item"><a class="nav-link" id="medDog-tab"
		data-toggle="tab" href="#medDog" role="tab" aria-controls="medDog"
		aria-selected="false">중형견</a></li>
	<li class="nav-item"><a class="nav-link" id="smallDog-tab"
		data-toggle="tab" href="#smallDog" role="tab" aria-controls="smallDog"
		aria-selected="false">소형견</a></li>
</ul>


<div class="tab-content" id="myTabContent">
	<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="all-tab">		
		<div class="dogList row" style="overflow-y: scroll;" >
			<c:forEach var="list" items="${allList}">
				<div class="col-sm-2">
					<a href="#"><img
						src="${pageContext.servletContext.contextPath}${list.IMG}"
						width="150" height="150" data-toggle="modal"
						data-target="#exampleModalCenter" data-name="${list.NAME}"
						data-engname="${list.ENGNAME}"
						data-source="${pageContext.servletContext.contextPath}${list.IMG}"
						data-info="${list.INFO }"><br/>
						<span style="text-align: center" data-toggle="modal"data-target="#exampleModalCenter" data-name="${list.NAME}" data-engname="${list.ENGNAME}"
						data-source="${pageContext.servletContext.contextPath}${list.IMG}">${list.NAME}</span></a>
						<button type="button" class="btn btn-outline-danger" id="deletebtn" >글 삭제</button>
				</div>
			</c:forEach>
		</div>		
	</div>
	<div class="tab-pane fade " id="bigDog" role="tabpanel" aria-labelledby="all-tab"  aria-hidden="true">		
		<div class="dogList row" style="overflow-y: scroll;" >
			<c:forEach var="list" items="${bigDogList}">
				<div class="col-sm-2">
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
	<div class="tab-pane fade" id="medDog" role="tabpanel" aria-labelledby="all-tab"  aria-hidden="true">		
		<div class="dogList row" style="overflow-y: scroll;" >
			<c:forEach var="list" items="${medDogList}">
				<div class="col-sm-2">
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
	<div class="tab-pane fade" id="smallDog" role="tabpanel" aria-labelledby="all-tab"  aria-hidden="true">		
		<div class="dogList row" style="overflow-y: scroll;" >
			<c:forEach var="list" items="${smallDogList}">
				<div class="col-sm-2">
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
</div>



	<!-- Button trigger modal -->

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
</div>



<script>	
	
	$('#exampleModalCenter').on('show.bs.modal', function (event) {
	  console.log("modalfunction");
	  var button = $(event.relatedTarget) ;
	  var targetName = button.data('name');
	  var targetEng = button.data('engname');
	  var targetImg = "<img src=\""+button.data('source')+"\"  width=\"250\" height=\"300\""+">";
	  var targetInfo = button.data('info');
	  var modal = $(this)
	  console.log(targetName);
	  console.log(targetEng);
	  console.log(targetImg);
	  console.log(targetInfo);
	
	  
	  modal.find('.modal-header label').val(targetName)
	  modal.find('.modal-title').text(targetName+"("+targetEng+")")	  
	  modal.find('.modal-img').html(targetImg)
	  modal.find('.modal-info').text(targetInfo)
	  
	})
</script>

	

