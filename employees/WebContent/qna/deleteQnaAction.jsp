<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "gd.emp.Qna" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%

	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));

	System.out.println(qnaNo + "<--1.qnaNo");

	String qnaPw = request.getParameter("qnaPw");
	
	System.out.println(qnaPw + "<--2.qnaPw");
	


Class.forName("org.mariadb.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");

System.out.println(conn);

PreparedStatement stmt1 = conn.prepareStatement("delete from qna where qna_no=? and qna_pw=?");

stmt1.setInt(1,qnaNo);
stmt1.setString(2, qnaPw);

int row = stmt1.executeUpdate();
if(row == 0) {
	response.sendRedirect(request.getContextPath() + "/qna/deleteQnaForm.jsp?QnaNo=" + qnaNo);
} else {response.sendRedirect(request.getContextPath() + "/qna/qnaList.jsp");
	
}

	
%>