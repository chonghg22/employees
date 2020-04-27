<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gd.emp.DeptEmp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeptEmpList</title>
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
		int currentPage = 1;
		System.out.println(currentPage);
	
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		System.out.println(currentPage);
	
		int rowPerPage = 5;
		System.out.println(rowPerPage);
	
		int beginRow = (currentPage - 1) * rowPerPage;
		System.out.println(beginRow);
		
		
		Class.forName("org.mariadb.jdbc.Driver");

		Connection conn = null;

		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
		//Mariadb와 연결했다는 정보/웹 주소를 접근할때 사용하는 프롭토콜 jdbc:mariadb를 뜻함 	
		PreparedStatement stmt1 = null;
		//db에 커리를 보내기 위해서 필요한 변수 값
		//연결은 conn을 통해서 연결
		System.out.println(stmt1);
		ResultSet rs1 = null;
		System.out.println(rs1);
	

		stmt1 = conn.prepareStatement("select * from dept_emp order by emp_no asc limit ?,?");

		stmt1.setInt(1, beginRow);
		stmt1.setInt(2, rowPerPage);
		rs1 = stmt1.executeQuery();

		ArrayList<DeptEmp> list = new ArrayList<DeptEmp>();

		while (rs1.next()) {
			DeptEmp d = new DeptEmp();
			d.empNo = rs1.getInt("emp_no");
			d.deptNo = rs1.getString("dept_no");
			d.fromDate = rs1.getString("from_date");
			d.toDate = rs1.getString("to_date");
			list.add(d);

		}
		int lastPage = 0;
		System.out.println(lastPage);
		int totalRow = 0;
		System.out.println(totalRow);
		PreparedStatement stmt2 = null;
		System.out.println(stmt2);
		ResultSet rs2 = null;
		System.out.println(rs2);
		stmt2 = conn.prepareStatement("select count(*) from dept_emp");
		rs2 = stmt2.executeQuery();

		if (rs2.next()) {
			totalRow = rs2.getInt("count(*)");
		}
		lastPage = totalRow / rowPerPage;
		if (totalRow % rowPerPage != 0) {
			lastPage += 1;
		}
	%>
	<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
	<h1>DeptEmpList</h1>
	<table class = "table table-bordered bg-secondary">
		<thead>
			<tr>
				<th>empNo</th>
				<th>deptNo</th>
				<th>fromDate</th>
				<th>toDate</th>
				<th>Update</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (DeptEmp e : list) {
			%>
			<tr>
				<td><%=e.empNo%></td>
				<td><%=e.deptNo%></td>
				<td><%=e.fromDate%></td>
				<td><%=e.toDate%></td>
				<td><a class = "btn btn-primary" href = "">수정</a></td>		
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<ul class="pagination">
	<%
		if(currentPage >1)	{
	%>
	<li class="page-item">
	<a class="page-link" href="<%=request.getContextPath()%>/deptEmp/deptEmpList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
	</li>
	<%
		}
	if (currentPage < lastPage) {
	%>
	<li class="page-item">
	<a class="page-link" href="<%=request.getContextPath()%>/deptEmp/deptEmpList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
	</li><%
		}
	%>
	</ul>
	
	
</body>
</html>