<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gd.emp.Qna"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaList</title>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

</head>
<body>

	<h3>QnA List</h3>
<%
		String searchWord="";

		System.out.println(searchWord + "/1/");
		if(request.getParameter("searchWord") !=null){
			searchWord = request.getParameter("searchWord");
		}
		System.out.println(searchWord + "/2/");
		int currentPage = 1;
		System.out.println(currentPage + "/3/");

		if (request.getParameter("curentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int rowPerPage = 5;

		System.out.println(rowPerPage + "/4/");

		int beginRow = (currentPage - 1) * rowPerPage;

		System.out.println(beginRow +"/5/");

		Class.forName("org.mariadb.jdbc.Driver");

		
		//검색어 유무에 따른 동적쿼리
		Connection conn = null;
		
		PreparedStatement stmt1 = null;
		
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
		
		if(searchWord.equals("")) {
			
			
			stmt1 = conn.prepareStatement("select qna_no, qna_title, qna_user, qna_date from qna order by qna_no desc limit ?,?");
			stmt1.setInt(1, beginRow);
			stmt1.setInt(2, rowPerPage);
			}
		 else{		
			/*
			select qna_no, qna_title, qna_user, qna_date
			from qna
			where qna_title like ?
			order by qna_no desc
			limit ?,?
			*/			
			stmt1 = conn.prepareStatement("select qna_no, qna_title, qna_user, qna_date from qna where qna_title like? order by qna_no desc limit ?,?");
			stmt1.setString(1, "%"+searchWord+"%");
			stmt1.setInt(2, beginRow);
			stmt1.setInt(3, rowPerPage);			
		}
		
		
		ResultSet rs1 = stmt1.executeQuery();

		ArrayList<Qna> list = new ArrayList<Qna>();

		while (rs1.next()) {
			Qna qna = new Qna();
			qna.qnaNo = rs1.getInt("qna_no");
			qna.qnaTitle = rs1.getString("qna_title");
			qna.qnaUser = rs1.getString("qna_user");
			qna.qnaDate = rs1.getString("qna_date");
			list.add(qna);
			System.out.println(qna.qnaNo + "<---qnaNo");
		}

		int lastPage = 0;

		int totalRow = 0;

		PreparedStatement stmt2 = null;

		if(searchWord.equals("")) {
			stmt2 = conn.prepareStatement("select count* from qna");

		} else{stmt2 = conn.prepareStatement("select count* from qna");
				stmt2 = conn.prepareStatement("select count* from qna");
		}
			
		
		ResultSet rs2 = null;
		stmt2 = conn.prepareStatement("select count(*) from departments");

		rs2 = stmt2.executeQuery();

		if (rs2.next()) {
			totalRow = rs2.getInt("count(*)");
		}
		lastPage = totalRow / rowPerPage;
		if (totalRow % rowPerPage != 0) {
			lastPage += 1;
		}
		int totalCount = 0;
		
		
	%>
	<div class = "container-fluid">
	<jsp:include page="/inc/mainmenu.jsp"></jsp:include>

	<h1> 
	QnA List&nbsp;<small><a href= "<%=request.getContextPath()%>/qna/insertqnaForm.jsp" class="btn btn-primary " role="button" >QnA작성</a>
	&nbsp;<a href= "<%=request.getContextPath()%>/qna/resultCommentQnaForm.jsp" class="btn btn-primary " role="button" >QnA답변</a>&nbsp;전체글수 : <%=totalCount%></small>
	</h1>	
	<table class="table table-bordered bg-secondary">
		<thead>
			<tr>
				<td>qna_no</td>
				<td>qna_title</td>
				<td>qna_user</td>
			</tr>
		</thead>
	<%
		for (Qna qna : list) {
			String qnaDateSub = qna.qnaDate.substring(0, 10);
			System.out.println(qna.qnaDate.substring(0, 10) + "<---qnadate");
			System.out.println(qna.qnaNo + ",---1");
			Calendar today =Calendar.getInstance();
			
			int year = today.get(Calendar.YEAR);
			int month = today.get(Calendar.MONTH)+1;
			String month2 = ""+month;
			if(month<10) {
				month2 = "0"+month;
			}
			int day = today.get(Calendar.DATE);
			String day2 = ""+day;
			if(day<10) {
				day2 = "0"+day;
			}
			
			String strToday = year + " + month2 + " + day;
			
	%>
	<tr>
		<td><%=qna.qnaNo%></td>
		<td ><a href="<%=request.getContextPath()%>/qna/selectQna.jsp?qnaNo=<%=qna.qnaNo%>"><%=qna.qnaTitle%></a> <% if(strToday.equals(qnaDateSub)){ 
		%>
		<span class="badge badge-warning">Warning</span>
		<%
		}
		%>
		</td>
		<td><%=qna.qnaUser%></td>
	</tr>
	<%
		}
	%>

</table>
	<ul class="pagination">
		<%
			if (currentPage > 1) {
		%>
		<li class="page-item"><a class="page-link"
			href="<%=request.getContextPath()%>/qna/qnaList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
		</li>
		<%
			}

			if (currentPage < lastPage) {
		%>
		<li class="page-item"><a class="page-link"
			href="<%=request.getContextPath()%>/qna/qnaList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
		</li>
		<%
			}
		%>
	</ul>
	<form method = "post" action = "<%=request.getContextPath() %>/qna/qnaList.jsp">
	<input type = "text" name = "searchWord">
	<button type = "submit">제목검색</button>
	<div>
	</div>
	</form>
</div>
</body>
</html>