<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#list1,#list2,th,tr{border: 1px solid black; border-collapse: collapse; margin: 0 auto;}
	#list1 tr th{background-color: gainsboro;}
	#list2 tr th{background-color: gainsboro;}
    #main {width:750px; margin:0 auto; text-align: center;}
    #div1,#div2,#div3,#div4{width:100%; margin:0 auto; text-align: center;}
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
	#list1 tr:hover td{background-color: antiquewhite;}
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
		<div id="div1"><div id="div1_1"><div id="div1_1_1">
		<div id="div1_1_1_1"></div></div></div>
		<div id="div1_2"></div></div> <!-- 기차 목록 div-->
		<div id="div2"></div> <!-- 더보기 버튼 div-->
		<div id="div3"><div id="div3_1"><div id="div3_1_1">
		<div id="div3_1_1_1"></div></div></div>
		<div id="div3_2"></div></div> <!-- 왕복 선택시 기차 목록 div-->
		<div id="div4"></div> <!-- 더보기 버튼 div-->
	</div>
	<div class="modal" id="modalcheck"> <!-- 로딩창 -->
		<div class="modal_content" title="modal">
			잠시만 기다려주세요.
		</div>
	</div>
	<div class="modal" id="seatpopup"> <!-- 좌석선택창 -->
		<div class="modal_content" title="modal">
			탑승할 인원수를 입력해주세요.
			<div id="seatdiv"></div>
			<a href="" id="seatchosen">[완료]</a>
			<a href="" id="seatclose">[닫기]</a>
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
	
	<c:if test="${map.arrvehi eq 'undefine'}">
					<select name="" id="sel7" disabled style="width: 164.4px;">
						<option value="default">${map.arrvehi}</option>
						<!-- 역명 선택시 차량종류 select 태그 show() -->
					</select>
					<input type="date" name="" id="" value="${map.arrdate}" disabled style="width: 113.5px;">

				</c:if>
	<b id="list1hiddeninform" hidden></b>
	<b id="list2hiddeninform" hidden></b>

</body>
</body>
</html>