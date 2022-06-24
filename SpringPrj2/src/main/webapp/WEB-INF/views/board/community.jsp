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
	        e.preventDefault();
	        e.stopPropagation();
	        $(e.target).parent().parent().children().css('background-color','white');
	        $(e.target).parent().css('background-color','#CCFF99');
	    })
	    $('#boardmenutable th:eq(0) a').click();
	})
	function list(page) {
	    location.href="/Board/List?curPage="+page+"&searchOption=title"+"&keyword=";
	}
</script>
</head>
<body>
<!-- 메뉴 -->
	<%@ include file="/WEB-INF/include/menu.jsp" %>
	<hr>
    <div id="contents" style="display: grid; grid-template-columns: 15% 85%; margin: 0 auto; width: 80%;">
    	<div id="submenu" style="padding-top: 30px; background-color: #F6C6BD; margin-right:15px; border-radius: 15px; height: 500px;">
        	<a href="/Board/Community?menu_id=MENU13">여행 추천</a>
            <br>
            <br>
            <a href="/Board/List2">여행 Tip</a>
            <br>
            <br>
            <a href="/Board/List2">자유 게시판</a>
            <br>
            <br>
            <a href="/Board/Community?menu_id=MENU13">여행 사진</a>
         </div>
         <div id="main" style="margin-left: 20px;">
            <h2 style="margin-block-end: 0">여행 사진</h2>
            <hr style="width: 150px; float: left;"><br>
              <!-- 게시물 갯수 출력 -->
              10개의 게시물이 있습니다.<br><br>
              <!--  게시물 목록 -->
              <div id="boardmenu" style="padding-bottom: 30px;">
                  <table id="boardmenutable" style="border: 1px solid black;">
                  <tbody><tr>
                    <th><a href="/Board/Community?menu_id=MENU13" style="display: inline-block; width: 150px;">추천순</a></th>
                    <th><a href="/Board/Community?menu_id=MENU13" style="display: inline-block; width: 150px;">최신순</a></th>
                  </tr>
                  </tbody></table>
            
              </div>
              <div id="mainboard" style="box-sizing: content-box; padding-bottom: 30px;">
                <table id="asd" style=" border-top: 0px; border-bottom: 0px;">
                      <tbody><tr style=" border-top: 0px; border-bottom: 0px;">
                          <td>
                                <img src="/img/Desert.jpg" alt="" style="width: 150px;height: 130px;"><br>
                                <a href="/Board/Community/View?menu_id=MENU13?bseq=">제목</a>
                            </td>
                            <td style="width: 20px; border-top:0px; border-bottom: 0px;"></td>
                            <td>
                                <img src="/img/Desert.jpg" alt="" style="width: 150px;height: 130px;"><br>
                                <a href="/Board/Community?menu_id=MENU13">제목</a>
                            </td>
                            <td style="width: 20px; border-top:0px;  border-bottom: 0px;"></td>
                            <td>
                                <img src="/img/Desert.jpg" alt="" style="width: 150px;height: 130px;"><br>
                                <a href="/Board/Community?menu_id=MENU13">제목</a>
                            </td>
                            <td style="width: 20px; border-top:0px; border-bottom: 0px;"></td>
                            <td>
                                <img src="/img/Desert.jpg" alt="" style="width: 150px;height: 130px;"><br>
                                <a href="/Board/Community?menu_id=MENU13">제목</a>
                            </td>
                            <td style="width: 20px; border-top:0px; border-bottom: 0px;" ></td>
                          <td>
                              <img src="/img/Desert.jpg" alt="" style="width: 150px;height: 130px;"><br>
                                <a href="/Board/Community?menu_id=MENU13">제목</a>
                            </td>
                        </tr>
                </tbody></table>
              </div>
              <div id="paging"></div>
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







