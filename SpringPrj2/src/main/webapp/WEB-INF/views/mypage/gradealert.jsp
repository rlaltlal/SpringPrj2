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
<style>
  #grade  td:nth-of-type(1)  { width:100px; text-align:center;}  
  #grade  td:nth-of-type(2)  { width:300px; text-align:center;}  

</style>
<script>

</script>
</head>
<body>
   <div id="main">
    <!--  등급 조건 -->      
      <table id="grade">
       <caption><h2> 등급 조건 </h2></caption>
       <tr>
        <td>브론즈</td>        
        <td>회원가입 완료</td>       
       </tr>
       <tr>
        <td>실버</td>        
        <td>예약 완료 3회 이상 </td>       
       </tr>
       <tr>
        <td>골드</td>        
        <td>예약 완료 10회 이상 </td>       
       </tr>
 
      </table>


   </div>
</body>
</html>






