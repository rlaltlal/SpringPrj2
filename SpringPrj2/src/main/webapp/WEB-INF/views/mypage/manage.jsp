<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />

<style>
    #submenu {text-align:right;}
  #manage  td:nth-of-type(1)  { width:250px; text-align:left;}  
  #manage  td:nth-of-type(2)  { width:150px; text-align:left;}  
  #manage  td:nth-of-type(3)  { width:100px; text-align:center;}  
  #manage  td:nth-of-type(4)  { width:150px; text-align:left;}  
  #manage  td:nth-of-type(5)  { width:100px; text-align:center;}  
	table,th,td{border: 1px solid #c0c0c0; border-collapse: collapse; }
td,th{padding: 10px;}
table{width: 80%; margin-left:auto; margin-right: auto;}
.margin {margin-left:auto; margin-right: auto;}
</style>
<script>


</script>
</head>
<body>
  <div id="main"> 
  <!--  메뉴목록  -->
  <%@ include file="/WEB-INF/include/menu.jsp" %>
  <hr>
    <br><br>
  <div id="submenu">
  <!--  서브메뉴목록  -->
  <input type="button" value="내 예약"        onclick="location.href='/Mypage/Myreserv?email=${vo.email}'" >  
  <input type="button" value="여행 기록"      onclick="location.href='/Mypage/Mylog?email=${vo.email}'" >  
  <input type="button" value="내글 보기"      onclick="location.href='/Mypage/Mypost?email=${vo.email}'" >  
  <input type="button" value="회원정보 수정"  onclick="location.href='/Mypage/Myinform?email=${vo.email}'" >  
  <c:set var="rate" value="${ vo.rate }" />
  <c:if test="${rate eq 'MASTER'}">
  <input type="button" value="회원관리"       onclick="location.href='/Mypage/Manage?email=${vo.email}'" >  
  </c:if>
  </div>
  <br><br>
  <!--  게시물 목록 -->
  <table id="manage">
  <caption><h2>회원관리</h2></caption>
   <tr>
    <th>회원 이메일</th>
    <th>회원 닉네임</th>
    <th style ="text-align:right;"> 회원 등급 &nbsp; &nbsp;<a href="/Mypage/Manage?email=${vo.email}">🔁</a></th>
    <th>가입일</th>
    <th>회원 관리</th>
  </tr>
  <c:forEach  var="userList" items="${ userList }">
    <tr>
      <td>${ userList.email }</td>
      <td>${ userList.nickname }</td>
      <td>${ userList.rate } </td>
      <td>${ userList.regdate }</td>   
      <td><a href="/Mypage/Userpost?email=${ userList.email }"  style = "color:red;"
          onclick="window.open(this.href, 'detail', 'width=1200, height=800'); return false;">작성글 확인</a></td>
    </tr>
  </c:forEach>  
  </table>

 
 </div> 
</body>
</html>







