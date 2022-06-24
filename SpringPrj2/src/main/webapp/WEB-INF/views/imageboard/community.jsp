<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<style>
	 #submenu a:hover{background-color: aliceblue;}
     #submenu a{display: inline-block; width: 88%;}
     table,tr,th,td{border: 1px solid black; border-collapse: collapse;}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function () {
	    $('#Write').on('click',function () {
	        location.href="/Board/Community/ImageWriteForm"
	    })
	    $('#boardmenutable th a').on('click',function (e) {
	        //e.preventDefault();
	        //e.stopPropagation();
	        //if($(e.target).html()=='추천순'){
		    //    $(e.target).parent().parent().children().eq(0).children().css('background-color','white');
	        //	$(e.target).css('background-color','#CCFF99');	        	
	        //}
	        //else if($(e.target).html()=='최신순'){
		    //    $(e.target).parent().parent().children().eq(1).children().css('background-color','white');
	        //	$(e.target).css('background-color','#CCFF99');	        	
	        //}
	    })
	    $('#boardmenutable th:eq(0) a').click();
	})
	function list(page) {
	    location.href="/Board/Community/View?menu_id=MENU13&curPage="+page+"&searchOption=title"+"&keyword=&order=date";
	}
</script>
</head>
<body>
<!-- 메뉴 -->
	<%@ include file="/WEB-INF/include/menu.jsp" %>
	<hr>
    <div id="contents" style="display: grid; grid-template-columns: 15% 85%; margin: 0 auto; width: 80%;">
    	<div id="submenu" style="padding-top: 30px; background-color: #F6C6BD; margin-right:15px; border-radius: 15px; height: 500px;">
        	<a href="/Board2/Trlist?menu_id=MENU03">여행 추천</a>
            <br>
            <br>
            <a href="/Board2/Trlist?menu_id=MENU04">여행 Tip</a>
            <br>
            <br>
            <a href="/Board2/Trlist?menu_id=MENU05">자유 게시판</a>
            <br>
            <br>
            <a href="/Board/Community/View?menu_id=MENU13&order=date">여행 사진</a>
         </div>
         <div id="_main" style="margin-left: 20px;">
            <h2 style="margin-block-end: 0">여행 사진</h2>
            <hr style="width: 150px; float: left;"><br>
              <!-- 게시물 갯수 출력 -->
              ${map.count}개의 게시물이 있습니다.<br><br>
              <!--  게시물 목록 -->
               <div id="boardmenu" style="padding-bottom: 30px;">
                  <table id="boardmenutable" style="border: 1px solid black;">
                  <tbody><tr>
                         <!-- 현재 페이지이면 하이퍼링크 제거 -->
                            <c:choose>
                                <c:when test="${map.order == 'date'}">
                                    <th><a href="/Board/Community/View?menu_id=MENU13&order=date" style="display: inline-block; width: 150px; background-color:CCFF99;">최신순</a></th>
                  					  <th><a href="/Board/Community/View?menu_id=MENU13&order=recomm" style="display: inline-block; width: 150px;">추천순</a></th>
                  	
                                </c:when>
                                <c:otherwise>
                                   <th><a href="/Board/Community/View?menu_id=MENU13&order=date" style="display: inline-block; width: 150px;">최신순</a></th>
                   					 <th><a href="/Board/Community/View?menu_id=MENU13&order=recomm" style="display: inline-block; width: 150px; background-color:CCFF99;">추천순</a></th>
                  	
                                </c:otherwise>
                          </c:choose>
             
                  </tr>
                  </tbody></table>
            
              </div>
              <div id="mainboard" style="box-sizing: content-box; padding-bottom: 30px;">
                <table id="asd" style=" border-top: 0px; border-bottom: 0px; border-right: 0px;">
                      <tbody><tr style=" border-top: 0px; border-bottom: 0px; border-right: 0px;">
                             <c:forEach  var="board" items="${map.list}">
                                <td>
                                    <img src="/img/${board.sfilename}" alt="" style="width: 150px;height: 130px;"><br>
                                    <a href="/Board/Community/BoardView?menu_id=MENU13&bseq=${board.ccseq}">${board.title}</a>
                                </td>
                                <td style="width: 20px; border-top:0px; border-bottom: 0px; border-right: 0px;"></td>    
                            </c:forEach> 
                        </tr>
                </tbody></table>
              </div>
              
              <div id="paging">
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
              </div>
              <div><button id="Write">사진올리기</button></div><br>
            
            
              <div id="search">
              <form name="form1" method="post" action="/Board/List">
                  <select name="searchOption">
                      <option value="all">전체</option>
                      <option value="title" selected="">제목</option>
                      <option value="cont">내용</option>
                      <option value="email">작성자</option>
                  </select>
                  <input name="keyword" value="">
                      <input type="submit" value="조회">
                  </form>
                      </div>	
                      <br>
                      <br>
                 </div> 
                </div>
</body>
</html>