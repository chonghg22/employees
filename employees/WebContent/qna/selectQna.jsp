<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "gd.emp.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "번값dlswl");
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
	
	System.out.println(conn);
	
	PreparedStatement stmt1 = conn.prepareStatement("select qna_no, qna_title, qna_content, qna_user, qna_date from qna where qna_no limit ?");
	
	stmt1.setInt(1,qnaNo);
	System.out.println(stmt1);
	

	
	ResultSet rs = stmt1.executeQuery();
	
	System.out.println(rs);
	Qna qna = new Qna();
	
	if(rs.next()) {
			qna.qnaNo = rs.getInt("qna_no");
			qna.qnaTitle = rs.getString("qna_title");
			qna.qnaContent = rs.getString("qna_content");
			qna.qnaUser = rs.getString("qna_user");
			qna.qnaDate = rs.getString("qna_date");
			
	}
	
		
%>
	
	<div class = "container-fluid">
	<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
	<table class = "table table-bordered bg-secondary">
	<h1>QnASelect</h1>
	<tr>
	<td>qna_no</td>	
	<td>qna_title</td>
	<td>qna_content</td>
	<td>qna_user</td>	
	<td>qna_date</td>
	</tr>
	
	<tr>
	<td><%=qna.qnaNo%></td>	
	<td><%=qna.qnaTitle %></td>
	<td><%=qna.qnaContent %></td>
	<td><%=qna.qnaUser %></td>
	<td><%=qna.qnaDate.substring(0,10) %></td>	
	</tr>
	
	
	</table>
	<div>
	<a class = "btn btn-primary" href = "<%=request.getContextPath()%>/qna/qnaList.jsp">목록</a>
	<a class = "btn btn-primary" href = "<%=request.getContextPath()%>/qna/updateQnaForm.jsp">수정</a>
	<a class = "btn btn-primary" href = "<%=request.getContextPath()%>/qna/deleteQnaForm.jsp?qnaNo=<%=qna.qnaNo%>">삭제</a>
	</div>
	
	<br>
	
	<form method= "post" action = "<%=request.getContextPath()%>/qna/insertCommentAction.jsp">
	<input type = "hidden" name = "qnaNo" value = "<%=qna.qnaNo %>">
	<div class = "form-group">
		<label>댓글</label>
		<textarea class = "form-group" row="5" id = "comment" name="comment"></textarea>
	</div>
	<div class = "form-group">
		<label>비밀번호</label>
		<input type = "password" class = "form-group" row = "5" id = "commentPw" name = "commentPw">
	</div>
	<button type = "submit" name = "submit" class = "btn btn-primary">댓글입력</button>	
	</form>


</body>
</html>