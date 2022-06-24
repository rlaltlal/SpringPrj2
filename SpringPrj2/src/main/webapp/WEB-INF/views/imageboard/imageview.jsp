<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  // input validation
  window.onload = function() {
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
      $(function () {
        $('#btnDel').on('click',function (e) {
        	e.preventDefault();   // 기본이벤트 제거
		  	e.stopPropagation();
        	$(location).attr('href','/Board/Community/Delete?menu_id=${map.menu_id}&bseq=${map.bseq}');
            
        })
        $('#btnRecomm').on('click',function (e) {
        	e.preventDefault();   // 기본이벤트 제거
		  	e.stopPropagation();
            console.log(${boardVo.ccseq});
            $.ajax({ 
			url:'/RestBoard/BoardRecomm',
			data:{
                bseq:${boardVo.ccseq}
			},
			method:'POST'
            }).done(function (data) {
                console.log(data);	
                $('#recomm').val(data.recommend);
                
			})
			.fail(function (error,textStatus,errorThrown) {
				alert('Error :'+error)
			})

        })
      })

  }
  
</script>
</head>
<body>
 <!-- 메뉴 -->
	<%@ include file="/WEB-INF/include/menu.jsp" %>
	<hr>
        <div id="contents" style="display: grid; grid-template-columns: 15% 65%; margin: 0 auto; width: 80%; ">
            
        
            <div id="submenu" style="padding-top: 30px; background-color: #F6C6BD; margin-right:15px; border-radius: 15px; height: 500px;">
                <a href="/Board/Community/View?menu_id=MENU13">여행 추천</a>
                <br>
                <br>
                <a href="/Board/List2">여행 Tip</a>
                <br>
                <br>
                <a href="/Board/List2">자유 게시판</a>
                <br>
                <br>
                <a href="/Board/Community/View?menu_id=MENU13">여행 사진</a>
            </div>
            <div id="main" style="margin-left: 20px; display: inline-block; box-sizing: content-box;">

                <form action="/Board/Write" id="form1" method="POST">
                  <input type="hidden" name="menu_id" value="MENU01">   
                  <input type="hidden" name="bnum" value="0">   
                  <input type="hidden" name="lvl" value="0">   
                  <input type="hidden" name="step" value="0">   
                  <input type="hidden" name="nref" value="0">   
                  <div id="writetable">
                      <table id="board" style="width: 100%;">
                         <caption>
                             <h2></h2>
                         </caption>
                         <tbody>
                        <tr>
                            <td style="padding: 7px; width: 20%; text-align: center;">제목</td>
                            <td style="padding-left: 7px;" colspan="3">${boardVo.title}</td>
                       </tr>
                        <tr>
                            <td style="padding: 7px; width: 20%; text-align: center;">글번호</td>
                            <td style="padding-left: 7px; width: 200px;">${boardVo.ccseq}</td>
                            <td style="padding: 7px; width: 20%; text-align: center;">조회수</td>
                            <td style="padding-left: 7px;">${boardVo.readcount}</td>
                       </tr>
                        <tr>
                            <td style="padding: 7px; width: 20%; text-align: center;">글쓴이</td>
                            <td style="padding-left: 7px; width: 200px;">${boardVo.nickname}</td>
                            <td style="padding: 7px; width: 20%; text-align: center;">작성일</td>
                            <td style="padding-left: 7px;">${boardVo.writedate}</td>
                       </tr>
                        <tr>
                            <td style="padding: 7px; width: 20%; text-align: center;">카테고리</td>
                            <td style="padding-left: 7px;">${boardVo.subcategory}</td>
                            <td style="padding: 7px; width: 20%; text-align: center;">장소</td>
                            <td style="padding-left: 7px;">${spot}</td>
                       </tr>
                       <tr style="height: 300px;">
                        <td style="padding: 7px; width: 20%; text-align: center;">사진</td>
                        <td style="padding-left: 7px; " colspan="3">
                            <div id="innerdiv" style="display: grid; grid-template-columns: 50% 50%; ">
                                <div id="innerimg">
                                    <img src="/img/${boardVo.sfilename}" alt="" style="width: 290px; height: 290px;">
                                </div>
                                <div id="innertext">
                                    <textarea name="" id="" cols="30" rows="10"  style="width: 95%; height: 95%" readonly>${cont}</textarea>
                                </div>
                            </div>
                        </td>
                        </tr>
 		   </form>
                        <tr>
                            <td style="padding: 7px; width: 20%; text-align: center;" colspan="4">
                                추천수 : <input type="text" value="${boardVo.recommend}" readonly id="recomm"> <br><br> 
                                <button style=" width: 80px; height: 40px;" id="btnRecomm">추천하기</button>
                            </td>
                       </tr>
                </tbody>
            </table><br> 
            </div>
            <c:if test="${sessionScope.email eq boardVo.email}">
                <button style="float: right; width: 80px; height: 40px;margin: 10px;" id="btnEdit">수정하기</button>     
               <button style="float: right; width: 80px; height: 40px;margin: 10px;" id="btnDel">삭제하기</button>       
            </c:if>
            </div>
                </div>
</body>
</html>