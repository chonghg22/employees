<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "gd.emp.Qna" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteQnAForm</title>
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
int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
System.out.println(qnaNo + "qna값.");
%>
<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
		<!-- 액션코드 -->
<div class = "container-fluid">

	<h1>Qna삭제</h1>
	<form method = "post" action = "<%=request.getContextPath()%>/qna/deleteQnaAction.jsp?qnaNo=<%=qnaNo %>" >
	
	<input type = "hidden" name = "qnaNo" value = "<%=qnaNo%>">
	<div class = "form-group">
	
	<label for="qnaPw">비밀번호</label>
	<input type = "password" name = "qnaPw" id = "qnaPw" value = "qnaPw">
	
	</div>
	<button type = "submit" name = "submit">전송</button>
	</form>
	
</div>
</body>
</html>