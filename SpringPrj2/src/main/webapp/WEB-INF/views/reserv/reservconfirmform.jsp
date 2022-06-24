<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#list1, #list1_1, #list2,th,tr{border: 1px solid black; border-collapse: collapse; margin: 0 auto;}
   #list1, #list1_1, tr th{background-color: gainsboro;}
   #list2 tr th{background-color: gainsboro;}
    #main {width:750px; margin:0 auto; text-align: center;}
    #div1,#div3,#div4{width:100%; margin:0 auto; text-align: center;}   
    #title{display: inline-block; width:100%; text-align:center; }
   #cell  {display: inline-block; justify-self: right;} 
   ul li { list-style-type : none; float: left; 
          outline: 1px dotted green; margin-left: 20px; }
   #menu{display: grid; grid-template-columns: auto auto; padding-bottom: 10px;}
   #selection{background-color: gainsboro; margin-top: 50px; 
      height: 170px; vertical-align: middle; padding: 30px;}
    #selection input:not(#date1,#date2){width: 80px;}
    #seatpopup input,#list2seatpopup input{width: 80px;}
   #search{float: right;}
   #list1,#list1_1,  tr:hover td{background-color: antiquewhite;}
   #list2 tr:hover td{background-color: antiquewhite;}
   #div1{display: grid; grid-template-columns: 90% 10%;}
   #div1_1_1{box-sizing: border-box; display: inline-block;}
   #div1_1_1_1{text-align: left;}
   #div3{display: grid; grid-template-columns: 90% 10%;}
   #div3_1_1{box-sizing: border-box; display: inline-block;}
   #div3_1_1_1{text-align: left;}
   #div2{margin-bottom:20px;}
   #div1_1{margin-bottom:20px;}
   #div3_1{margin-bottom:20px;}
   #seatchoose,#seatclose,#seatchosen{text-decoration: none;color: black;}
   #seatchoose:visited,#seatclose:visited,#seatchosen:visited{text-decoration: none;}
   .modal{
        position: absolute;
        width: 100%; height: 100%;
        background: rgba(0,0,0,0.8);
        top:0; left: 0;
        display: none;
    }
    .modal_content{
        width:400px; height:200px;
        background:#fff; border-radius:10px;
        position:relative; top:50%; left:50%;
        margin-top:-100px; margin-left:-200px;
        text-align:center;
        box-sizing:border-box; padding:74px 0;
        line-height:23px; cursor:pointer;
    }
   a[state=confirm]{background-color: beige;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function () {
		$('form').on('submit',function (e) {
			e.preventDefault();
			e.stopPropagation();
			let radio=$('#div1_1_1 input[type=radio]');
            let bool=true;
            $(radio).each(function (index,item) {
                if($(item).attr('check')==false){
                    modalpopup();
                    bool=false;
                    return false;
                }
            })
            if(bool){
                this.submit();
            }
			
		})
		$(document).on("click","#seatclose",function(e){
			e.preventDefault();
			e.stopPropagation();
			$(this).parent().parent().fadeOut();			
		})
	})
	function modalpopup() {
		$("#modalcheck").fadeIn();
		$('#modalcheck').css("top", Math.max(0, (($(window).height() - $('#modalcheck').outerHeight()) / 2) + $(window).scrollTop()) + "px");
		$('#modalcheck').css("left", Math.max(0, (($(window).width() - $('#modalcheck').outerWidth()) / 2) + $(window).scrollLeft()) + "px");		
	}
</script>
</head>
<body>
	<!-- 메뉴 -->
	<%@ include file="/WEB-INF/include/menu.jsp" %>
	<hr>
	<div id="main">
		<div id="selection">
			<div id="div6">
				출발지<select name="sel1" id="sel1" disabled style="width: 94.4px;">
					<option value="">${map.depcity}</option>
				</select>
				<select name="" id="sel3" disabled style="width: 124.4px;">
					<option value="">${map.dep2city}</option>
					<!-- 도시 선택시 역명 select 태그 show() -->
				</select>
				<select name="" id="sel6" disabled style="width: 164.4px;">
					<option value="">${map.depvehi}</option>
					<!-- 역명 선택시 차량종류 select 태그 show() -->
				</select>
				<input type="date" name="" id="" value="${map.depdate}" disabled style="width: 113.3px;">
				<select name="" id="sel5" disabled >
					<option value="">${map.onewayorround}</option>
				</select>
			</div>
			<br>
			<div id="div5">
				도착지<select name="sel2" id="sel2" disabled style="width: 94.4px;">
					<option value="default">${map.arrcity}</option>
				</select>
				<select name="" id="sel4" disabled style="width: 124.4px;">
					<option value="default">${map.arr2city}</option>
					<!-- 도시 선택시 역명 select 태그 show() -->
				</select>
				<c:if test="${map.onewayorround eq '왕복'}">
					<select name="" id="sel7" disabled style="width: 164.4px;">
						<option value="default">${map.arrvehi}</option>
						<!-- 역명 선택시 차량종류 select 태그 show() -->
					</select>
					<input type="date" name="" id="" value="${map.arrdate}" disabled style="width: 113.5px;">

				</c:if>
			</div>
			<br><br>
			성인 <input type="number" name="adults" id="adults" placeholder="성인 인원수" value="${map.formadults}" disabled>명&nbsp;&nbsp;&nbsp;
			아동 <input type="number" name="kids" id="kids" placeholder="없음" value="${map.formkids}" disabled>명&nbsp;&nbsp;&nbsp;
			<select name="sel8" id="sel8" disabled>
				<option value="no">${map.accomrecomm}</option>
			</select><br><br>
			<div id="search">
				
			</div>
		</div>
		<br>
				<div id="div1"><div id="div1_1">
			<div id="div1_1_1">
				<div id="div1_1_1_1">
					<b style="background-color:yellow ;">예약내역 확인하기</b>
				</div>
				<table id="list1">
					<tr>
						<th style="width:400px;">교통</th>
						<th style="width:400px;">이용 일자</th>
						<th style="width:400px;">이용 시간</th>
						<th style="width:400px;">1인 기준 금액</th>
						<th style="width:400px;">이용 인원</th>
						<th style="width:400px;">확인</th>
					</tr>
					<tr>
						<td>${map.dep2city} -> ${map.arr2city} 기차</td>
						<td>${map.depdate}</td>
						<td>${map.list1depPlandTime}</td>
						<td>${map.list1adultcharge}</td>
						<td>${map.formlist1seatcount}</td>
						<td><input type="radio" name="" id=""></td>
					</tr>
					<c:if test="${map.arrvehi ne 'undefined'}">
						<tr>
							<td>${map.arr2city} -> ${map.dep2city} 기차</td>
							<td>${map.arrdate}</td>
							<td>${map.list2depPlandTime}</td>
							<td>${map.list2adultcharge}</td>
							<td>${map.formlist2seatcount}</td>
							<td><input type="radio" name="" id=""></td>
						</tr>
					</c:if>
				</table>
				<c:if test="${map.accomrecomm eq '숙박 추천(필요)'}">
					<table id="list1_1">
						<tr>
							<th style="width:400px;">숙소</th>
							<th style="width:400px;">체크인</th>
							<th style="width:400px;">객실타입</th>
							<th style="width:400px;">이용금액 / 일</th>
							<th style="width:400px;">확인</th>
						</tr>
						<!--  <tr>
						 	<td></td>
						 	<td></td>
						 	<td></td>
							<td></td>
						 	<td></td>
						 	<td><input type="radio" name="" id=""></td>
						 </tr> -->
						<tr>
							<td>${map.accom_name}</td>
							<td>${map.depdate}</td>
							<td>${map.roomtype}</td>
							<td>${map.price}</td>
							<td><input type="radio" name="" id=""></td>
						</tr>
					</table>
				</c:if>
			</div></div>
		</div> <!-- 기차 목록 div--> 
		<div id="div2" style="border: 1px solid black; display:inline-block; box-sizing: content-box;
			border-radius: 10px; padding: 10px; float: right;">
			<div id="div2_charge" style="padding-bottom:10px">결제 예정금액 : 
			<c:choose>
				<c:when test="${map.arrvehi ne 'undefined'}">
					<fmt:formatNumber value="${(map.list1adultcharge +map.list2adultcharge) *  map.formadults  + map.price }" pattern="#,### 원"></fmt:formatNumber></div>
				</c:when>
				<c:otherwise>
					<fmt:formatNumber value="${map.list1adultcharge *  map.formadults + map.price}" pattern="#,### 원"></fmt:formatNumber></div>
				</c:otherwise>
			</c:choose>
			<div id="div2_button"><form action="/reservpay" method="post">
				<input type="text" name="depcity" id="depcity" value="${map.depcity}" hidden>
				<input type="text" name="dep2city" id="dep2city" value="${map.dep2city}" hidden>
				<input type="text" name="depvehi" id="depvehi" value="${map.depvehi}" hidden>
				<input type="text" name="depdate" id="depdate" value="${map.depdate}" hidden>
				<input type="text" name="onewayorround" id="onewayorround" value="${map.onewayorround}" hidden>
			
				<input type="text" name="arrcity" id="arrcity" value="${map.arrcity}" hidden>
				<input type="text" name="arr2city" id="arr2city" value="${map.arr2city}" hidden>
				<input type="text" name="arrvehi" id="arrvehi" value="${map.arrvehi}" hidden>
				<input type="text" name="arrdate" id="arrdate" value="${map.arrdate}" hidden>
			
				<input type="text" name="formadults" id="formadults" value="${map.formadults}" hidden>
				<input type="text" name="formkids" id="formkids" value="${map.formkids}" hidden>
				<input type="text" name="accomrecomm" id="accomrecomm" value="${map.accomrecomm}" hidden>
			
				<input type="text" name="list1traingradename" id="list1traingradename" value="${map.list1traingradename}" hidden>
				<input type="text" name="list1depPlandTime" id="list1depPlandTime" value="${map.list1depPlandTime}" hidden>
				<input type="text" name="list1adultcharge" id="list1adultcharge" value="${map.list1adultcharge}" hidden>
				<input type="text" name="list1promotion" id="list1promotion" value="${map.list1promotion}" hidden>
				<input type="text" name="formlist1seatcount" id="formlist1seatcount" value="${map.formlist1seatcount}" hidden>
			
				<input type="text" name="list2traingradename" id="list2traingradename" value="${map.list2traingradename}" hidden>
				<input type="text" name="list2depPlandTime" id="list2depPlandTime" value="${map.list2depPlandTime}" hidden>
				<input type="text" name="list2adultcharge" id="list2adultcharge" value="${map.list2adultcharge}" hidden>
				<input type="text" name="list2promotion" id="list2promotion" value="${map.list2promotion}" hidden>
				<input type="text" name="formlist2seatcount" id="formlist2seatcount" value="${map.formlist2seatcount}" hidden>
				<input type="text" name="list1trainroom" id="list1trainroom" value="${map.list1trainroom}" hidden>
				<input type="text" name="list1trainseat" id="list1trainseat" value="${map.list1trainseat}" hidden>
			
				<input type="text" name="list2trainroom" id="list2trainroom" value="${map.list2trainroom}" hidden>
				<input type="text" name="list2trainseat" id="list2trainseat" value="${map.list2trainseat}" hidden>
				
								<input type="text" name="accom_name" id="accom_name" value="${map.accom_name}" hidden>
			    <input type="text" name="address" id="address" value="${map.address}" hidden>
			    <input type="text" name="phone" id="phone" value="${map.phone}" hidden>
			    <input type="text" name="price" id="price" value="${map.price}" hidden>
				<input type="text" name="adults" id="adults" value="${map.adults}" hidden>
				<input type="text" name="kids" id="kids" value="${map.kids}" hidden>
				<input type="text" name="room" id="room" value="${map.room}" hidden>
				<input type="text" name="roomtype" id="roomtype" value="${map.roomtype}" hidden>
					<input type="submit" value="결제하기">
				</form></div>
		</div><!-- 더보기 버튼 div-->
		<div id="div3"><div id="div3_1"><div id="div3_1_1">
		<div id="div3_1_1_1"></div></div></div>
		<div id="div3_2"></div></div> <!-- 왕복 선택시 기차 목록 div-->
		<div id="div4"></div> <!-- 더보기 버튼 div-->
	</div>
	<div class="modal" id="modalcheck"> <!-- 로딩창 -->
		<div class="modal_content" title="modal">
			예약 사항을 모두 체크해주세요.<br><br>
			<a href="http://localhost:9090/search" id="seatclose">[닫기]</a>
		</div>
	</div>
	<div class="modal" id="seatpopup"> <!-- 좌석선택창 -->
		<div class="modal_content" title="modal">
			탑승할 인원수를 입력해주세요.
			<div id="seatdiv"></div>
			<a href="http://localhost:9090/reservconfirmform" id="seatchosen">[완료]</a>
			<a href="http://localhost:9090/reservconfirmform" id="seatclose">[닫기]</a>
		</div>
	</div>
	<div class="modal" id="list2seatpopup"> <!-- 좌석선택창 -->
		<div class="modal_content" title="modal">
			탑승할 인원수를 입력해주세요.
			<div id="seatdiv"></div>
			<a href="http://localhost:9090/search" id="seatchosen2">[완료]</a>
			<a href="http://localhost:9090/search" id="seatclose">[닫기]</a>
		</div>
	</div>
	<div class="modal" id="seatnumexceptionpopup"> <!-- 로딩창 -->
		<div class="modal_content" title="modal">
		</div>
	</div>
	
	
	<b id="list1hiddeninform" hidden=""></b>
	<b id="list2hiddeninform" hidden=""></b>


</body>
</body>
</html>