<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateDepartmentsForm</title>
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
	String deptNo = request.getParameter("deptNo");

	System.out.println(deptNo + "<--1");

	

	
	Class.forName("org.mariadb.jdbc.Driver");
	
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees","root","java1234");
	
	PreparedStatement stmt = conn.prepareStatement("select dept_no, dept_name from departments where dept_no=?");
	stmt.setString(1, deptNo);
	
	ResultSet rs = stmt.executeQuery();
	
	int inputNo = 0;
	if(rs.next()) {
%>
	<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
	<h1>Department수정</h1>
	<form method = "post" action = "<%=request.getContextPath()%>/department/updateDepartmentsAction.jsp?deptNo=<%=deptNo%>">
	<table class = "table table-bordered bg-secondary">
	<div>
		<label>deptNo</label>
	</div>
	<div>
		<input type = "text" name = "deptNo" value = '<%=rs.getString("dept_no") %>'>
	</div>
	
	<div>
		<label>deptName</label>
	</div>
	<div>
		<input type = "text" name = "deptName">
	</div>
	<div>
	<button type = "submit" name = "submit">수정</button>
	</div>
	</table>
	</form>
<%
	}
%>

</body>
</html>