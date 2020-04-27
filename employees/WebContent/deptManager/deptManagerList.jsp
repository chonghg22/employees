<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "gd.emp.DeptManager" %> 
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deptManagerList</title>
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

	if (request.getParameter("currentPage") !=null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 5;
	
	int beginRow = (currentPage -1) * rowPerPage;
	
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	Connection conn = null;
	
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees","root","java1234");
	
	PreparedStatement stmt1 = null;
	
	ResultSet rs1 = null;
	
	stmt1 = conn.prepareStatement("select * from dept_manager order by dept_no asc limit ?,? ");
	
	stmt1.setInt(1, beginRow);
	stmt1.setInt(2, rowPerPage);
	rs1 = stmt1.executeQuery();
	
	ArrayList<DeptManager> list = new ArrayList<DeptManager>();
	
	while (rs1.next()){
		DeptManager a = new DeptManager();
		a.deptNo = rs1.getString("dept_no");
		a.empNo = rs1.getInt("emp_no");
		a.fromDate = rs1.getString("from_date");
		a.toDate = rs1.getString("to_date");
		
		list.add(a);
			}
		int lastPage = 0;
		int totalRow = 0;
		PreparedStatement stmt2 = null;
		ResultSet rs2 = null;
		stmt2 = conn.prepareStatement("select count(*) from dept_manager");
		rs2 = stmt2.executeQuery();
		
		if(rs2.next()) {
			totalRow = rs2.getInt("count(*)");
		}
		lastPage = totalRow / rowPerPage;
		if (totalRow % rowPerPage !=0) {
			lastPage += 1;
		}
		%>
		<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
		<h1>DeptManagerList</h1>
		<table class = "table table-bordered bg-secondary">
			<thead>
				<tr>
					<th>deptNo</th>
					<th>empNo</th>
					<th>fromDate</th>
					<th>toDate</th>
					<th>Update</th>
				</tr>
			</thead>
			<tbody>
			<%
				for (DeptManager a : list) {
			%>
			<tr>
				<td><%=a.deptNo %></td>
				<td><%=a.empNo %></td>
				<td><%=a.fromDate %></td>
				<td><%=a.toDate %></td>
				<td><a class = "btn btn-primary" href = "">수정</a></td>	
			</tr>
			<%
				}
			%>
			</tbody>
			</table>
			<ul class="pagination">
	<%
		if(currentPage>1){
	%>
	<li class="page-item">
	<a class="page-link" href="<%=request.getContextPath() %>/deptManager/deptManagerList.jsp?currentPage=<%=currentPage -1 %>">이전</a>
	</li>
	<%
		}
		if(currentPage < lastPage) {
		
	%>
	<li class="page-item">
	<a class="page-link" href="<%=request.getContextPath() %>/deptManager/deptManagerList.jsp?currentPage=<%=currentPage +1 %>">다음</a>
	</li>
	<%
		}
	%>
</ul>
</body>

</html>