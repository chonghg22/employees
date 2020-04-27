<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteDepartmentsAction</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String deptNo = request.getParameter("deptNo");
	
	System.out.println(deptNo);
	//서버연결
	Class.forName("org.mariadb.jdbc.Driver");
	
	//서버 접속
	Connection conn = null;
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees","root","java1234");
	//가져올 데이터 선택
	
	PreparedStatement stmt = conn.prepareStatement("delete from departments where dept_no=?");
	
	stmt.setString(1, deptNo);
	
	stmt.executeUpdate();
	
	response.sendRedirect("./departmentList.jsp");
	//선택된 데이터값 쿼리로 내보내기


%>
</body>
</html>