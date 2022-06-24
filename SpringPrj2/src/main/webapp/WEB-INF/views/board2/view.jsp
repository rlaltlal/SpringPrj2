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
  #board  td:nth-of-type(1) { width:100px; text-align:center;}
  #board  td:nth-of-type(2) { width:300px; text-align:left;}
  #board  td:nth-of-type(3) { width:100px; text-align:center;}
  #board  td:nth-of-type(4) { width:300px; text-align:left;}
  #board  td:nth-of-type(5) { width:200px; text-align:right;}
  #board  td:nth-of-type(6) { width:200px;}
  
  #board  tr:nth-of-type(4) { height : 400px; vertical-align: top; }
  
  #recBtn { font-size:15px; color:red; outline:none; }
  
  #board  input     { width:100%; }
  #board  textarea  { width:100%; height: 400px;  }
  
  
</style>
<script>
$( function() {
	$('form [type=submit]').on('click',function (e) {
		
		e.preventDefault();
		e.stopPropagation();
		
		const email2 =  $('#email2').val();    //글쓴이
		const email =  $('#email').val();  //로그인
    	var emailList = [];
		<c:forEach var="recList" items="${recList}">
    	emailList.push("${recList.email}");
    	</c:forEach>

    	if ( email == "" ){
    		alert('로그인이 필요합니다.')
    		window.location.href = "/login";
    	} else if( email == email2 ) {
    		alert('본인 게시물에는 추천을 하실 수 없습니다.');
    	} else  if( emailList.indexOf(email) >= 0 ) {
    		alert('추천은 한 번만 하실 수 있습니다.');
    	}  	else {
    		$(this).unbind('click').click();
    	}
	});
	  
});

</script>
</head>
<body>
   <div id="main">
    <!--  내용보기 -->      
      <table id="board">
       <caption><h2>글 읽기</h2></caption>
       <tr>
        <td colspan="1">말머리</td>
        <td colspan="5">${ boardVo.subcategory } </td>
       </tr>
       <tr>
        <td colspan="1">제목</td>        
        <td colspan="5">${ boardVo.title } </td>
       </tr>

       <tr>
        <td>작성일</td>        
        <td>${ boardVo.writedate } </td>
        <td>작성자</td>        
        <td>${ boardVo.nickname }</td>
        <td style="text-align:right; border-right-style:hidden;">🥇추천수 &nbsp; ${ boardVo.recommend }🥇</td>
        <td> 
         <form action="/Board2/Recommend"  id = "form1" method="post">
              <input type="hidden" name="bseq" value="${boardVo.bseq}">
              <input type="hidden" name="email2" id="email2" value="${boardVo.email}">
              <input type="hidden" name="email" id="email" value="${sessionScope.email}">
        	 <input type="submit"  id="recBtn" value= "👍추천하기" >
         </form>
       </td>
       </tr>
       <tr>
        <td>내용</td>
        <td colspan="5">${ boardVo.cont }</td>
       </tr>
       <tr>
        <td colspan="6"> 
        <c:set var="email"  value="${ boardVo.email }" />
        <c:if test="${ email eq sessionScope.email}">      
        [<a href="/Board2/UpdateForm?bseq=${boardVo.bseq}&menu_id=${boardVo.menu_id}">수정</a>]        
        [<a href="/Board2/Delete?bseq=${boardVo.bseq}&menu_id=${boardVo.menu_id}">삭제</a>]       
        </c:if> 
        [<a href="javascript:history.back()">이전으로</a>]        
        [<a href="/">Home</a>]        
        </td>
       </tr>
      </table> 
      
   </div>
   <div style="height:300px;"></div>
</body>
</html>






