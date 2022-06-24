<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>Insert title here</title>
   <style> 
  input[name="submitt"]{background-color:skyblue; 
  border-color: white; color: white; padding-right: 77px; padding-left: 77px;
                padding-bottom: 5px; padding-top: 5px; text-align: middle;}
  input[name="email"]{padding: 15px;}
  input[name="passwd"]{padding: 15px;}
  div[class="middlee"]{position: absolute;
                       left: 50%; top: 20%;
                       transform: translateX(-50%);}
  h1[name="log"]{color:rgb(26, 188, 156); padding-right: 48px; padding-left: 48px;}
  a {text-decoration: none;}	
   </style>
</head>
<body> 
   <!-- 메뉴 -->
	<%@ include file="/WEB-INF/include/menu.jsp" %>
	<hr>
	<div class="middlee">
   <h1 name="log">로그인</h1> 
   <form action="/loginProcess" >
   <input type="text" placeholder="example@greens.trip" name="email"><br><br>
   <input type="password" placeholder="****" name="passwd"><br><br>  
   <input type="submit" value="로그인" name="submitt"> 
   
   <c:if test="${msg == false}">
   <p style="color: red;">로그인 실패! 이메일 또는 비밀번호를 확인해주세요.</p>
   </c:if>
   </form>
   <a href="/submit">회원가입</a>&emsp;&ensp;
   <a href="/findpassword">비밀번호 찾기</a>
   </div>
</body>
</html>