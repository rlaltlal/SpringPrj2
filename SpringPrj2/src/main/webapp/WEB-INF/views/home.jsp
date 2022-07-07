<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>   
<head>
<meta charset="UTF-8">
<title>Github test???<title>
<style>
    #bannerdiv{width: 100%;padding-bottom: 10px;}
    #bannerimg{width: 100%;height: 300px;}
    body{width: 100%;}
    #main{width: 800px; margin: 0 auto; }
    #board,tr,th{border: 1px solid black;border-collapse: collapse;}
    #board,tr,td{border: 1px solid black;border-collapse: collapse;}
    #board{margin: 0 auto;}
    #items{display: grid; grid-template-columns: auto auto auto;
        column-gap: 10px}
    #title{display: inline-block; width:100%; text-align:center; }
    #cell  { float:right; display: inline-block; } 
    ul li { list-style-type : none; float: left; 
    		outline: 1px dotted green; margin-left: 20px; }
    #buttons {font-size:0.3px; padding:2px;}
    #button1 {  background-color: lightgray; width: 87px; height:35px; text-align: center; border-width:thin; font-size:16px;}
    #button2 {  background-color: lightgray; width: 87px; height:35px; text-align: center; border-width:thin; font-size:16px;}
    #button3 {  background-color: lightgray; width: 87px; height:35px; text-align: center; border-width:thin; font-size:16px;}
    #button4 {  background-color: lightgray; width: 87px; height:35px; text-align: center; border-width:thin; font-size:16px;}
    #button5 {  background-color: lightgray; width: 87px; height:35px; text-align: center; border-width:thin; font-size:16px;}

</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(function () {
    $('#items button').on('click',function (e) {
        switch($(e.target).parent().parent().attr('id')){
          case 'item1': $(location).attr('href','/search?set=item1'); break;
          case 'item2': $(location).attr('href','/search?set=item2'); break;
          case 'item3': $(location).attr('href','/search?set=item3'); break;
            
      }
    })
  })
</script>
<script>
function tableCreate(i){
	
	var tc = [];
	
	if(i == 2) {
	<c:forEach var="recommend" items="${map.list2}">
	tc.push({bseq : '${ recommend.bseq }', title: '${recommend.title}', nickname : '${recommend.nickname}',
			recommend : '${recommend.recommend}', readcount : '${recommend.readcount}'});
	</c:forEach>
	}
	if(i == 3) {
		<c:forEach var="recommend" items="${map.list3}">
		tc.push({bseq : '${ recommend.bseq }', title: '${recommend.title}', nickname : '${recommend.nickname}',
				recommend : '${recommend.recommend}', readcount : '${recommend.readcount}'});
		</c:forEach>
		}
	if(i == 4) {
		<c:forEach var="recommend" items="${map.list4}">
		tc.push({bseq : '${ recommend.bseq }', title: '${recommend.title}', nickname : '${recommend.nickname}',
				recommend : '${recommend.recommend}', readcount : '${recommend.readcount}'});
		</c:forEach>
		}
	if(i == 5) {
		<c:forEach var="recommend" items="${map.list5}">
		tc.push({bseq : '${ recommend.bseq }', title: '${recommend.title}', nickname : '${recommend.nickname}',
				recommend : '${recommend.recommend}', readcount : '${recommend.readcount}'});
		</c:forEach>
		}
	if(i == 6) {
		<c:forEach var="recommend" items="${map.list6}">
		tc.push({bseq : '${ recommend.bseq }', title: '${recommend.title}', nickname : '${recommend.nickname}',
				recommend : '${recommend.recommend}', readcount : '${recommend.readcount}'});
		</c:forEach>
		}
		
	var html = '';
	for(key in tc){
	html += '<tr style="background-color: #FFFFE0">';
	html += '<td style="padding: 7.5px; border-radius:4px;">'+tc[key].bseq+'</td>';
	html += '<td style="padding: 7.5px; border-radius:4px;">'+tc[key].title+'</td>';
	html += '<td style="padding: 7.5px; border-radius:4px;">'+tc[key].nickname+'</td>';
	html += '<td style="padding: 7.5px; border-radius:4px;">'+tc[key].recommend+'</td>';
	html += '<td style="padding: 7.5px; border-radius:4px;">'+tc[key].readcount+'</td>';
	html += '</tr>';
	}
				
	$("#dynamicTbody").empty();
	$("#dynamicTbody").append(html);
				
	}           

   

</script>   

<body>
    <!-- 메뉴 -->
	<%@ include file="/WEB-INF/include/menu.jsp" %>
     <div id="bannerdiv" >
        <img src="/img/banner2.png" alt="" id="bannerimg">
    </div>
    <div id="main">
        <b id="title" style="padding-bottom: 10px; font-size: 20px;">        유저 추천 여행 코스</b><br>
        <div id="maintable">
            <div id="maintableheader">
                <div id = "buttons">
                 <input type="button"  value="전체" id="button1"  onclick="tableCreate(2);">	
                 <input type="button"  value="서울" id="button2"  onclick="tableCreate(3);">	
                 <input type="button"  value="부산" id="button3"  onclick="tableCreate(4);">	
                  <input type="button"  value="제주" id="button4" onclick="tableCreate(5);">	
                  <input type="button"  value="기타" id="button5" onclick="tableCreate(6);">	
                  </div>
            </div>
            <div id="maintablecontents">
                <table style="margin:0 auto ; width: 100%;">
                    <tr style="background-color: lightgray">
                        <td style="padding: 7.5px; border-radius:4px;">
                        글번호
                        </td>
                        <td style="padding: 7.5px; border-radius:4px;">
                        제목</a>
                        </td>
                        <td style="padding: 7.5px; border-radius:4px;">작성자</td>
                        <td style="padding: 7.5px; border-radius:4px;">추천수</td>
                        <td style="padding: 7.5px; border-radius:4px;">조회수</td>
                    </tr>
                    <tbody id="dynamicTbody">
                    <c:forEach var="recommend" items="${map.list2}">
	                    <tr style="background-color: #FFFFE0">
	                        <td style="padding: 7.5px; border-radius:4px;">
	                        ${ recommend.bseq }
	                        </td>
	                        <td style="padding: 7.5px; border-radius:4px;">
	                        <a href="/Board2/View?bseq=${recommend.bseq}">${recommend.title}</a>
	                        </td>
	                        <td style="padding: 7.5px; border-radius:4px;">${recommend.nickname}</td>
	                        <td style="padding: 7.5px; border-radius:4px;">${recommend.recommend}</td>
	                        <td style="padding: 7.5px; border-radius:4px;">${recommend.readcount}</td>
	                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="package">
            <div>
                <b id="title" style="font-size: 20px; padding: 10px;">Trip Greens 추천 여행 패키지</b>
            </div>
            <div id="items" style="border: 1px solid gray; padding: 10px;text-align: center;">
                <div id="item1" style="border-right: 1px solid gray; text-align: center;"> 
                    <img src="/img/b.png" alt="" srcset=""><br>
                    <div>
                      <b>한옥을 느낄수 있는 전주</b><br>
                    </div>
                    <b>2인기준 : 250,000원</b><br>
                    <div style="padding: 9.1px;">
                        <button>바로예약</button>
                    </div>
                </div>
                <div id="item2" style="text-align: center; border-right: 1px solid gray;"> 
                    <img src="/img/c.png" alt="" srcset=""><br>
                    <div>
                      <b>한국의 랜드마크 서울</b><br>
                    </div>
                    <b>2인기준 : 350,000원</b><br>
                    <div style="padding: 9.1px;">
                        <button>바로예약</button>
                    </div>
                </div>
                <div id="item3"> 
                   <img src="/img/a.jpg" alt=" " srcset="" style="width:210px;height:150px"><br>
                   <div>
                     <b>힐링과 낭만의 도시 여수</b><br>
                   </div> 
                    <b>2인기준 : 250,000원</b><br>
                    <div style="padding: 9.1px;">
                        <button>바로예약</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

	</body>
</html>
