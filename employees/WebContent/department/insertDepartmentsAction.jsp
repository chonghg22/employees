<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gd.emp.Departments"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	

	//String deptName = request.getParameter("deptName");
	//dept no ?
	//dept no를 구하는 알고리즘 
	Class.forName("org.mariadb.jdbc.Driver");
	
	Connection conn = null;
	
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");

	PreparedStatement stmt = null;
	
	stmt = conn.prepareStatement("select dept_no from departments order by dept_no desc limit 0,1");

	ResultSet rs = null;
	
	rs = stmt.executeQuery();
	String deptNo = "";
	if(rs.next()) {
		deptNo = rs.getString("dept_no");
		
	}
	System.out.println(deptNo);
	
	
	String deptNo2 = deptNo.substring(1);
	//substring 몇번째부터 잘라주세요
	System.out.println(deptNo2);
	
	int deptNo3 = Integer.parseInt(deptNo2);
	
	System.out.println(deptNo3);
	
	int nextDeptNo = deptNo3+1;
	System.out.println(nextDeptNo);
	
	String nextDeptNo2 = "";
	
	if (nextDeptNo/100 > 0) {
		nextDeptNo2 = "d" + nextDeptNo;
		
	} else if (nextDeptNo/10 > 0) {
		nextDeptNo2 = "d0" + nextDeptNo;
		
	} else  {
		nextDeptNo2 = "d00" + nextDeptNo;
		
		System.out.println(nextDeptNo2);
	}
	
	//dept_name
	String deptName = request.getParameter("deptName");
	PreparedStatement stmt2 = conn.prepareStatement(
			"insert into departments(dept_no, dept_name) values(?,?)");
	stmt2.setString(1, nextDeptNo2);
	stmt2.setString(2, deptName);
	stmt2.executeUpdate();
	response.sendRedirect(request.getContextPath()+"/department/departmentList.jsp");
	
	
			
%>
</body>
</html>