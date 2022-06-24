<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
  input[name="submitt2"]{background-color:skyblue; 
  border-color: white; color: white; padding-right: 50px; padding-left: 50px;
                padding-bottom: 5px; padding-top: 5px; text-align: middle;}
  input[name="submitc"]{background-color:skyblue; 
  border-color: white; color: white; padding-right: 50px; padding-left: 50px;
                padding-bottom: 5px; padding-top: 5px; text-align: middle;}
  input[name="email2"]{padding: 15px;}
  input[name="passwd2"]{padding: 15px;}
  div[class="middlee2"]{position: absolute;
                       left: 50%; top: 20%;
                       transform: translateX(-50%);}
  h1[name="log2"]{color:rgb(26, 188, 156); padding-right: 48px; padding-left: 48px;}
  a {text-decoration: none;}	
   </style>
</head>
<body>
   <%@ include file="/WEB-INF/include/menu.jsp" %>
   <div class="middlee2">
   <h1 name="log2">회원가입</h1> 
   <form action="/submitProcess" method="post">
   <label for="email">이메일</label>
   <input type="text" placeholder="example@greens.trip" name="email"><br><br>
   <label for="nickname">닉네임</label>
   <input type="text" placeholder="한글 두글자~다섯글자 입력" name="nickname"><br><br>
   <label for="passwd">비밀번호</label>
   <input type="password" placeholder="6글자 이상을 입력해주세요" name="passwd"><br><br>  
   <input type="button" value="취소" onclick="location.href='/'" name="submitc">
   <input type="submit" value="확인" name="submitt2">  
   </form>
	
   </div>
</body>
</html>