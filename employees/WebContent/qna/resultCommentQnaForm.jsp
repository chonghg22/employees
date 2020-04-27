<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "gd.emp.QnaComment" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

</head>
<body>
<%
//1. 서버와 연동하기
Class.forName("org.mariadb.jdbc.Driver");

		PreparedStatement stmt = null;

		Connection conn = null;

		ResultSet rs = null;
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
	
		stmt = conn.prepareStatement("select * from qna_comment");
		
		rs = stmt.executeQuery(); 
		
		ArrayList<QnaComment> list = new ArrayList<QnaComment>();
		while (rs.next()) {
			QnaComment q = new QnaComment();
			q.commentNo = rs.getInt("comment_no");
			q.qnaNo = rs.getInt("qna_no");
			q.comment = rs.getString("comment");
			q.commentDate = rs.getString("comment_date");
			q.commentPw = rs.getString("comment_pw");
			list.add(q);
		}
//2. 결과값 받아요기
//3. 결과값 리스트 만들기
//4. 리스트로 돌아가는 창 만들기

%>
	<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
		<!-- 액션코드 -->
	<h1>QnA result list <a href= "<%=request.getContextPath()%>/qna/qnaList.jsp" class="btn btn-primary " role="button" >List이동</a></h1>	
	
	<!-- 부서 입력 버튼 -->

	<table class = "table table-bordered bg-secondary">
		<thead>
		
			<tr>
				<th>commentNo</th>
				<th>qnaNo</th>
				<th>comment</th>
				<th>commentDate</th>
				<th>commentPw</th>
			</tr>
		
		</thead>
		<tbody>
			<%
				for (QnaComment q : list) {
			%>
			<tr>
				<td><%=q.commentNo%></td>
				<td><%=q.qnaNo%></td>
				<td><%=q.comment%></td>
				<td><%=q.commentDate%></td>
				<td><%=q.commentPw%></td>
			</tr>
		
			<%
				}
			%>
		</tbody>
	</table>

	<ul class="pagination">


	</ul>
</body>
</html>