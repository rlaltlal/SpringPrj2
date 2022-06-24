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
  #refund  td:nth-of-type(1)  { width:400px; text-align:center;}  
  #refund  td:nth-of-type(2)  { width:100px; text-align:center;}  

</style>
<script>

</script>
</head>
<body>
   <div id="main">
    <!--  환불 조건 -->      
      <table id="refund">
       <caption><h2> 환불 규정 </h2></caption>
       <tr>
        <th>출발 시점</th>
        <th>수수료</th>
       </tr>
       <tr>
        <td>구매 다음날부터 출발 31일 전까지</td>        
        <td>3000</td>       
       </tr>
       <tr>
        <td>출발 30일전부터 출발15일전까지</td>        
        <td>4000</td>       
       </tr>
       <tr>
        <td>출발 14일전부터 ~ 하루 전</td>        
        <td>5000</td>       
       </tr>
       <tr>
        <td>출발일 이후</td>        
        <td>환불불가</td>       
       </tr>
      </table>


   </div>
</body>
</html>






