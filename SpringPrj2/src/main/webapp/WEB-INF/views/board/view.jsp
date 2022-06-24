<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link rel="stylesheet" href="/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
  #board  td:nth-of-type(1) { width:150px; text-align:center;}
  #board  td:nth-of-type(2) { width:400px; text-align:left;}
  #board  td:nth-of-type(3) { width:150px; text-align:center;}
  #board  td:nth-of-type(4) { width:400px; text-align:left;}
  td {background-color:white;}
  body{background-color:#FCFFDF}
  h2{color:#1ABC9C;}
  table, th, td {  
      border : 10px solid  #E0E0E0;;
	  border-collapse : collapse;

   }
  #board  tr:nth-of-type(3) { height : 400px; vertical-align: top; }
  
  
  #board  input     { width:100%; }
  #board  textarea  { width:100%; height: 400px;  }
  
  
</style>
<script>

</script>
</head>
<body>
<%@ include file="/WEB-INF/include/menu.jsp" %>
	<hr>
   <div id="main">
    <!--  메뉴목록 (menuList) -->
    
    <!--  내용보기 -->      
      <table id="board">
       <caption><h2>상세 내용</h2></caption>
       <tr>
        <td colspan="1">제목</td>        
        <td colspan="3">${ boardVo.title }</td>
       </tr>
       <tr>
        <td>작성일</td>        
        <td>${ boardVo.writedate } </td>
        <td>작성자</td>        
        <td>${sessionScope.nickname}</td>
       </tr>
       <tr>
        <td>내용</td>
        <td colspan="3">${ boardVo.cont }</td>
       </tr>
       <tr>
        <td colspan="4">
        <c:if test="${sessionScope.email == 'www.admin@admin.com'}">    
        [<a href="/Board/UpdateForm?qseq=${boardVo.qseq}&menu_id=${menu_id}">수정</a>]        
        [<a href="/Board/Delete?qseq=${boardVo.qseq}&menu_id=${menu_id}">삭제</a>]   
        </c:if>      
        [<a href="/Board/List?menu_id=MENU01">목록으로</a>]        
        [<a href="javascript:history.back()">이전으로</a>]        
        [<a href="/">Home</a>]        
        </td>
       </tr>
      </table> 
      
   </div>
   <div style="height:300px;"></div>
</body>
</html>






