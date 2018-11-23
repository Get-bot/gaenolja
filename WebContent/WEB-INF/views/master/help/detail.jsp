<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link href="${pageContext.servletContext.contextPath }/css/test/carousel.css"	rel="stylesheet">
<hr size="30px" width="100%">
<div class="container bg-white rounded shadow-sm">
	<p style="text-align: right; color: gray">${data.GADAY }</p>
	<p>
	<h2 style="text-align: center">
		<b>${data.TITLE }</b>
	</h2>
	<div class="row">
		<div class="col-md-6 my-3 p-3 bg-white rounded shadow-sm">
			<hr size="10px" width="100%">
			<br />
			<div class="row-6">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
			       <div class="carousel-inner">
			          <div class="carousel-item active">         
			               <img class="" style="height:auto; width: 480px; height: 100%;"	src="${pageContext.servletContext.contextPath}${data.INPUTFILE1}"	alt="First slide">
			          </div>
			          <div class="carousel-item">
			            <img class="" style="height:auto; width: 480px; height: 100%;"
											src="${pageContext.servletContext.contextPath}${data.INPUTFILE2}"
											alt="No image">
			          </div>     
			        </div>
			        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
			          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			          <span class="sr-only">Previous</span>
			        </a>
			        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
			          <span class="carousel-control-next-icon" aria-hidden="true"></span>
			          <span class="sr-only">Next</span>
			        </a>
			      
			      </div>					
				</div>		
				<div class="card-body my-3 p-3 bg-white rounded shadow-sm"
						style="height: 350px; width: 480px;">
						<p class="card-text">${data.CONTENT}</p>
					</div>		
			</div>
		




		<div class="col-md-6 my-3 p-3 bg-white rounded shadow-sm">
			<hr size="10px" width="100%">
			<br />
			<div id="list" style="height: 700px; overflow-y: scroll; background-image:url('../image/commentBackImage.png')">
				<c:forEach var="c" items="${comment}">

					<div class="card">
					<div class="card-header d-flex bd-highlight" ><div class="flex-grow-1">※ <b>${c.NICK}</b>님이 작성했어요 !</div>
					 <div class="bd-highlight"><small id="date" class="d-flex justify-content-end" style="color:gray"> 【 ${c.GACOMDAY} 】</small></div></div>
						<div class="card-body">
							<p class="card-text">▶&emsp;${c.REPLY}</p>
						</div>
					</div>
				</c:forEach>
			<!-- 채팅 -->
			<form
				action="${pageContext.servletContext.contextPath }/help/detail.do?no=${no}"
				method="post">
				<div class="input-group" style="position: absolute; bottom: 0px; left:-0px;">
					<input type="text" class="form-control" aria-label="With textarea"
						placeholder="댓글을 작성해주세요" name="comment" autocomplete="off" style="left:-0px;">
					<button type="submit" class="btn btn-secondary btn-med">작성하기</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>
<br />
<div>

	<div style="text-align: center" class="d-flex justify-content-center">
		<div>
			<div style="text-align: center" class="d-flex justify-content-center">
				<a href="${pageContext.servletContext.contextPath }/help/list.do">
					<button type="button" class="btn btn-outline-primary">목록으로</button>
				</a> <a href="${pageContext.servletContext.contextPath }/main/index.do">
					<button type="button" class="btn btn-outline-primary">메인으로</button>
				</a>
			</div>
			<br />
		</div>
	</div>
</div>


<div class="bd-example">
	<c:choose>
		<c:when test="${info.NICKNAME == data.NICK }">
			<a href="${pageContext.servletContext.contextPath }/help/detailModify.do?no=${data.NO }"><button type="button" class="btn btn-primary btn-lg btn-block" >수정</button></a>
		</c:when>
		<c:otherwise>
			""
		</c:otherwise>
	</c:choose>
</div>

<!-- 
<script>
	var addComment = function() {
		console.log("addComment Function");
		var url = "/gaenolja/help/detail.do";
		console.log(document.getElementById("content").value);
		console.log("${userInfo.DOGPROFILE}");
		var param = {
			"no" : "${data.NO}",
			"writer" : "${c.NICK}",
			"comment" : document.getElementById("content").value,
			"picture" : "${userInfo.DOGPROFILE}",
			"date" : "${c.GACOMDAY}"
		};

		$
				.post(
						url,
						param,
						function(rst) {
							window.alert("글이 등록되었습니다.")
							document.getElementById("content").innerHTML = "";

							console.log(rst.length);
							console.log("rst.length = " + rst.length);
							var html = "";
							for (var i = 0; i < rst.length; i++) {
								var writer = rst[i].NICK;
								var comment = rst[i].REPLY;
								var picture = "${pageContext.servletContext.contextPath}"
										+ rst[i].DOGPROFILE;
							var date = rst[i].REGDATE;

								html += "<div class=\"card\" id=\"form\">";
								html += "<div class=\"card-header d-flex bd-highlight\"><div class=\"flex-grow-1\">"
										+ writer + "'s comment</div>";
								html += "<div class=\"bd-highlight\"><small id=\"date\" class=\"d-flex justify-content-end\">";
								html += date + "</small></div></div>";
								html += " <div class=\"card-body\">";
								html += "<blockquote class=\"blockquote mb-0\">";
								html += "<div class=\"row align-items-center\">";
								html += "<img src=\""+picture+"\" style=\"width: 40px; height: 40px;\"class=\"rounded-circle\" id =\"image\">";
								html += " <p>" + comment + "</p></div>";
								html += "<footer class=\"blockquote-footer d-flex justify-content-end \"><span id=\"address\">";
								html += "</blockquote>";
								html += "</div>";
								html += "</div>";

							}

							document.getElementById("list").innerHTML = html;
							document.getElementById("content").value = "";
						});
	};
</script> -->
