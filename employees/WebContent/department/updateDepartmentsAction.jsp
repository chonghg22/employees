<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>

<%
String deptNo = request.getParameter("deptNo");

System.out.println(deptNo);

String deptName =request.getParameter("deptName");

System.out.println(deptName);

Class.forName("org.mariadb.jdbc.Driver");

Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees","root","java1234");

PreparedStatement stmt = conn.prepareStatement("update departments set dept_name=? where dept_no=?");
stmt.setString(1, deptName);
stmt.setString(2, deptNo);
stmt.executeQuery();

response.sendRedirect("./departmentList.jsp");

%>