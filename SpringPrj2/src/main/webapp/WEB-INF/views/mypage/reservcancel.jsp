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
  #cancelcont  td:nth-of-type(1)  { width:100px; text-align:center;}
  #cancelcont  td:nth-of-type(2)  { width:500px; }
  #cancelcont  td:nth-of-type(3)  { text-align:center; }
   #buttons {
	display: flex;
	justify-content: space-between; }
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready( function() {	
	
	function parse(str) {
		var y = str.substr(0, 4);    
		var m = str.substr(5, 2);    
		var d = str.substr(8, 2);    
		return new Date(y,m-1,d);
	}
	
	var    today    = new Date();
    const  dday     = parse($("#dday").text());
    const  distance = dday.getTime() - today.getTime();
	const  price    = $("#price").text(); 
    const  not = '환불 불가';
    
    if(distance > 0) {
          const  day      = Math.floor(distance/(1000*60*60*24));
          
          if (day > 30 ) {
        	  const minus = '3000';
	          $("#minus").text(minus);
	          const refund = Number(price) - Number(minus);
	          if (refund > 0 ) {	        	  
	              $("#refund").text(refund);
	          } else {	   
	              $("#refund").text(not);
	          }    
         }
         else if ( day > 14) {
        	  const minus = '4000';
	          $("#minus").text(minus);
	          const refund = Number(price) - Number(minus);
	          if (refund > 0 ) {	        	  
	          $("#refund").text(refund);
	          } else {	        	  
	              $("#refund").text(not);
	          }
          } 
         else {
        	  const minus = '5000';       	  
	          $("#minus").text(minus);
	          const refund = Number(price) - Number(minus);
	          if (refund > 0 ) {	        	  
	              $("#refund").text(refund);
	          } else {	        	  
	              $("#refund").text(not);
 	          }
         }
    } else{    	
	      $("#minus").text(not);
	      $("#refund").text(not);
    }  
	
    
	var state = $("#refund").text();
	const state2 = '환불 불가';
	if ( state == state2) {
		document.getElementById("button1").style.display = "none";
	} else {
		document.getElementById("button1").style.display = "block";

	}
	
	$('#cancelButton').click(function(){
		var result = confirm('환불하시겠습니까?');
		var aseq =  $("#aseq").text(); 
		var tseq =  $("#tseq").text(); 
        var  email = $("#email").text();
		if(result) {
			$(location).attr("href","/Mypage/Myreservcancel?email=" + email + "&aseq=" + aseq + "&tseq=" + tseq + "&reservstate=예약 취소");
		} else{	
		}
		
	})
    
});

</script>

</head>
<body>
   <div id="main">
  		<div style="display:none" id="dday" >${cancelVo.usedate}</div>  
  		<div style="display:none" id="price" >${cancelVo.price}</div>
  		<div style="display:none" id="aseq" >${ cancelVo.aseq }</div>  
		<div style="display:none" id="email" >${email}</div> 
  		<div style="display:none" id="tseq" >${cancelVo.tseq}</div>
  
    <!--  예약 상세 조회 -->      
      <table id="cancelcont">
       <caption><h2> 예약 취소 </h2></caption>
       <tr>
        <td>예약번호</td>        
        <td>${ cancelVo.aseq + cancelVo.tseq }</td>       
        <td rowspan="5">
        <br><br>
         결제 금액 : ${ cancelVo.price }<br>
         수수료 : <span id="minus" style="color:red;"></span><br>
         환불 예정 금액 : <span id="refund" style="color:blue;"></span>
         <br><br>
         <a href="/Mypage/Refund"  style="color:red;"
            onclick="window.open(this.href, 'refund', 'width=600, height=400'); return false;">환불 규정 확인하기</a>

      </td>
       </tr>
       <tr>
        <td>이용날짜</td>        
        <td>${ cancelVo.usedate } </td>   
       </tr>
       <tr>
        <td>예약정보</td>        
        <td>${ cancelVo.reservdetail } </td>      
       </tr>
       <tr>
        <td>가격</td>        
        <td>${ cancelVo.price } </td>               
       </tr>
        <tr>
        <td>예약상태</td>        
        <td>${ cancelVo.reservstate } </td>    
       </tr>
      </table>   
      <br>

      <div id="buttons">
      <div id="button1">
      <input type="button" value="예약 취소" style="width:100px;" id="cancelButton"/>
      </div>
      <div id="button2"></div>
      <div id="button3">
      <input type="button" value="닫기" style="width:100px;" onclick="window.close();" />
      </div>
      </div>
     </div>

</body>
</html>






