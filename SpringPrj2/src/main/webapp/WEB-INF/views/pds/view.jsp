<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLine", "\n"); %>
<%--pageContext : 현재페이지에서만 사용하는 변수 --%>
				
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/css/common.css">
<style>
	#board td:nth-of-type(1){width: 150px; text-align: center;}
	#board td:nth-of-type(2){width:400px; text-align: left;}
	#board td:nth-of-type(3){width: 150px; text-align: center;}
	#board td:nth-of-type(4){width:400px; text-align: left;}
	#board tr:nth-of-type(4){height: 400px;vertical-align: top;}
	#board input{width: 100%;}
	#board textarea{width: 100%; height: 400px;}
	#board td[colspan]{text-align: left;}
	#board tr:last-child td[colspan]{text-align: center;}

</style>
</head>
<body>
	<div id="main">
		<!-- 메뉴 목록-->
		<%@ include file="/WEB-INF/include/pdsmenus.jsp" %>
		<!-- 글 조회-->
		<table id="board">
			<caption><h2>내용 보기</h2></caption>
			<tr>
				<td>글 번호</td>
				<td>${pdsVo.idx}</td>
				<td>조회수</td>
				<td>${pdsVo.readcount}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${pdsVo.regdate}</td>
				<td>작성자</td>
				<td>${pdsVo.writter}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">${pdsVo.title}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">
				<!-- "\n" 변수로 처리 안됨. 윗줄로 가서 setAttribute() -->
					 ${fn:replace(pdsVo.cont,newLine,"<br>")}
				</td> 
				
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="3">
					<c:forEach var="filesVo" items="${filesList}">
						<a href="<c:out value="/Pds/download/external/${filesVo.sfilename}"/>">${filesVo.filename}</a>  <br>
						 <!-- href="external/$.."로 해도되지만 가끔 컴파일 오류가 나서 위와같이 작성 -->
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					[<a href="/Pds/WriteForm?menu_id=${pdsVo.menu_id}&bnum=0&lvl=0&step=0&nref=0">새글쓰기</a>]
					[<a href="/Pds/WriteForm?menu_id=${pdsVo.menu_id}&idx=${pdsVo.idx}&bnum=${pdsVo.bnum}&lvl=${pdsVo.lvl}&step=${pdsVo.step}&nref=${pdsVo.nref}">답글쓰기</a>]
					<!--  & < >  (html: &amp; &lt; &gt) -->
					[<a href="/Pds/UpdateForm?idx=${pdsVo.idx}&menu_id=${pdsVo.menu_id}">수정</a>]
					[<a href="/Pds/Delete?idx=${pdsVo.idx}&menu_id=${pdsVo.menu_id}">삭제</a>]
					<!-- 삭제하고 같이가져간 menuid로 이동 -->
					[<a href="/Pds/List?menu_id=${pdsVo.menu_id}">목록으로</a>]
					[<a href="javascript:history.back()">이전으로</a>]
					[<a href="/">Home</a>]
				</td>
			</tr>
		</table>
	</div>
</body>
</html>