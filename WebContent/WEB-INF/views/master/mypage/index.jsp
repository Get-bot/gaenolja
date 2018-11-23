<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div style="float: left; margin-right: 20px; margin-left: 100px;">
	<img alt="이미지 안나오면 엑박" src="${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE }" style="width: 400px; height: 400px;">
</div>

<div style="float: right; width: 480px; margin-right: 100px;">
	<table class="table" >
		<thead>
			<tr>
				<th colspan="2" style="text-align: center;">내정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th style="text-align: center;">아이디</th>
				<td style="text-align: center;">${userInfo.ID }</td>
			</tr>
			<tr>
				<th style="text-align: center;">닉네임</th>
				<td style="text-align: center;">${userInfo.NICKNAME }</td>
			</tr>
		</tbody>
	</table>

	<table class="table">
		<thead>
			<tr>
				<th colspan="2" style="text-align: center;">강아지 정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th style="text-align: center;">개이름</th>
				<td style="text-align: center;">${userInfo.DOGNAME }</td>
			</tr>
			<tr>
				<th style="text-align: center;">개종류</th>
				<td style="text-align: center;">${userInfo.DOGTYPE }</td>
			</tr>
			<tr>
				<th style="text-align: center;">개성별</th>
				<td style="text-align: center;">${userInfo.DOGGENDER }</td>
			</tr>
		</tbody>
	</table>

	<table class="table">
		<thead>
			<tr>
				<th style="text-align: center;">하고싶은 말</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="text-align: center;">${userInfo.USERCOMMENT }</td>
			</tr>
		</tbody>
	</table>
</div>

<div>
	<div>
		<a href="${pageContext.servletContext.contextPath }/check.do?mode=memberInfo"><button style="margin-top: 20px;" type="button" class="form-control btn btn-outline-primary" >회원정보 수정</button></a>
	</div>
	<div>
		<a href="${pageContext.servletContext.contextPath }/check.do?mode=password"><button style="margin-top: 10px;" type="button" class="form-control btn btn-outline-primary" >비밀번호 수정</button></a>
	</div>
</div>
