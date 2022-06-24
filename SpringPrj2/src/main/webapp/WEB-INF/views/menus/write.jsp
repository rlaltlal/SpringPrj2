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
		<h2>메뉴 추가</h2>
		<form action="/Menus/Write" method="post">
			<div>
				메뉴 아이디: <input type="text" name="menu_id" id="menu_id">
			</div>
			<div>
				메뉴 이름: <input type="text" name="menu_name" id="menu_name">
			</div>
			<div>
				메뉴 순서: <input type="text" name="menu_seq" id="menu_seq">
			</div>
			<div>
				<input type="submit" value="추가하기">
			</div>
		</form>
	</div>
</body>
</html>