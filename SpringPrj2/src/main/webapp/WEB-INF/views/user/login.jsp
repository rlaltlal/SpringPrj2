<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/loginProcess" method="post">
		<div>
			아이디 <input type="text" name="userid" id="userid">
		</div>
		<div>
			암호 <input type="text" name="passwd" id="passwd">
		</div>
		<div>
			<input type="submit" name="submit" id="submit" value="로그인">
		</div>
	</form>
</body>
</html>