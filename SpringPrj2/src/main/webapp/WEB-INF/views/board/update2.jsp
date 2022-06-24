<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link rel="stylesheet" href="/css/common.css" />
<style>
  #boardUpdate  td:nth-of-type(1) { width:150px; text-align:center;}
  #boardUpdate  td:nth-of-type(2) { width:400px; text-align:left;}
  #boardUpdate  td:nth-of-type(3) { width:150px; text-align:center;}
  #boardUpdate  td:nth-of-type(4) { width:400px; text-align:left;}
  
  #boardUpdate  tr:nth-of-type(3) { height : 400px; vertical-align: top; }
  table, th, td {  
      border : 10px solid  #E0E0E0;;
	  border-collapse : collapse;

   }
  td {background-color:white;}
  body{background-color:#FCFFDF}
  h2{color:#1ABC9C;}
  #boardUpdate  input     { width:100%; }
 .boardUpdate2 { text-align:center;}
  #boardUpdate  textarea  { width:100%; height: 400px;  }
  
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $( function() {
	  $('form').on('submit', function(e) {
		  if( $('[name=title]').val().trim() == ''   ) {
			  alert('제목을 입력하세요');
		  	  return false;
		  }
		  // jqeury 에서는 return false는 아래 두 문장과 동일
		  //e.preventDefault();
		  //e.stopPropagation();
	  });
	  
	  $('#btnList').on('click', function() {
		  let    url     =  '/Board/List2?menu_id=${menu_id}';
		  location.href  =  url;
	  } )
	  	
	  $('#btnLinkList').on('click', function(e){
		  e.preventDefault(); // 먼저수행하고 기능 구현
		  e.stopPropagation();
		  
		//  let    url     =  '/Board/List?menu_id=${menu_id}';
		  let    url     =  $(this).prop('href');
		  location.href  =  url;		  
	  })
	
	   // a tag 를 버튼 으로 사용하려면
	   // a tag는 클릭하면 href 로 이동한다, href가 비어있으면 새로고침
	   // 새로고침을 막아야 버튼 사용가능
	   $('#btn1').on('click', function(e) {
		   e.preventDefault(); // 먼저수행하고 기능 구현
		   e.stopPropagation();

		   
	   })
	  
  })
</script>
</head>
<body>
  <div id="main">
    <%-- <!-- 메뉴 목록 -->
    <%@include file="/WEB-INF/include/menus.jsp"  %> --%>
    
    <!-- 게시물 수정 -->
    <form action="/Board/Update2" method="POST">
    <input type="hidden" name="qseq"     value="${ boardVo.qseq  }" /> 
    <input type="hidden" name="menu_id" value="${ menu_id } " />  
    <table  id="boardUpdate">
     <caption><h2>게시글 수정</h2></caption>
       <tr>
        <td colspan="1">제목</td>        
        <td colspan="3"><input type="text" name="title" value="${ boardVo.title }" /> </td>
       </tr>
       <tr>
        <td>작성일</td>        
        <td>${ boardVo.writedate } </td>
        <td>작성자</td>        
        <td>관리자</td>
       </tr>
       <tr>
        <td>내용</td>
        <td colspan="3"><textarea name="cont">${ boardVo.cont }</textarea></td>
       </tr>
       <tr>
    </table>
	<br>
    	<div class="boardUpdate2">      
         <input type="submit"  value="수정" id="btnUpdate" />
         <input type="button"  value="글 목록" id="btnList" />
       </div>
    </form>
   
  </div>
</body>
</html>














