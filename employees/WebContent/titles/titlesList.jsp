<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "gd.emp.Titles" %> 
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TitlesList</title>
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

	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
	}
	int rowPerPage = 5;
	
	int beginRow = (currentPage -1)*rowPerPage;

	Class.forName("org.mariadb.jdbc.Driver");
	
	Connection conn = null;
	
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees","root","java1234");
	
	PreparedStatement stmt1 = null;
	
	ResultSet rs1 = null;
	
	stmt1 = conn.prepareStatement("select emp_no, title, from_date, to_date from titles order by emp_no asc limit ?,? ");
	
	stmt1.setInt(1, beginRow);
	stmt1.setInt(2, rowPerPage);
	rs1= stmt1.executeQuery();
	
	ArrayList<Titles> list = new ArrayList<Titles>();
	
	while (rs1.next()) {
		Titles t = new Titles();
		t.empNo = rs1.getInt("emp_no");
		t.title = rs1.getString("title");
		t.fromDate = rs1.getString("from_date");
		t.toDate = rs1.getString("to_date");
		
		list.add(t);
	}
	int lastPage = 0;
	int totalRow = 0;
	PreparedStatement stmt2 = null;
	ResultSet rs2 = null;
	stmt2 = conn.prepareStatement("select count(*) from titles");
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
		<h1>TitlesList</h1>
		<table class ="table table-bordered bg-secondary">
			<thead>
				<tr>
					<th>empNo</th>
					<th>title</th>
					<th>fromDate</th>
					<th>toDate</th>
					<th>Update</th>
				</tr>
			</thead>
			<tbody>
			<%
				for (Titles t : list) {
			%>
			<tr>
				<td><%=t.empNo %></td>
				<td><%=t.title %></td>
				<td><%=t.fromDate %></td>
				<td><%=t.toDate %></td>
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
	<a class="page-link" href="<%=request.getContextPath() %>/titles/titlesList.jsp?currentPage=<%=currentPage -1 %>">이전</a>
	</li>
	<%
		}
		if(currentPage < lastPage) {
		
	%>
	<li class="page-item">
	<a class="page-link" href="<%=request.getContextPath() %>/titles/titlesList.jsp?currentPage=<%=currentPage +1 %>">다음</a>
	</li>
	<%
		}
	%>
</ul>
</body>

</html>