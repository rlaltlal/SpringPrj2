<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/css/common.css">
<style>
	#PdsList tr:not(#tr1) td:nth-of-type(1){width: 50px;text-align: center;}
	#PdsList td:nth-of-type(2){width: 300px;text-align: left;}
	#PdsList td:nth-of-type(3){width: 100px;text-align: center;}
	#PdsList td:nth-of-type(4){width: 100px;text-align: center;}
	#PdsList td:nth-of-type(5){width: 100px;text-align: center;}
	#PdsList td:nth-of-type(6){width: 100px;text-align: center;}
</style>
</head>
<body>
	<div id="main">
		<%@ include file="/WEB-INF/include/pdsmenus.jsp"%>
		<table id="PdsList">
			<caption><h2>${menu_name}자료실</h2></caption>
			<tr id="tr1">
				<td colspan="6" class="right"><a href="/Pds/WriteForm?menu_id=${menu_id}&bnum=0&lvl=0&step=0&nref=0">[새글쓰기]</a></td>
			</tr>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>파일첨부</td>
				<td>작성일</td>
			</tr>
			<c:forEach var="pds" items="${pdsList}">
				<tr>
					<td>
						<c:if test="${pds.lvl eq 0}">
						<!-- 새글이면 글번호 출력-->
							${pds.bnum}
						</c:if>
					</td>
					<td>
						<c:choose>
							<c:when test="${pds.lvl eq 0}">
								<!-- 새글 -->
								<a href="/Pds/View?menu_id=${pds.menu_id}&idx=${pds.idx}">${pds.title}</a> 
							</c:when>
							<c:otherwise>
								<!-- 답글 -->
								<b style="display: inline-block; width: ${pds.lvl*20}px;"></b>
								<a href="/Pds/View?menu_id=${pds.menu_id}&idx=${pds.idx}">[답글] ${pds.title}</a> 
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						${pds.writter}
					</td>
					<td>
						${pds.readcount}
					</td>
					<td>
						<!-- 파일첨부수-->
						<c:choose>
							<c:when test="${pds.filescount eq 0}">
								&nbsp;
							</c:when>
							<c:otherwise>
								${pds.filescount}
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						${fn:substring(pds.regdate,0,10)}
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>