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
  #board  td:first-child { width:150px; text-align:center;}
  #board  td:first-child { text-align:left;}
  
  #board  input     { width:100%; }
  #board  textarea  { width:100%; height: 400px;  }
  #board  [type=submit]  { width:40px; height: 30px; text-align:center;  }
</style>
<script>
  window.onload = function() {
	  var form1El = document.getElementById('form1');
	  form1El.addEventListener('submit', function(e) {
		  const  titleEl = document.querySelector('[name=title]');
		  if(  titleEl.value.trim() == ''  ) {
			  alert('제목을 입력하세요');
			  e.preventDefault();   
		  	  e.stopPropagation();  
		  } 
		  		  
	  } );
  }
</script>
</head>
<body>
   <div id="main">
  <br><br>  
    <form action="/Board2/Update" id="form1" method="POST">
      <input type="hidden" name="menu_id" value="${boardVo.menu_id}" />   
      <input type="hidden" name="email"   value="${boardVo.email}" />   
      <input type="hidden" name="bseq"    value="${boardVo.bseq}" />   
      <table id="board">
       <caption>
       		 <h2>글  수정하기</h2>
       </caption> 
       <c:choose>
       <c:when test="${ menu_id eq 'MENU03'}">
        <c:set var="subcategory" value="${ boardVo.subcategory }" />
           <tr>
            <td>여행 추천</td>
            <td>
       	    <select name="subcategory" >
  		    <option value="SEOUL" <c:if test="${subcategory eq 'SEOUL'}"> selected </c:if> >서울</option>
  		    <option value="BUSAN" <c:if test="${subcategory eq 'BUSAN'}"> selected </c:if> >부산</option>
  		    <option value="JEJU"  <c:if test="${subcategory eq 'JEJU'}"> selected </c:if> >제주</option>
  		    <option value="ETC"  <c:if test="${subcategory eq 'ETC'}"> selected </c:if>  >기타</option>
  	        </select> 
  	        </td>
            </tr>
        </c:when>
       <c:when test="${menu_id eq 'MENU04'}">          
        <tr>
            <td>여행 Tip</td>
            <td>
       	    <select name="subcategory" >
  		    <option value="PLAY" <c:if test="${subcategory eq 'PLAY'}"> selected </c:if> >놀거리</option>
  		    <option value="SLEEP" <c:if test="${subcategory eq 'SLEEP'}"> selected </c:if> >숙소</option>
  		    <option value="FOOD"  <c:if test="${subcategory eq 'FOOD'}"> selected </c:if> >맛집</option>
  		    <option value="ETC2"  <c:if test="${subcategory eq 'ETC2'}"> selected </c:if>  >기타</option>
  	        </select> 
  	        </td>
  	        </tr>
         </c:when>
       <c:when test="${menu_id eq 'MENU05'}">
        <tr>
            <td>자유 게시판</td>
            <td>
       	    <select name="subcategory" >
  		    <option value="HUMOR" <c:if test="${subcategory eq 'HUMOR'}"> selected </c:if> >유머</option>
  		    <option value="INFORM" <c:if test="${subcategory eq 'INFORM'}"> selected </c:if> >여행 외 정보</option>
  		    <option value="WITH"  <c:if test="${subcategory eq 'WITH'}"> selected </c:if> >동행 구하기</option>
  		    <option value="ETC3"  <c:if test="${subcategory eq 'ETC3'}"> selected </c:if>  >기타</option>
  	        </select> 
  	        </td>
       </tr> 
        </c:when>

       </c:choose> 
       
       <tr>
        <td>제목</td>
        <td><input type="text" name="title" value="${boardVo.title}"/> </td>
       </tr>

       <tr>
        <td>내용</td>
        <td><textarea name="cont" >${boardVo.cont}</textarea></td>
       </tr>
       <tr >
       <c:choose>
       <c:when test="${ menu_id eq 'MENU03'}">       
       <td style="text-align:left; border-right-style:hidden;"   onclick="location.href='/Board2/Trlist?menu_id=MENU03'">
        <input type="button" value="글 작성 취소" />        
        </td>
       </c:when>
       <c:when test="${ menu_id eq 'MENU04'}">       
       <td style="text-align:left; border-right-style:hidden;"   onclick="location.href='/Board2/Trlist?menu_id=MENU04'">
        <input type="button" value="글 작성 취소" />        
        </td>
       </c:when>
       <c:when test="${ menu_id eq 'MENU05'}">       
       <td style="text-align:left; border-right-style:hidden;"   onclick="location.href='/Board2/Trlist?menu_id=MENU05'">
        <input type="button" value="글 작성 취소" />        
        </td>
       </c:when>
       </c:choose>
        <td style="text-align:right;">
        <input type="submit" value="수정" />        
        </td>
       </tr>
      </table> 
    </form>
    
   </div>
</body>
</html>






