<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gd.emp.Departments"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DepartmentList</title>
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
	//1. 페이지 변수값 선언.
	int currentPage = 1;
	//보통 0부터 시작하는데 페이지는 1부터 시작
	System.out.println(currentPage + "/3/");
	
	//디버깅
	if (request.getParameter("currentPage") != null) {
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	//"currentPage"의 값이 null이 아니라면 int로 변환하여 currentPage값에 대입
	System.out.println(currentPage + "/4/");
	//디버깅
		
	int rowPerPage = 20;
	//한 페이지에 나타내는 항목의 수
	System.out.println(rowPerPage + "/5/");
		
	int beginRow = (currentPage - 1) * rowPerPage;
	//다음 페이지로 넘어가는 항목의 수 
	System.out.println(beginRow + "/6/");
	//디버깅
		
	//2.0 database
	Class.forName("org.mariadb.jdbc.Driver");
	// 프로그램 사용 접근
		
	Connection conn = null;
	//conn의 값이 들어있을 경우 중복으로 기입하면 충돌이 일어날 수 있으므로 null 지정하여 변수 데이터 제거
	System.out.println(conn + "/7/");
	
	PreparedStatement stmt1 = null;
	System.out.println(stmt1 + "/8/");	
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
	//Mariadb와 연결했다는 정보/웹 주소를 접근할때 사용하는 프롭토콜 jdbc:mariadb를 뜻함 
		
	//2.현재 페이지의 departments 테이블  작성
	ResultSet rs1 = null;
	System.out.println("7번:" + rs1);
	stmt1 = conn.prepareStatement("select * from departments order by dept_no asc limit ?,?");
	//쿼리문 : departments테이블에 데이터 (beginRow, rowPerPage)를 불러와서 번호순서대로 ?부터 ?까지 나열하시오
	stmt1.setInt(1, beginRow);
	//limit 값 ?,?중 첫번째 ?의 값
	stmt1.setInt(2, rowPerPage);
	//limit 값 ?,?중 두번째 ?의 값
	rs1 = stmt1.executeQuery();
	// rs의 내용을 ->ArrayList<Departments> list 기입
	ArrayList<Departments> list = new ArrayList<Departments>();
	//배열을 선언 
	while (rs1.next()) { //쿼리에 값이 남아있으면 끝까지 실행한다.
	Departments d = new Departments(); 
	d.deptNo = rs1.getString("dept_no");
	d.deptName = rs1.getString("dept_name");
	list.add(d);//리스트에 d를 추가한다.		
	}
	//3. departments 테이블 전체행의 수 
	int lastPage = 0;
	System.out.println("8번:" + lastPage);
	int totalRow = 0;
	System.out.println("9번:" + totalRow);
	PreparedStatement stmt2 = null;
	System.out.println("10번:" + stmt2);
	ResultSet rs2 = null;
	System.out.println("11번:" + rs2);
	stmt2 = conn.prepareStatement("select count(*) from departments");
	//데이터의 갯수를 구함
	rs2 = stmt2.executeQuery();
	//rs2의 내용을 list에 저장 
	if (rs2.next()) { //rs2의 값이 끝까지 가면 카운트의 값을 totalRow에 저장한다.
		totalRow = rs2.getInt("count(*)");
	}
	lastPage = totalRow / rowPerPage;
	if (totalRow % rowPerPage != 0) { //totalRow % rowPerPage 값이 0이 아니라면 
		lastPage += 1; // 마지막페이지에 1씩 더한다.
	}
%>

		<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
		<!-- 액션코드 -->
	<h1>DepartmentList <a href= "<%=request.getContextPath()%>/department/insertDepartmentsForm.jsp" class="btn btn-primary " role="button" >부서추가</a></h1>	
	
	<!-- 부서 입력 버튼 -->

	<table class = "table table-bordered bg-secondary">
		<thead>
		
			<tr>
				<th>deptNo</th>
				<th>deptName</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
		
		</thead>
		<tbody>
			<%
				for (Departments d : list) {
			%>
			<tr>
				<td><%=d.deptNo%></td>
				<td><%=d.deptName%></td>
				<td><a class = "btn btn-primary" href = "<%=request.getContextPath()%>/department/updateDepartmentsForm.jsp?deptNo=<%=d.deptNo%>">수정</a></td>
				<td><a class = "btn btn-primary" href = "<%=request.getContextPath()%>/department/deleteDepartmentsAction.jsp?deptNo=<%=d.deptNo%>">삭제</a></td>
			</tr>
		
			<%
				}
			%>
		</tbody>
	</table>

	<ul class="pagination">
	<%
		if (currentPage > 1) {
	%>
	<li class="page-item">
	<a class="page-link" href="<%=request.getContextPath()%>/department/departmentList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
	</li>
	<%
		}

		if (currentPage < lastPage) {
	%>
	<li class="page-item">
	<a class="page-link" href="<%=request.getContextPath()%>/department/departmentList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
	</li>
	<%
		}
	%>
	</ul>
</body>
</html>