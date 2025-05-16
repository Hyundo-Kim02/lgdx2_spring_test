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
			<div class="panel-heading">Board Update Page</div>
			<div class="panel-body">
				<!-- 게시글 수정 페이지 -->
				<%
				// Model 저장소는 request 안에 포함되어 있다
				// request.getAttribute("키값") : 데이터 불러오기
				// Object 타입에서 원하는 하위 타입으로 되돌리기 => 다운캐스팅!
				Board contents = (Board) request.getAttribute("vo");
				%>
				<!-- 
					게시글 수정 기능을 작성하라
					BoardController에 Post 방식의 요청을 받는 boardUpdate.do를 만들어
					idx 값과 일치하는 게시글 데이터(제목, 내용, 작성자)를 수정하라 그리고
					수정 후, 수정된 화면이 출력되는 상세보기 페이지로 이동하기
					힌트 : boardInsert.do를 참고할 것
				-->
				<form action="boardUpdate.do" method="post">
					<%-- hidden 속성을 이용해 화면에 보이진 않게, 게시물의 idx값 전송 --%>
					<input type="hidden" name="idx" value="<%= contents.getIdx() %>">
					<table class="table table-bordered table-hover">
						<tr>
							<td><strong>제목</strong></td>
							<td><input value="<%= contents.getTitle() %>" name="title" type="text" class="form-control" placeholder="제목을 입력하세요."></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="contents" rows="7" cols="" class="form-control"
								placeholder="본문 내용을 입력하세요."><%= contents.getContents() %></textarea></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input value="<%= contents.getWriter() %>" name="writer" type="text" class="form-control" placeholder="작성자를 입력하세요."></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<a href="boardList.do"><button type="button" class="btn btn-info">수정취소</button></a>
								<button type="reset" class="btn btn-danger">초기화</button>
								<button type="submit" class="btn btn-success">수정완료</button>
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