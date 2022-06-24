<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link rel="stylesheet" href="/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
  h2 {text-align:center;}
  #board  td:first-child { width:150px; text-align:center;}
  #board  td:first-child { text-align:left;}
  #board  td:last-child { text-align:center;}
  table, th, td {  
      border : 10px solid  #E0E0E0;;
	  border-collapse : collapse;

   }
  #board  input     { width:100%; }
  #board  textarea  { width:100%; height: 400px;  }
  #board  [type=submit]  { width:40px; height: 30px; text-align:center;  }
  td {background-color:white;}
  body{background-color:#FCFFDF}
  h2{color:#1ABC9C;}
</style>
<script>
   $(document).ready(function(){
		$("#btnSave").click(function() {
			var title = $("#title").val();
			var cont  = $("#cont").val();
			if(title == null){
				alert('제목을 입력하세요');
				document.form1.title.focus();
				return;
			}
			if(cont == ""){
				alert('내용을 입력하세요');
				document.form1.cont.focus();
				return;
			}
			document.form1.submit();
			});
	});
</script>
</head>
<body>
<div id="main">
    
    <!--  새글 쓰기 -->   
    <%-- <form action="/Board/Write?menu_id=${menu_id}" id="form1" method="POST"> --%>
    <form action="/Board/Write2" id="form1" method="POST">
      <input type="hidden" name="menu_id" value="MENU02" />   
      <input type="hidden" name="qseq"    value="${qseq}" />   
      <input type="hidden" name="bnum"    value="${vo.bnum}" />   
      <input type="hidden" name="lvl"     value="${vo.lvl}" />   
      <input type="hidden" name="step"    value="${vo.step}" />   
      <input type="hidden" name="nref"    value="${vo.nref}" />   
         
      <table id="board">
       <caption>
       <c:choose>
         <c:when test="${sessionScope.email == 'www.admin@admin.com'}">
       		 <h2>문의 답글 작성</h2>
         </c:when>
         <c:otherwise>
         	<h2>1:1 문의 작성</h2>
         </c:otherwise>
       </c:choose>
       </caption>
       <tr>
        <td>제목</td>
        <td><input type="text" name="title" value="${ vo.title }" /></td>
       </tr>
       <tr>
        <td>글쓴이</td>
        <c:choose>
        <c:when test="${ vo.email eq null}">
        <td><input type="text" name="email" value="${sessionScope.email}" readonly /></td>
        </c:when>
        <c:otherwise>
        <td><input type="text" name="email" value="${vo.email}" readonly /></td>
        </c:otherwise>
        </c:choose>
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






