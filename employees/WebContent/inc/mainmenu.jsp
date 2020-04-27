<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<div>
	<nav class="navbar navbar-expand-sm bg-secondary  navbar-dark">
	<ul class="navbar-nav">
	<li class="nav-item active">
		<a class="navbar-brand" href = "<%=request.getContextPath() %>/index.jsp"><i class='fas fa-home'></i>Home</a>
	</li>	
	<li class="nav-item active">
		<a class="navbar-brand" href = "<%=request.getContextPath() %>/about.jsp"><i class='fas fa-male'></i>소개</a>
	</li>
	<li class="nav-item active">
		<a class="navbar-brand" href = "<%=request.getContextPath() %>/department/departmentList.jsp"><i class='fas fa-search'></i>Department</a>
	</li>
	<li class="nav-item active">
		<a class="navbar-brand" href = "<%=request.getContextPath() %>/employees/employeesList.jsp"><i class='fas fa-search'></i>Employees</a>
	</li>
	<li class="nav-item active">
		<a class="navbar-brand" href = "<%=request.getContextPath() %>/deptEmp/deptEmpList.jsp"><i class='fas fa-search'></i>DeptEmp</a>
	</li>
	<li class="nav-item active">
		<a class="navbar-brand" href = "<%=request.getContextPath() %>/deptManager/deptManagerList.jsp"><i class='fas fa-search'></i>DeptManager</a>
	</li>
	<li class="nav-item active">
		<a class="navbar-brand" href = "<%=request.getContextPath() %>/salaries/salariesList.jsp"><i class='fas fa-search'></i>Salaries</a>
	</li>
	<li class="nav-item active">
		<a class="navbar-brand" href = "<%=request.getContextPath() %>/titles/titlesList.jsp"><i class='fas fa-search'></i>Titles</a>
	</li>
	<li class="nav-item active">
		<a class="navbar-brand" href = "<%=request.getContextPath() %>/qna/qnaList.jsp"><i class='fas fa-search'></i>QnA</a>
	</li>
	</ul>
	</nav>
		
	</div>

</body>
</html>