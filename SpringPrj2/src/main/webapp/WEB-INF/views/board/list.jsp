<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<!-- <link rel="stylesheet" href="/css/common.css" /> -->
<script>
   function list(page) {
      location.href="${path}/Board/List?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
   }
</script>
<style>
   
  #title { width:100px; height:100px; margin:0;
      background-color:#D35400;
      text-align:center;
      padding:5px; 
      position: fixed;
      margin-top: 4.5%;
      margin-left: 10%;}

#main { position: fixed; top:150px; left:250px; width:80%; margin:0 auto; padding:5px;}
#main2 { position: fixed; top:70px; left:25%; width:80%; margin:0 auto; padding:5px;}
#board {left:800px;}

a { text-decoration:none; color:black; }
table, th, td {  
      border : 10px solid  #E0E0E0;;
      border-collapse : collapse;
      
   }
   th, td {  padding:10px; text-align:center;}
   td {background-color:white;}
    body{background-color:#FCFFDF}
     h2{color:#1ABC9C;}
   table { width:70%; height:50%;}
    #a {background-color:#9E9E9E;}
    .head {color:white; margin-top:30%}
    table {margin-left:auto; margin-right:auto;}
    #title2 {margin-left:auto; padding-let}
    #board2 {margin-left:15%}
    
   
</style>
</head>
<body>
<!-- 메뉴 -->
   <%@ include file="/WEB-INF/include/menu.jsp" %>
   <hr>
<div id="title">
<h2 class="head">고객센터</h2>
<br>
<br>
<br>
<a href="/Board/List">FAQ</a>
<br>
<br>
<a href="/Board/List2">1:1 문의</a>
</div>

<div id="main">
<br>
<div id="main2">
<h2>FAQ</h2>

  <!-- 게시물 갯수 출력 -->
  ${map.count}개의 게시물이 있습니다.
</div>
  <!--  게시물 목록 -->
  <table id="board">
  <tr id="a">
    <th>No.</th>
    <th>제목</th>
    <th>글쓴이</th>
    <th>날짜</th>
  </tr>
  <c:forEach  var="board" items="${map.list}">
    <tr>
      <td>
         ${ board.qseq }
      </td>
      <td>
        <b style="display:inline-block;width:${board.lvl*20}px"></b>
        <a href="${path}/Board/View?qseq=${board.qseq}&title=${board.title}">${board.title}</a>
      </td>
      <td>${board.nickname}</td>
      <td>${ board.writedate }</td>
    </tr>
  </c:forEach>  
  </table>
  <table>
     <tr>
     <td colspan="5">
        <!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면 [처음]링크를 화면에 출력  -->
            <a href="javascript:list('1')">[처음]</a> 
         
         <!-- 이전페이지 블록으로 이동 : 현재페이지 블럭이 1보다 크면 [이전]링크를 화면에 출력  -->
         <c:if test="{map.boardPager.curBlock > 1}">
            <a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
         </c:if>
         
         <!-- 하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
         <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
            <!-- 현재 페이지이면 하이퍼링크 제거 -->
            <c:choose>
               <c:when test="${num == map.boardPager.curPage}">
                  <span style="color:red">${num}</span>&nbsp;
               </c:when>
               <c:otherwise>
                  <a href="javascript:list('${num}')">${num}</a>&nbsp;
               </c:otherwise>
         </c:choose>
      </c:forEach>
      
      <!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 -->
      <!-- 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
      <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
         <a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
      </c:if>      
      
      <!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면  -->
      <!-- [끝] 링크 화면에 출력 -->
      <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
         <a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
      </c:if>
      </td>
      <tr>
  </table>


  <div id="board2">
  <c:if test="${sessionScope.email == 'www.admin@admin.com'}">
  <a href="/Board/WriteForm">공지글 등록 하기</a>
  </c:if>
  <form name="form1" method="post" action="${path}/Board/List">
     <select name="searchOption">
        <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >전체</option>
        <option value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
        <option value="cont" <c:out value="${map.searchOption == 'cont'?'selected':''}"/> >내용</option>
        <option value="t.email" <c:out value="${map.searchOption == 'email'?'selected':''}"/> >이메일</option>
     </select>
     <input name="keyword" value="${map.keyword}">
     <input type="submit" value="조회">
  </form>
     </div>   
   <br>
   <br>
 </div> 
</body>
</html>





