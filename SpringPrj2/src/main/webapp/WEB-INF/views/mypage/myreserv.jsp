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
    #submenu {text-align : right;}
    .timeline {border-style: hidden; table-layout:auto;}
    .scroll { overflow:scroll; width:90%;  margin-left:auto; margin-right: auto;}
    .datebox {border-bottom: grey; text-align : left; }
    .timebox {border-style: none; width:300px; min-width:300px; }

    
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
  <br><br><br>  
  <h2> &nbsp; &nbsp; 나의 예약 조회하기</h2>
 <c:choose >
  <c:when test="${ !empty  reservDateList  }">
  <c:forEach  var="date" items="${ reservDateList }">
  <hr>
  <div class="scroll">
   <table class="timeline" >
    <tr class="datebox">
      <th colspan="100%">${ date.usedate }</th>     
    </tr>
    <tr>
  <c:forEach  var="reserv" items="${ reservList }">
  <c:if test="${ reserv.usedate eq date.usedate }">
      <td class = "timebox" > 
      <c:if test="${reserv.tseq == '0'}">
      🏫  ${ reserv.usetime }<br>
      </c:if>
      <c:if test="${reserv.aseq == '0'}">
      🚄  ${ reserv.usetime }<br>
      </c:if>
          예약 번호 : ${ reserv.aseq + reserv.tseq }<br>
          예약 내역 : ${ reserv.reservcont }<br>
          예약 상태 :${ reserv.reservstate }<br>
      <a href="/Mypage/Myreservcont?email=${vo.email}&aseq=${ reserv.aseq }&tseq=${ reserv.tseq }&reservcont=${reserv.reservcont}" 
      onclick="window.open(this.href, 'detail', 'width=1200, height=800'); return false;" style ="color:red;">상세 조회</a></td>
  </c:if>
  </c:forEach>
    </tr>
   </table>
  </div>
     <br><br><br>
  </c:forEach>  
  </c:when>
  <c:otherwise>
  <h2 style="text-align:center;"> 😭 예약 내역이 없습니다.</h2>
  </c:otherwise>
  </c:choose>
   
  


    <br><br>   <br><br>
 </div> 
</body>
</html>







