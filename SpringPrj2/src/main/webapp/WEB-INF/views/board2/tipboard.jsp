<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<script>
	function list(page) {
		location.href="${path}/Board2/Trlist?curPage="+page+"&menu_id=${map.menu_id}"+"&subcate=${map.subcate}"+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
	}
	window.onload = function() {
		const  subcate = $('#subcate').val();

		if( subcate == 'PLAY' ){
			$("#button2").css("background-color", "#C8EBFA");
		} else	if( subcate == 'SLEEP' ){
			$("#button3").css("background-color", "#C8EBFA");
		} else	if( subcate == 'FOOD' ){
			$("#button4").css("background-color", "#C8EBFA");
		} else if( subcate == 'ETC2' ){
			$("#button5").css("background-color", "#C8EBFA");
		} else{
			$("#button1").css("background-color", "#FDF001");
		} 
			
	}
</script>
<style>
 h2 { font-size:40px; color:#C8EFD4;]}	
  #title { width:200px; height:auto; margin:0;
  		background-color : #FBCFD0;
      text-align:center;
      top:100px;
      padding:5px; 
      position: fixed;
      top:100px;}

  #main { width:80%; margin:auto 250px;}
  #board  td:nth-of-type(1)  { width:100px; text-align:center;}  
  #board  td:nth-of-type(2)  { width:500px; text-align:center;}  
  #board  td:nth-of-type(3)  { width:150px; text-align:center;}  
  #board  td:nth-of-type(4)  { width:100px; text-align:center;}  
  #board  td:nth-of-type(5)  { width:100px; text-align:center;}  

a { text-decoration:none; color:black;}


table, th, td {  
      border : 1px solid  #c0c0c0;
      border-collapse : collapse;
      
   }
   th, td {  padding:10px; text-align:center; }
   table { width:100%; height:auto;}
   
   #button1 { padding:0; width:150px; font-size:20px;}
   #button2 { padding:0; width:150px; font-size:20px;}
   #button3 { padding:0; width:150px; font-size:20px;}
   #button4 { padding:0; width:150px; font-size:20px;}
   #button5 { padding:0; width:150px; font-size:20px;}
   .buttons {font-size: 0; 
    line-height: 0;}
    .board2 {display:flex; justify-content:space-between; }
</style>
</head>
<body>
<!-- 메뉴 -->
	<%@ include file="/WEB-INF/include/menu.jsp" %>
	<hr>
 <div id="title">
   <h2><a href="/Board2/Trlist?menu_id=MENU03"   style="color:red; font-size:30px;">여행추천</a></h2><br>
   <h2><a href="/Board2/Trlist?menu_id=MENU04"   style="color:orange; font-size:30px;">여행 Tip</a></h2><br>
   <h2><a href="/Board2/Trlist?menu_id=MENU05"   style="color:green; font-size:30px;">자유 게시판</a></h2><br>
   <h2><a href="/Board/Community/View?menu_id=MENU13&order=date"   style="color:blue; font-size:30px;">여행사진</a></h2>
</div>
   <div  style="overflow-y:auto; overflow-x:hidden; ">

<div id="main">
<h2>여행 TIP</h2>
<div class="buttons">
<input type="button"  value="전체" id="button1" onclick="location.href='/Board2/Trlist?menu_id=MENU04'">	
<input type="button"  value="놀거리" id="button2" onclick="location.href='/Board2/Trlist?menu_id=MENU04&subcate=PLAY'">	
<input type="button"  value="숙소" id="button3" onclick="location.href='/Board2/Trlist?menu_id=MENU04&subcate=SLEEP'">	
<input type="button"  value="맛집" id="button4" onclick="location.href='/Board2/Trlist?menu_id=MENU04&subcate=FOOD'">	
<input type="button"  value="기타" id="button5" onclick="location.href='/Board2/Trlist?menu_id=MENU04&subcate=ETC2'">	
<input type="text"  id="subcate" value="${map.subcate}" style="display:none;">	
</div>

  <!--  게시물 목록 -->
  <table id="board">
  <tr>
    <th>No.</th>
    <th>제목</th>
    <th>글쓴이</th>
    <th>추천수</th>
    <th>조회수</th>
  </tr>
  <c:forEach var="recommend" items="${map.list2}">
      <tr style="background-color: #FFF766;">
      <td>
      	${ recommend.bseq }
      </td>
      <td>
        <a href="/Board2/View?bseq=${recommend.bseq}">${recommend.title}</a>
      </td>
      <td>${ recommend.nickname }</td>
      <td>${ recommend.recommend }</td>
      <td>${ recommend.readcount }</td>
    </tr>
  </c:forEach>
  <c:forEach  var="board" items="${map.list}">
    <tr>
      <td>
      	${ board.bseq }
      </td>
      <td>
        <a href="/Board2/View?bseq=${board.bseq}">${board.title}</a>
      </td>
      <td>${ board.nickname }</td>
      <td>${ board.recommend }</td>
      <td>${ board.readcount }</td>
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
<br>
  <div class="board2">
  <div>
  <form name="form1" method="post" action="/Board2/Trlist">
    	<input type='hidden' name='subcate' value='${map.subcate}'>
  	<input type='hidden' name='menu_id' value='${map.menu_id}'>
  	<select name="searchOption">
  		<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >전체</option>
  		<option value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
  		<option value="cont" <c:out value="${map.searchOption == 'cont'?'selected':''}"/> >내용</option>
  	</select>
  	<input name="keyword" value="${map.keyword}">
  	<input type="submit" value="조회"> &nbsp &nbsp 🔍 ${map.count}개의 게시물이 있습니다.
  </form>   
  </div>
  <div>
              <c:choose>
		           <c:when test="${sessionScope.email eq null}">
		  	           <a href="/login" style="padding-right: 20px ;">글쓰기</a>
		           </c:when>
		           <c:otherwise>
   <h2><a href="/Board2/WriteForm?menu_id=MENU03&email=${sessionScope.email}"   style="font-size:25px;">글쓰기</a></h2><br>
		            </c:otherwise>
           	</c:choose>  </div>
  </div>	
   <br>
   <br>

 </div> 
 </div> 
</body>
</html>







