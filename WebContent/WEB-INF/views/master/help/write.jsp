<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">
<form method="post" enctype="multipart/form-data"
	action="${pageContext.servletContext.contextPath }/help/write.do">

		<div class="d-flex justify-content-center">
	<div class="my-5 p-5 bg-white rounded shadow-sm ">
			<hr size="30%" width="100%">
			<div class="row ">
				<div class="col-md-6">
					<label for="lastName">제 목</label> <input type="text"
						class="form-control" id="title" name="title">
				</div>
				<div class="col-md-6">
					<label>사진 첨부</label>
					<div class="custom-file ">
						<input type="file" class="custom-file-input"
							aria-describedby="inputGroupFileAddon03" id="inputfile1"
							name="inputfile1" accept="image/*, video/*"> <label
							class="custom-file-label" for="inputGroupFile03"> If you
							need a File</label>
					</div>
					<div class="custom-file ">
						<input type="file" class="custom-file-input"
							aria-describedby="inputGroupFileAddon03" id="inputfile2"
							name="inputfile2" accept="image/*, video/*"> <label
							class="custom-file-label" for="inputGroupFile03"> If you
							need a another File</label>
					</div>
				</div>
			</div>

			<br />
			<div class="row d-flex justify-content-center col-12">
				
					<div class="col-md-6" style="height: 300px;">
						<div class="d-flex justify-content-center">
							<img
								src="${pageContext.servletContext.contextPath }/image/noimage.png"
								id="preview1" style="width: 300px; height: 290px;"
								onchange="putImage(this)" class="rounded img-fluid" />
						</div>
					</div>
					<div class="col-md-6" style="height: 300px;">
						<div class="d-flex justify-content-center">
							<img
								src="${pageContext.servletContext.contextPath }/image/noimage.png"
								id="preview2" style="width: 300px; height: 290px;"
								onchange="putImage(this)" class="rounded img-fluid" />
						</div>
					</div>
			
			</div>
			<div>
				<div class="col-12">
					<textarea class="form-control" style="resize: none; height: 240px;"
						placeholder="내용을 적어주세요" id="content" name="content"></textarea>
				</div>
			</div>

			<br />
			<div style="text-align: center">
				<div>
					<button type="submit" class="btn btn-outline-primary"
						onclick="writeOn();">작성 완료</button>
				</div>
				<br />
				<div>
					<a href="${pageContext.servletContext.contextPath }/help/list.do">
						<button type="button" class="btn btn-outline-secondary btn-sm">목록으로
						</button>
					</a> <a href="${pageContext.servletContext.contextPath }/main/index.do">
						<button type="button" class="btn btn-outline-secondary btn-sm">메인으로
						</button>
					</a>
				</div>
				<br />
			</div>
		</div>
	</div>
</form>
<script>
	$("#inputfile1").on("change", function() {
		var f = new FileReader();
		f.onload = function(e) {
			$("#preview1").attr("src", e.target.result);
		}
		f.readAsDataURL(this.files[0]);
	});

	$("#inputfile2").on("change", function() {
		var f = new FileReader();
		f.onload = function(e) {
			$("#preview2").attr("src", e.target.result);
		}
		f.readAsDataURL(this.files[0]);
	});

	var writeOn = function() {
		if (document.getElementById("title").value != ""
				&& document.getElementById("content").value != "") {
			window.alert("작성 완료되었습니다.");

		} else {
			window.alert("빠짐없이 작성해주세요.");
			window.location.reload(true);
		}
	}
</script>