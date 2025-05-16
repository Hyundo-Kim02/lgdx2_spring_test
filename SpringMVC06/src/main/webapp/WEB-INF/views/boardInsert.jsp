<%@page import="com.lgdx.entity.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- BootStrap의 Panels, Tables 템플릿 사용 -->
	<div class="container">
		<h2>Spring MVC 06</h2>
		<div class="panel panel-primary">
			<div class="panel-heading">Board Insert Page</div>
			<div class="panel-body">
				<!-- 글쓰기 페이지 -->
				<!--
					서버로 데이터를 보내기위한 3가지 조건
					1. name = 전송할 데이터를 구분하기 위한 이름
					2. action = 데이터를 전송할 곳, 서버의 주소
					3. submit = 데이터를 전송하는 시점
					
					서버로 요청하는 방식 2가지
					1. GET (Query String) :
						- 요청할 때 전달할 데이터를 뒤에 붙여서 전송하는 방식
						- boardList.do?title=오늘쌀국구먹음&writer=박명관&contents=정말맛있음
						- 모든 요청 방식은 따로 변경하지 않는 한 기본 요청방식은 GET 방식이다
						- 장점 : 속도가 빠르다, URL 데이터 공유가 가능하다
						- 단점 : 보안에 취약함, 보내는 데이터에 제한이 있다
						
					2. POST
						- 요청할 떄 전달할 데이터를 패킷 바디 안에 전송하는 방식
						- 전송하는 데이터를 외부에서 확인이 불가하다
						- 장점 : 보안에 강략하다, 다량의 데이터를 보낼 수 있다
						- 단점 : 상대적으로 느리다, 데이터를 공유할 수 있다					
				-->
				<form action="boardInsert.do" method="post">
					<table class="table table-bordered table-hover">
						<tr>
							<td><strong>제목</strong></td>
							<td><input name="title" type="text" class="form-control" placeholder="제목을 입력하세요."></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="contents" rows="7" cols="" class="form-control" placeholder="본문 내용을 입력하세요."></textarea></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input name="writer" type="text" class="form-control" placeholder="작성자를 입력하세요."></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<a href="boardList.do"><button type="button" class="btn btn-info">돌아가기</button></a>
								<button type="reset" class="btn btn-danger">초기화</button>
								<button type="submit" class="btn btn-success">작성완료</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="panel-footer">LG DX - 김현도</div>
	  	</div>
	</div>
</body>
</html>