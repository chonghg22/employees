<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "gd.emp.Employees" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import= "java.sql.*" %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmployeesList</title>

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
	//1 페이지부터 시작
	System.out.println("1번:" + currentPage);
	//디버깅
	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
		//"currentPage"의 값이 null이 아니라면 int로 변환하여 currentPage값에 대입
	System.out.println("2번:" + currentPage);
	//디버깅
	
	int rowPerPage = 5;
	//한 페이지에 나타내는 항목의 수
	System.out.println("3번:" + rowPerPage);
	//디버깅
	
	int beginRow = (currentPage - 1) * rowPerPage;
	//다음 페이지로 넘어가는 항목의 수
	System.out.println("4번:" + beginRow);
	//디버깅
	
	Class.forName("org.mariadb.jdbc.Driver");
	//프로그램 사용 접근
	
	Connection conn = null;
	System.out.println("5번:" + conn);
	//디버깅
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees","root","java1234");
	//Mariadb와 연결했다는 정보/ 웹 주소를 접근할때 사용하는 프롭토콜 jdbc:mariadb를 뜻함
	
	//현재 페이지의 employees 테이블 작성
	ArrayList<Employees> list = new ArrayList<Employees>();
	//배열 선언
	PreparedStatement stmt1 = null;
	System.out.println("6번:" + stmt1);
	//디버깅
	ResultSet rs1 = null;
	System.out.println("7번:" + rs1);
	//디버깅
	stmt1 = conn.prepareStatement("select * from employees order by emp_no asc limit ?,?");
	//쿼리문 : employees 테이블에 데이터를 불러와서 순서대로 기입
	stmt1.setInt(1, beginRow);
	//limit 값 ?,?중 첫번째 ?의 값
	stmt1.setInt(2, rowPerPage);
	//limit 값 ?,?중 두번째 ?의 값
	rs1 = stmt1.executeQuery();
	// rs의 내용을 ->ArrayList<Departments> list 기입


	while (rs1.next()) { //쿼리에 값이 남아있으면 끝까지 실행한다.
		Employees e = new Employees();
		e.empNo = rs1.getInt("emp_no");
		e.birthDate = rs1.getString("birth_date");
		e.firstName = rs1.getString("first_name");
		e.lastName = rs1.getString("last_name");
		e.gender = rs1.getString("gender");
		e.hireDate = rs1.getString("hire_date");
		list.add(e);
		//리스트에 e를 추가한다.
		
	}
	//3.employees 테이블 전체 행의 수
	int lastPage = 0;
	System.out.println("8번:" + lastPage);
	//디버깅
	int totalRow = 0;
	System.out.println("9번:" + totalRow);
	//디버깅
	PreparedStatement stmt2 = null;
	System.out.println("10번:" + stmt2);
	//디버깅
	ResultSet rs2 = null;
	System.out.println("11번:" + rs2);
	//디버깅
	stmt2 = conn.prepareStatement("select count(*) from employees");
	//데이터의 갯수를 구함
	rs2 = stmt2.executeQuery();
	//rs2의 내용을 list에 저장
	if(rs2.next()) { //rs2의 값이 끝까지 가면 카운트의 값을 totalRow에 저장한다.
		totalRow = rs2.getInt("count(*)");
		
	}
	lastPage = totalRow / rowPerPage;
	if (totalRow % rowPerPage !=0) {//totalRow % rowPerPage 값이 0이 아니라면
		lastPage +=1; // 마지막페이지는 1씩 늘어난다.
	}
%>
	<div>
		<jsp:include page = "/inc/mainmenu.jsp"></jsp:include>
		<!-- 액션코드 -->
	</div>
	<h1>EmployeesList</h1>
	<table class = "table table-bordered bg-secondary">
	<thead>
		<tr>
			<th>empNo</th>
			<th>birthDate</th>
			<th>firstName</th>
			<th>lastName</th>
			<th>gender</th>
			<th>hireDate</th>
			<th>Update</th>
		</tr>
	</thead>
	<tbody>
	<%
		for (Employees e : list) {
	%>
	<tr>
		<td><%=e.empNo %></td>
		<td><%=e.birthDate %></td>
		<td><%=e.firstName %></td>
		<td><%=e.lastName %></td>
		<td><%=e.gender %></td>
		<td><%=e.hireDate%></td>
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
	<a class="page-link" href="<%=request.getContextPath()%>/employees/employeesList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
	</li>
	<%
		}
	if (currentPage < lastPage) {
	%>
	<li class="page-item">
	<a class="page-link" href="<%=request.getContextPath()%>/employees/employeesList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
	</li><%
		}
	%>
	</ul>
	
	
</body>
</html>