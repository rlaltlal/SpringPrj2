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
  }
  $(function () {
	$('#form1').on('submit',function (e) {
		e.preventDefault();
		e.stopPropagation();
		let cont=$('#cont').val();
		let cont1=$('#cont1').val();
		console.log(cont+','+cont1);
		console.log($(this).prop('action'));
		$('#cont').val(cont+','+cont1);
		this.submit();
	})
  })
</script>
</head>
<body>
 <!-- 메뉴 -->
	<%@ include file="/WEB-INF/include/menu.jsp" %>
	<hr>
        <div id="contents" style="display: grid; grid-template-columns: 15% 65%; margin: 0 auto; width: 80%; ">
            
        
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
            <div id="main" style="margin-left: 20px; display: inline-block; box-sizing: content-box;">

                <form action="/Board/Community/ImageWrite" id="form1" method="POST">
                  <input type="hidden" name="menu_id" value="MENU13">   
                  <input type="hidden" name="bnum" value="0">   
                  <input type="hidden" name="lvl" value="0">   
                  <input type="hidden" name="step" value="0">   
                  <input type="hidden" name="nref" value="0">   
                  <input type="hidden" name="email" value="${sessionScope.email}">   
                  <div id="writetable">
                      <table id="board" style="width: 100%;">
                         <caption>
                             <h2>사진 올리기</h2>
                         </caption>
                         <tbody>
                        <tr>
                            <td style="padding: 7px; width: 20%; text-align: center;">제목</td>
                            <td style="padding-left: 7px;" colspan="3"><input type="text" name="title" id="title" value="" style="width: 90%;"></td>
                       </tr>
                        <tr>
                            <td style="padding: 7px; width: 20%; text-align: center;">글쓴이</td>
                            <td style="padding-left: 7px;" colspan="3">${sessionScope.nickname}</td>
                       </tr>
                        <tr>
                            <td style="padding: 7px; width: 20%; text-align: center;">카테고리</td>
                            <td style="padding-left: 7px;">
								<select name="cate" id="cate" style="width: 90%;">
									<option value="0">카테고리</option>
									<option value="1">관광 명소</option>
									<option value="2">풍경 사진</option>
									<option value="3">숙박 시설 사진</option>
								</select></td>
                            <td style="padding: 7px; width: 20%; text-align: center;">장소</td>
                            <td style="padding-left: 7px;"><input type="text" name="cont1" id="cont1"></td>
                       </tr>
                        <tr>
                            <td style="padding: 7px; width: 20%; text-align: center;">이미지 파일</td>
                            <td style="padding-left: 7px;" colspan="3"><input type="file"></input></td>
                       </tr>
                       <tr style="height: 300px;">
                        <td style="padding: 7px; width: 20%; text-align: center;">내용</td>
                        <td style="padding-left: 7px; " colspan="3">
                            <textarea name="cont" id="cont" style="width: 90%; height: 280px"></textarea></td>
                        </tr>
                </tbody>
            </table><br> 

            <input type="submit" value="저장하기" style="float: right; width: 80px; height: 40px;">        
                  </div>
    </form>
            </div>
                </div>
</body>
</html>






