<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
<a href="<%=request.getContextPath() %>/qna/updateQnaForm.jsp"></a>
<a href="<%=request.getContextPath() %>/qna/deleteQnaForm.jsp"></a>
</div>
<%
int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
%>
<form method = "post" action = "<%=request.getContextPath()%>/qna/commentQnaAction.jsp">
<input type = "hidden" name="qnaNo" value="<%=qnaNo%>">
<div>
	<div>
	<textarea class= "form-control" rows = "3" id="comment" name = "comment"></textarea> 
	</div>
	
	<div>
	<input type = "password" id = "comment_pw" value = "comment_pw">
	</div>
	
	<button type="submit" class="">댓글입력</button>
</div>
</form>
