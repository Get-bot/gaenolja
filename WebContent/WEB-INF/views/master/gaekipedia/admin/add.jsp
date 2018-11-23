<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<form method="post" enctype="multipart/form-data"
	action="${pageContext.servletContext.contextPath }/admin/dogBoard/add.do"
	id="formAction">
	<div class="container d-flex justify-content-center">
	<div class="my-3 p-3 bg-white rounded shadow-sm border border-warning d-flex justify-content-center">
		<div class="col-lg-8  ">
			<div class="row">
			<div style="text-align: center">
				<br />
				<h3>
					<b>강아지 정보 추가</b>
				</h3>
				<br />
				<hr class="mb-4">
				<br />
			</div>
			</div>
			<div class="row">
				<div class="col-md-6 mb-3">
					<label for="lastName">이름 </label> <input type="text"
						class="form-control" id="name" name="name" required>
				</div>
				<div class="col-md-6 mb-3">
					<label for="lastName">영어이름</label> <input type="text"
						class="form-control" id="engname" name="engname" required>
				</div>
				
				<div class="form-group row">
						<label class="col-sm-4 col-form-label">강아지 크기</label>
						<div class="col-sm-6">
							<select class="custom-select" required name="type" style="width:300px;">
						      <option value="">크기를 선택해 주세요</option>
						      <option value="1">대형견</option>
						      <option value="2">중형견</option>
						      <option value="3">소형견</option>						  
						    </select>
															
						</div>			
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 mb-3">
					<label for="lastName">설명</label> <textarea 
						style="height: 300px; overflow-y: scroll;" class="form-control"
						id="info" name="info" required></textarea>
				</div>			
				<div class="col-6">
							<img src="" id="preview" style="weidth: 300px; height: 300px; "
								onchange="putImage(this)" class="rounded img-fluid" />
				<label for="lastName">사진 첨부</label>
					<div class="custom-file ">
						<input type="file" class="custom-file-input"
							aria-describedby="inputGroupFileAddon03" id="img" name="img"
							accept="image/*" required> <label
							class="custom-file-label" for="inputGroupFile03"> 사진을
							올려주세요</label>
					</div>
				</div>
			</div>
			
			<div class="row justify-content-center">
			<button type="submit" class="btn btn-primary btn-lg btn-block">강아지 등록!</button>			
			</div>
		</div>
		
	</div>	
	</div>
	
</form>



<script>
	$("#img").on("change", function() {
		var f = new FileReader();
		f.onload = function(e) {
			$("#preview").attr("src", e.target.result);
		}
		f.readAsDataURL(this.files[0]);
	});
</script>