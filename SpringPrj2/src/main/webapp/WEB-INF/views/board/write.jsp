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
  #board  td:first-child { width:150px; text-align:center;}
  #board  td:first-child { text-align:left;}
  table, th, td {  
      border : 10px solid  #E0E0E0;;
	  border-collapse : collapse;

   }
    #board  td:last-child { text-align:center;}
  #board  input     { width:100%; }
  #board  textarea  { width:100%; height: 400px;  }
  #board  [type=submit]  { width:40px; height: 30px; text-align:center;  }
  td {background-color:white;}
  body{background-color:#FCFFDF}
  h2{color:#1ABC9C;}
</style>
<script>
  // input validation
    $(function() {	
	  var form1El = document.getElementById('form1');
	  form1El.addEventListener('submit', function(e) {
		  // 필수 입력 제목, 글쓴이
		  const  titleEl = document.querySelector('[name=title]');
		  if(  titleEl.value.trim() == ''  ) {
			  alert('제목을 입력하세요');
			  e.preventDefault();   // 기본이벤트 제거
		  	  e.stopPropagation();  // 이벤트 버블링 방지 - 다른 이벤트에 영향을 주지 못함
		  } 
		  		  
	  } );
  }
</script>
</head>
<body>
   <div id="main">
    
    <!--  새글 쓰기 -->   
    <%-- <form action="/Board/Write?menu_id=${menu_id}" id="form1" method="POST"> --%>
    <form action="/Board/Write" id="form1" method="POST">
      <input type="hidden" name="menu_id" value="MENU01" />   
      <input type="hidden" name="bnum"    value="${vo.bnum}" />   
      <input type="hidden" name="lvl"     value="${vo.lvl}" />   
      <input type="hidden" name="step"    value="${vo.step}" />   
      <input type="hidden" name="nref"    value="${vo.nref}" />      
      
      <table id="board">
       <caption>
       		 <h2>공지 글 등록하기</h2>
       </caption>
       <tr>
        <td>제목</td>
        <td><input type="text" name="title" value="${ vo.title }" /></td>
       </tr>
       <tr>
        <td>작성자</td>
        <td><input type="text" name="email" value="${sessionScope.email}" readonly/></td>
       </tr>
       <tr>
        <%-- <td>글쓴이</td>
        <td><input type="text" name="email" value="${ vo.nickname }" /></td> --%>
       </tr>
       <tr>
        <td>내용</td>
        <td><textarea name="cont">${ vo.cont }</textarea></td>
       </tr>
       <tr>
        <td colspan="2">
        <input type="submit" value="저장" />        
        </td>
       </tr>
      </table> 
    </form>
   </div>
</body>
</html>






