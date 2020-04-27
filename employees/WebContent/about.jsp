<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>about</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<fieldset>
<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
<h2>이 력 서</h2>
<div class="container-fluid row">
	
	<!-- 기본정보 -->
<div class="col-xl-10">
	<table class = "table table-bordered ">
		<tbody>
			<tr>
				<td rowspan ="3">
				<img src = "<%=request.getContextPath() %>/imgs/img1.jpg" width = "65" height = "100">
				</td>
				<td rowspan ="2">성명</td>
				<td>(한글) 정종혁</td>
				<td>생년월일</td>
				<td>1995.06.14</td>
				
			</tr>
			
			<tr>
				<!-- <td>사진</td> -->
				<!-- <td>성명</td> -->
				<td>(영문) JeongJongHyuk</td>
				<td>휴대폰</td>
				<td>010-4043-9753</td>
				
			</tr>
			
			<tr>
				<!-- <td>사진</td> -->
				<td>현주소</td>
				<td>서울시 은평구 응암1동 48-5</td>
				<td>이메일</td>
				<td>chonghg21@naver.com</td>
			</tr>
				
		</tbody>
	</table>
	<br>
	<table  class = "table table-bordered">
		<tbody>
			<tr>
				<td rowspan ="3">학력사항</td>
				<td>졸 업 일</td>
				<td >학 교 명</td>
				<td>전     공</td>
				<td>졸업여부</td>
				<td>소 재 지</td>
				<td>성     적</td>
				
				
			</tr>
			
			<tr>
				<td>2014년02월</td>
				<td >충암고등학교</td>
				<td>이공계</td>
				<td>졸업</td>
				<td>서울</td>
				<td>-</td>
			</tr>
			
			<tr>
				<td>2016년02월</td>
				<td >서일대학교</td>
				<td>자동차과</td>
				<td>졸업</td>
				<td>서울</td>
				<td>3.55/4.5</td>
			</tr>			
		</tbody>
	
	</table>
	
	<br>
	<table  class = "table table-bordered">
		<tbody>
			<tr>
				<td rowspan ="3">경력사항</td>
				<td>근무기간</td>
				<td>회 사 명</td>
				<td>직    위</td>
				<td>담당업무</td>
				<td>퇴사사유</td>
			</tr>
			
			<tr>
				<td>2018/12-2019/05</td>
				<td>하이테크공조</td>
				<td>사원</td>
				<td>설계,현장관리</td>
				<td>일신상사유</td>

			</tr>
			
			<tr>
				<td>2019/07-2019/12</td>
				<td>태건정공</td>
				<td>사원</td>
				<td>설계,영업,현장관리,</td>
				<td>계약위반</td>
			</tr>			
		</tbody>	
	</table>
	
		<br>
	<table  class = "table table-bordered">
		<tbody>
			<tr>
				<td rowspan ="6">기타사항</td>
				<td>신장</td>
				<td>171cm</td>
				<td>체중</td>
				<td>68kg</td>
				<td>시력</td>
				<td>1.0/0.9</td>
			</tr>
			
			<tr>
				<td>취미</td>
				<td>운전,여행</td>
				<td>특기</td>
				<td>조립/분해</td>
				<td>종교</td>
				<td>기독교</td>				
			</tr>
			
			<tr>
				<td rowspan ="4">전산능력</td>
				<td>프로그램명</td>
				<td>활용도</td>
				<td colspan = "3">자격증 보유 현황</td>
			</tr>		
			
			<tr>
				<td>-</td>
				<td>-</td>
				<td colspan = "3">-</td>
				
			</tr>	
			
			<tr>
				<td>-</td>
				<td>-</td>
				<td colspan = "3">-</td>
				
			</tr>	
			
			<tr>
				<td>-</td>
				<td>-</td>
				<td colspan = "3">-</td>
				
			</tr>		
		</tbody>	
	</table>
</div>
	
	
	
</div>

<div class="col-xl-2"></div>
</fieldset>
</body>
</html>