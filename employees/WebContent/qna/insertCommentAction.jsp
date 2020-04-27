<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
System.out.println(qnaNo + "1번값");
String comment = request.getParameter("comment");

String commentPw = request.getParameter("commentPw");
Class.forName("org.mariadb.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");

PreparedStatement stmt = conn.prepareStatement("select max(comment_no) from qna_comment");
ResultSet rs1 = stmt.executeQuery();
int commentNo = 1;
if(rs1.next()){
	commentNo = rs1.getInt("max(comment_no)") + 1 ;
}




System.out.println(conn);

PreparedStatement stmt1 = conn.prepareStatement("insert into qna_comment(comment_no, qna_no, comment, comment_date, comment_pw) value (?,?,?,now(),?)");


System.out.println(stmt1);

stmt1.setInt(1, commentNo);
stmt1.setInt(2, qnaNo);
stmt1.setString(3, comment);
stmt1.setString(4, commentPw);

ResultSet rs = stmt1.executeQuery();

System.out.println(rs);

response.sendRedirect("./qnaList.jsp");

%>


</body>
</html>