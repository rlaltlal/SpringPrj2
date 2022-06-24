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
  #submenu   {text-align:right;}
  #inform    {text-align:center;}	
  h2 {font-size:40px;}
  #div1 {font-size:25px;}
  #div2 {font-size:20px;}
  #modify {background-color: #EFB82E; border-style:none;
           font-size:20px; color:#737270;}

  .grade {background-color: yellow; display:flex; justify-content:space-between; }
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $( function() {
	  $('form').on('submit', function(e) {
		  if( $('[name=passwd]').val().trim() == ''   ) {
			  alert('비밀번호를 입력하세요');
		  	  return false;
		  }
		  else if( $('[name=nickname]').val().trim() == ''   ) {
			  alert('닉네임을 입력하세요');
		  	  return false;
		  }	else{
			  alert('정보 변경이 완료되었습니다.');
			  return true;
		  }
		  

	  });
	  
  })
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
  
  <br>
  
  <div class="grade" >
  내 등급 : ${ vo.rate } &nbsp; &nbsp;
  <a href="/Mypage/Gradealert"  
  onclick="window.open(this.href, 'detail', 'width=600, height=400'); return false;">등급 조건 확인하기</a>
  </div>
  
  <br><br>
  
  <div id="inform">
  <!--  회원정보 수정 -->
    <h2>내 정보 수정</h2>
      <br><br>
    <form action="/Mypage/MyinformUpdate" method="POST">
    
    <div>
    <div id="div1"> 📧 이메일 </div><br>
    <div id="div2">
    <input type="text"   name="email"    value="${ vo.email }" readonly />
    </div>
    </div>
    <br><br>
    
    <div> 
    <div id="div1"> 🔑 비밀번호 </div><br>
    <div id="div2">
    <input type="text"   name="passwd"  value="${ vo.passwd }" />
    </div>
    </div>
    <br><br>
    
    <div>
    <div id="div1"> 🎇  닉네임 </div><br>
    <div id="div2">
    <input type="text" name="nickname"   value="${ vo.nickname }" />
    </div>
    </div>
    <br><br>
    
    <div id="div3">
      <input type="submit" value="수정하기" id="modify"/>
    </div>
    
    </form>   
    </div>
 </div> 
</body>
</html>







