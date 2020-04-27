<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<h1>QnA입력 폼</h1>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String msg = "";
	if (request.getParameter("ck") != null) {
		msg = "빈값이 있습니다.";
		}
%>

<div class = "container-fluid">
<h3>QnA 제목<small><%=msg %></small></h3>
<form method = "post" action="<%=request.getContextPath()%>/qna/insertqnaAction.jsp">
  <div class="form-group">
  <!-- Qna 제목 -->
    <label for="qnaTitle">QnA 제목:</label>
    <input type="text" class="form-control" name = "qnaTitle" id="qnaTitle">
  </div>
  
  <div class="form-group">

    <label for="qnaContent">내용:</label>
    <textarea class="form-control" rows = "5" name = "qnaContent" id="qnaContent"></textarea>
  </div>
  
  <div class="form-group">

    <label for="qnaUser">글쓴이:</label>
    <input type="text" class="form-control" name = "qnaUser" id="qnaUser">
  </div>
  
  <div class="form-group">
 
    <label for="qnaPw">비밀번호</label>
    <input type="text" class="form-control" name = "qnaPw" id="qnaPw">
  </div>
  
  <button type="submit" class="btn btn-primary">글입력</button>
 
</form>
</div>
</body>
</html>