<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Trip Green</title>
	<style>
	a {text-decoration: none;}	
	div[name="rright"]{float:right;}
	a[name="gohome"]{color:rgb(26, 188, 156); font-style:italic;
	   font-size: 30px;}
	</style>
</head>
<body>
   &emsp;<a name="gohome" href='<c:url value="/"/>'>Trip Greens</a>
   
   <div name="rright">
   <a href='<c:url value="/"/>'>기차/숙소 예약</a>&ensp;
   <a href='<c:url value="/"/>'>고객센터</a>&ensp;
   <c:if test="${vo ne null}"><a href='<c:url value="/logoutProcess"/>'>로그아웃</a></c:if>
   <c:if test="${vo eq null}"><a href='<c:url value="/login"/>'>로그인</a></c:if>&nbsp;
   <a href='<c:url value="/submit"/>'>회원가입</a>&ensp;
   <a href='<c:url value="/mypage"/>'>마이페이지</a>&ensp;
   <a href='<c:url value="/"/>'>커뮤니티</a>&nbsp;
   </div>
   
</body>
</html>
