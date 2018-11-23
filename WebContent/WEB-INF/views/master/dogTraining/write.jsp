<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${err eq 'on' }">
	<script>window.alert("글이 정상처리 되지 않았습니다.\n필수사항을 다시한번 확인해주세요.")</script>
</c:if>
<form class="needs-validation"
	action="${pageContext.servletContext.contextPath }/dogTraining/write.do"
	method="post" enctype="multipart/form-data">
<h6 style="text-align: center;">현재 페이지는 강아지 트레이닝 게시판 등록 페이지입니다.<br/><br/>
파일 업로드는 동영상이 아니면 , 글이 정상 등록되지 않습니다.<br/><br/>
(*) 는 필수 항목입니다. 다시 한번 확인해주세요.
</h6>	

<hr/>	
<div class="mb-3">
		<label for="text">(*)제 목 <span class="text-muted"></span> <small
			id="size1">(0/15)</small>
		</label> <input type="text" class="form-control" id="title" name="title"
			placeholder="15글자 내외로 작성해주세요" autocomplete="off">
</div>
<hr/>
<div class="mb-3">
		<label for="text">(*)내 용</label><small id="size2">(0/500)</small>
		<textarea class="form-control" id="content" name="content" aria-label="With textarea"
			style="width: 99%; height: 100px; resize: none;" autocomplete="off"></textarea>
</div>
<hr/>
<div class="mb-3">
		<label for="text">파일 업로드  </label>
		<input type="file" class="form-control" name="attach">
</div>
<hr/>
<button class="btn btn-secondary btn-lg btn-block" type="submit" id="b">등록하기</button>

</form>

<script>

$("#title").on("keyup", function() {
	var len = $("#title").val().length;
	console.log(len);

	var html = "(" + len + "/15)";
	document.getElementById("size1").innerHTML = html;

	if (len >= 15) {
		$("#b").prop("disabled", true);
	} else {
		$("#b").prop("disabled", false);
	}

});

$("#content").on("keyup", function() {
	var len = $("#content").val().length;
	console.log(len);

	var html = "(" + len + "/500)";
	document.getElementById("size2").innerHTML = html;

	if (len >= 500) {
		$("#b").prop("disabled", true);
	} else {
		$("#b").prop("disabled", false);
	}

});


</script>


