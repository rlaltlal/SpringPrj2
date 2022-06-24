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
  #reservcont  td:nth-of-type(1)  { width:100px; text-align:center;}
  #reservcont  td:nth-of-type(2)  { width:500px; }
 #buttons {
	display: flex;
	justify-content: space-between;
}
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready( function() {	
	var state = $("#state").text();
	const state2 = '예약 완료';
	if ( state == state2) {
		document.getElementById("button1").style.display = "block";
	} else {
		document.getElementById("button1").style.display = "none";

	}
	
});
</script>
</head>
<body>
   <div id="main">
      		<div style="display:none" id="state" >${ reservcont.reservstate  }</div> 
   <div>
    <!--  예약 상세 조회 -->      
      <table id="reservcont">
       <caption><h2> 예약 조회 </h2></caption>
       <tr>
        <td>예약번호</td>        
        <td>${ reservcont.aseq + reservcont.tseq }</td>       
       </tr>
       <tr>
        <td>이용날짜</td>        
        <td>${ reservcont.usedate } </td>       
       </tr>
       <tr>
        <td>예약정보</td>    
        
        						<c:if test="${myTripLog.tseq == '0'}">
                        <h3> 🏫  ${ reservcont.usetime }</h3>
						<h3> &nbsp &nbsp 🚩 &nbsp ${ reservcont.accomname}</h3>
						<h3> &nbsp &nbsp 📭 &nbsp ${ reservcont.address}</h3>
						<h3> &nbsp &nbsp 📞 &nbsp ${ reservcont.phone}</h3>
                        </c:if>
                        <c:if test="${myTripLog.aseq == '0'}">
                        <h3> 🚄  ${ reservcont.usetime }</h3>
						<h3> &nbsp &nbsp 🎫 &nbsp ${ reservcont.train}</h3>
						<h3> &nbsp &nbsp 🕋 &nbsp ${ reservcont.trainarea}</h3>
						<h3> &nbsp &nbsp ⌚ &nbsp ${ reservcont.traintime}</h3>
                        </c:if>
                        <br><br>    
        <td> 
        <c:if test="${reservcont.tseq == '0'}">
        &nbsp 🚩 &nbsp ${ reservcont.accomname}<br>
		&nbsp 📭 &nbsp ${ reservcont.address}<br>
		&nbsp 📞 &nbsp ${ reservcont.phone}<br></td>  
		</c:if>     
		<c:if test="${reservcont.aseq == '0'}">
		&nbsp 🎫 &nbsp ${ reservcont.train}<br>
		&nbsp 🕋 &nbsp ${ reservcont.trainarea}<br>
		&nbsp ⌚ &nbsp ${ reservcont.traintime}<br></td>  
        </c:if>
       </tr>
       <tr>
        <td>가격</td>        
        <td>${ reservcont.price } </td>       
       </tr>
       <tr>
        <td>예약상태</td>        
        <td>${ reservcont.reservstate }</td>       
       </tr>
      </table>
      <br>
   </div>
      <div id="buttons">
      <div id="button1">
      <input type="button" value="예약취소" id="cancel" onclick="location.href='/Mypage/CancelPage?email=${ reservcont.email }&aseq=${ reservcont.aseq }&tseq=${ reservcont.tseq }&reservcont=${reservcont.reservcont}&reservstate=예약 취소'" >  
      </div>
      <div id="button2"></div>
      <div id="button3">
      <input type="button" value="확인"  onclick="window.close();" />
      </div>
      </div>

   </div>
</body>
</html>






