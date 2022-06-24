<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Trip Green</title>
<style>
	a {text-decoration: none; padding:10px; color: black;}	
	a:visited{text-decoration: none;}	
	div[name="rright"]{float:right;display:inline-block;box-sizing:content-box;}
	a[name="gohome"]{color:rgb(26, 188, 156); font-style:italic;
	   font-size: 30px;}
</style>
</head>
<body>
	<div id="_menu" style="display: grid; grid-template-columns: 30% 70%; padding-top: 5px; padding-bottom:5px">
        <div id="_mainimg">
            &emsp;<a href="/"><img src="/img/train.png" alt="" style="width: 210px;height: 43px; padding-top: 5px;"> </a>
        </div>  
        <div name="rright" style="padding:15px 15px; text-align: right;">
      		 <c:if test="${sessionScope.email ne null}"><a href='<c:url value="/logoutProcess"/>'>로그아웃</a></c:if>
 	    	 <c:if test="${sessionScope.email eq null}"><a href='<c:url value="/login"/>'>로그인</a></c:if>
             <a href="/submit" style="padding-right: 20px ;">회원가입</a>
             <a href="/search" style="padding-right: 20px ;">기차/숙소 예약</a>
             <a href="/Board2/Trlist?menu_id=MENU03" style="padding-right: 20px ;">커뮤니티</a>
             <c:choose>
		           <c:when test="${sessionScope.email eq null}">
		  	           <a href="/login" style="padding-right: 20px ;">마이페이지</a>
		           </c:when>
		           <c:otherwise>
	    	             <a href="/Mypage/Myreserv?email=${sessionScope.email}" style="padding-right: 20px ;">마이페이지</a>
		            </c:otherwise>
           	</c:choose>
             <a href="/Board/List" style="padding-right: 20px ;">고객센터</a>
        </div>
     </div>
</body>
</html>
