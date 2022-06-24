<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/css/common.css">
<style>
	h2{margin:20px}
</style>
</head>
<body>
	<div id="main">
		<h2>메뉴 리스트</h2>
		<table>

			<c:forEach var="menu" items="${menuList}">
				<tr>
					<td>
						${menu.menu_id}
					</td>
					<td>
						${menu.menu_name}
					</td>
					<td>
						${menu.menu_seq}
					</td>
					<td>
						[<a href="/Menus/MenuDelete/${menu.menu_id}">삭제</a>]		
					</td>
					<td>
						[<a href="/Menus/MenuUpdateForm/${menu.menu_id}">수정</a>]		
					</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			[<a href="/Menus/WriteForm">메뉴 추가</a>]l
			[<a href="/Menus/WriteForm2">메뉴 추가 - 이름만 입력</a>]
		</div>
	</div>
</body>
</html>