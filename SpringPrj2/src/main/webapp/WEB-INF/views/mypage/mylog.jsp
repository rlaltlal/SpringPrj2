<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<style>
#submenu {
	text-align: right;
}

.log {
	display: flex;
	width:60%;
	margin-left:auto; margin-right: auto;
}

#mylog {
	width: 800px;
	height : 384px;
	text-align: left;
	border : dotted;
	overflow:scroll;
}


.ui-datepicker {
	font-size: 30px;
	width: 500px;
}

.ui-datepicker select.ui-datepicker-month {
	width: 30%;
	font-size: 11px;
}

.ui-datepicker select.ui-datepicker-year {
	width: 50%;
	font-size: 11px;
}
</style>

<script>
    $(function() {		
    	//선택가능 날짜 		
    	var availableDates = [];
    	<c:forEach var="myLogList" items="${myLogList}">
    	availableDates.push("${myLogList.usedate}");
    	</c:forEach>
    	

    	function available(date) {						
    		var thismonth = date.getMonth()+1;			
    		var thisday = date.getDate();						
    		if(thismonth<10){thismonth = "0"+thismonth;	}						
    		if(thisday<10){thisday = "0"+thisday;	}		    
    		ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;		    
    		if ($.inArray(ymd, availableDates) >= 0) {	return [true,"",""];} 
    		else {	  return [false,"",""];	   }		}	
    	   	
    	$('#datepicker').datepicker({ 	
    		dateFormat: "yy-mm-dd",
    		regional: "ko",			
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	
            maxDate: 0,
    		beforeShowDay: available,
            onSelect: function() { 
                var date  = $.datepicker.formatDate("yymmdd",$("#datepicker").datepicker("getDate")); 
                var  email = $("#email").text();
                $(location).attr("href","/Mypage/MylogDetail?email=" + email + "&usedate=" + date);
            } 

    	});	 
    	
    });
</script>



</head>
<body>
  <div id="main"> 
  <!--  메뉴목록  -->
  <%@ include file="/WEB-INF/include/menu.jsp" %>
  <hr>
    <br><br>
		<div style="display:none" id="email" >${email}</div>
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
		<br> <br>

		<!--  여행 목록 -->
		<div class="log">
		
			<!-- 달력 -->
			<div id="datepicker"></div>
			
			<!-- 예약 내역 스크롤 -->
			<div id="mylog">
				<div id="logDate">
				<h2> &nbsp My Trip Log</h2>
				</div>



			</div>
		</div>


	</div>
</body>
</html>







