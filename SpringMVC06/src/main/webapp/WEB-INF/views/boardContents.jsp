<%@page import="com.lgdx.entity.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- BootStrap의 Panels, Tables 템플릿 사용 -->
	<div class="container">
		<h2>Spring MVC 06</h2>
		<div class="panel panel-primary">
			<div class="panel-heading">Board Contents Page</div>
			<div class="panel-body">
				<!-- 상세보기 페이지 -->
				<%
				// Model 저장소는 request 안에 포함되어 있다
				// request.getAttribute("키값") : 데이터 불러오기
				// Object 타입에서 원하는 하위 타입으로 되돌리기 => 다운캐스팅!
				Board contents = (Board) request.getAttribute("vo");
				%>
				<table class="table table-bordered table-hover">
					<tr>
						<td><strong>제목</strong></td>
						<td><%= contents.getTitle() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%= contents.getWriter() %></td>
					</tr>
					<tr>
						<td>작성날짜</td>
						<td><%= contents.getIndate() %></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td><%= contents.getCount() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<!-- 엔터(\n)를 br태그로 변환 -->
						<td><%= contents.getContents().replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<a href="boardList.do"><button
								type="button" class="btn btn-info">돌아가기</button></a>
							<!-- 
							BoardController에 boardDelete.do 요청 시,
							해당 idx 값과 일치하는 게시글을 삭제하고 boardList.jsp 페이지로 이동
							힌트: 상세보기를 잘 살펴보면 매우 흡사하다
							-->
							<a href="boardDelete.do?idx=<%= contents.getIdx() %>"><button 
								type="button" class="btn btn-danger">삭제</button></a>
							<!-- 게시글 수정(boardUpdate.do) 페이지 이동
							기존 게시글의 데이터를 수정 페이지로 불러오기 위해 idx값 전송 -->
							<a href="boardUpdate.do?idx=<%= contents.getIdx() %>"><button
								type="button" class="btn btn-success">수정</button></a>
						</td>
					</tr>
				</table>
			</div>
			<div class="panel-footer">LG DX - 김현도</div>
		</div>
	</div>
</body>
</html>