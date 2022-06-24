<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h2>메뉴 추가 - 메뉴 아이디, 메뉴 번호 없이</h2>
		<form action="/Menus/Write2" method="post">
			<div>
				메뉴 이름: <input type="text" name="menu_name" id="menu_name">
			</div>
			<div>
				<input type="submit" value="추가하기">
			</div>
		</form>
	</div>
</body>
</html>