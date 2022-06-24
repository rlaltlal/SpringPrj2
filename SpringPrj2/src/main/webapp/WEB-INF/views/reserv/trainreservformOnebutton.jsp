<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
<style>
	#list1,#list2,th,tr{border: 1px solid black; border-collapse: collapse; margin: 0 auto;}
	#list1 tr th{background-color: gainsboro;}
	#list2 tr th{background-color: gainsboro;}
    #main {width:750px; margin:0 auto; text-align: center;}
    #div1,#div2,#div3,#div4{width:100%; margin:0 auto; text-align: center;}
    #title{display: inline-block; width:100%; text-align:center; }
	#cell  {display: inline-block; justify-self: right;} 
	ul li { list-style-type : none; float: left; 
    		outline: 1px dotted green; margin-left: 30px; }
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
	#div2{margin-bottom:30px;}
	#div1_1{margin-bottom:30px;}
	#div3_1{margin-bottom:30px;}
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
	#seatpopup .modal_content{padding: 10px;}
	#seatimg tr td{border: 1px solid black; border-collapse: collapse; padding: 5px;}
	#trainroom table{margin: 0 auto; padding: 5px 0 5px 0;}
	#seatimg table{margin: 0 auto;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function () {
		let i1=1; 
		let i2=1; //pageNo (기차조회 버튼 이벤트 처리 변수)

		//페이지내 이벤트 없이 페이지를 열자마자 ajax로 도시이름 출력
		$.ajax({ 
			url:'/RestBoard/Cities',
			data:{
				serviceKey:'tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D',
				_type:'xml'
			},
			method:'POST'
		}).done(function (data) {
			console.log(data);	
			let html='';
				$(data).find('item').each(function (index,item) {
					html+='<option value="'+$(item).find('citycode').html()+'">'+$(item).find('cityname').html()+'</option>';
				})
				$('#sel1').append(html);
				$('#sel2').append(html);
			})
			.fail(function (error,textStatus,errorThrown) {
				alert('Error :'+error)
			})

		//출발지 select 변동시 ajax 이벤트 시작 -> 역명 select 출력
		$('#sel1').on('change',function () {
			$('#sel3').show();
			//alert($('#sel1 option:selected').val());
			$.ajax({
				url:'/RestBoard/Trainstation',
				data:{
					serviceKey:'tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D',
					pageNo:'1',
					numOfRows:'10',
					_type:'xml',
					cityCode:$('#sel1 option:selected').val()
				},
				method:'POST'
			}).done(function (data) {
			console.log(data);	
				let html='';
				html+='<option value="depcity">역을 선택하세요.</option>';
				$(data).find('item').each(function (index,item) {
					html+='<option value="'+$(item).find('nodeid').html()+'">'+$(item).find('nodename').html()+'</option>';
				})
				$('#sel3').html(html);
			})
			.fail(function (error,textStatus,errorThrown) {
				alert('Error :'+error)
			})
		})

		//역명 select 변동시 ajax 이벤트 시작 -> 차량종류 select 출력
		$('#sel3').on('change',function () {
			$('#sel6').show();
			$.ajax({
				url:'/RestBoard/Traintype',
				data:{
					serviceKey:'tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D',
					_type:'xml',
				},
				method:'POST'
			}).done(function (data) {
			console.log(data);	
				let html='';
				html+='<option value="">차량종류를 선택하세요.</option>';
				$(data).find('item').each(function (index,item) {
					html+='<option value="'+$(item).find('vehiclekndid').html()+'">'+$(item).find('vehiclekndnm').html()+'</option>';
				})
				$('#sel6').html(html);
			})
			.fail(function (error,textStatus,errorThrown) {
				alert('Error :'+error)
			})
		})

		//차량종류 select 변동시 date태그 생성
		$('#sel6').on('change',function () {
			//이전 date태그 없을때만 생성
			if(!$('#date1').length){
				let html='';
				html+='<input type="date" name="date1" id="date1">';
				$('#sel6').after(html);
			}
		})

		//도착지 select 변동시 ajax 이벤트 시작 -> 역명 select 출력
		$('#sel2').on('change',function () {
			$('#sel4').show();
			//alert($('#sel2 option:selected').val());
			$.ajax({
				url:'/RestBoard/Trainstation',
				data:{
					serviceKey:'tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D',
					pageNo:'1',
					numOfRows:'10',
					_type:'xml',
					cityCode:$('#sel2 option:selected').val()
				},
				method:'POST'
			}).done(function (data) {
			console.log(data);	
				let html='';
				html+='<option value="">역을 선택하세요.</option>';
				$(data).find('item').each(function (index,item) {
					html+='<option value="'+$(item).find('nodeid').html()+'">'+$(item).find('nodename').html()+'</option>';
				})
				$('#sel4').html(html);
			})
			.fail(function (error,textStatus,errorThrown) {
				alert('Error :'+error)
			})
		})

		//역명 select 변동시 ajax 이벤트 시작 -> 차량종류 select 출력
		$('#sel4').on('change',function () {
			if($('#sel5 option:selected').val()=='round'){ //왕복이면 출발지, 도착지 차량 둘다 선택
				$('#sel7').show();
				$.ajax({
					url:'/RestBoard/Traintype',
					data:{
						serviceKey:'tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D',
						_type:'xml',
					},
					method:'POST'
				}).done(function (data) {
				console.log(data);	
					let html='';
					html+='<option value="">차량종류를 선택하세요.</option>';
					$(data).find('item').each(function (index,item) {
						html+='<option value="'+$(item).find('vehiclekndid').html()+'">'+$(item).find('vehiclekndnm').html()+'</option>';
					})
					$('#sel7').html(html);
				})
				.fail(function (error,textStatus,errorThrown) {
					alert('Error :'+error)
				})
			}
		})

		//차량종류 select 변동시 date태그 생성
		$('#sel7').on('change',function () {
			//이전 date태그 없을때만 새로 생성
			if(!($('#date2').length)){
				let html='';
				html+='<input type="date" name="date2" id="date2">';
				$('#sel7').after(html);
			}
		})

		//왕복, 편도 변경시 출발지만 남기고 clear
		$('#sel5').on('change',function () {
			$('#sel2 option:eq(0)').attr("selected","selected");
			if($('#date2').length){
				$('#date2').remove();	
			}
			if($('#sel4').length){
				$('#sel4').hide();	
			}
			if($('#sel7').length){
				$('#sel7').hide();	
			}
		})

		//조회 버튼클릭시 출발지 - 도착지 기준 기차편 전부 출력
		$('.btnTrain').on('click',function () {
			//페이징넘버 변수 초기화
			i1=1;
			i2=1;
			
			//div1,2,3,4 clear
			$('#div1_1_1_1').children().empty();
			$('#div1_1_1 #list1').remove();
			$('#div1_2').children().empty();
			
			$('#div2').children().empty();
			
			$('#div3_1_1_1').children().empty();
			$('#div3_1_1 #list2').remove();
			
			$('#div4').children().empty();
			
			//날짜String 처리 (ex. 2022-06-14 -> 20220614)
			let date1=$('#date1').val();
			//let dates1=date1.split('-');
			//date1=(dates1[0]-1)+dates1[1]+dates1[2]
			let date2='';
			if(($('#date2').length)){ //왕복
				date2=$('#date2').val();
				//let dates2=date2.split('-');
				//date2=(dates2[0]-1)+dates2[1]+dates2[2];
			}

			//팝업 출력후 ajax
			modalpopup();
			$.ajax({
				url:'/RestBoard/train',
				data:{serviceKey:'tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D',
              pageNo:i1,
              numOfRows:'10',
              _type:'xml',
              depPlaceId:'NAT010000',
              arrPlaceId:'NAT011668',
              depPlandTime:'20211201',
              trainGradeCode:'00'
        },
				method:'POST'
			}).done(function (data) {
				$(".modal").fadeOut();
				console.log(data);

				let html='<b style="background-color:yellow ;">교통편 선택하기</b>';
				$('#div1_1_1_1').html(html);
				html='<table id="list1">									';
				html+='	<tr>';
				html+='		<th>'+$('#sel1 option:selected').html()+'-><br>'+$('#sel2 option:selected').html()+'기차</th>';
				html+='		<th>편명</th>';
				html+='		<th>'+$('#date1').val()+'</th>';
				html+='		<th>금액</th>';
				html+='		<th>혜택</th>';
				html+='		<th>좌석</th>';
				html+='	</tr>';
				$(data).find('item').each(function (index,item) {
					html+='	<tr>';
					html+='		<td>'+(index+1)+'</td>';
					html+='		<td>'+$(item).find('traingradename').html()+' '+$(item).find('trainno').html()+'편</td>';
					let arrtime=$(item).find('arrplandtime').html();
					html+='		<td>'+arrtime.substring(8,10)+':'+arrtime.substring(10,12)+'</td>';
					html+='		<td>'+$(item).find('adultcharge').html()+'</td>';
					html+='		<td>-</td>';
					html+='		<td><a href="" id="seatchoose">선택하기</a></td>';
					html+='	</tr>';
				})
				html+='</table>';
				if(!$('#list1').length){
					$('#div1_1_1').append(html);
				}
				
				//숙소추천 yes
				html='<form action="/trainseatform" method="post" id="form1">';
				if($('#sel8 option:selected').val()=='yes'){
					html+='<button type="submit">숙소예약</button><br><br>';					
					html+="<input type=\"submit\" value=\"\">";
				}
				else{
					html+='<input type="submit" value="좌석선택하기">';
				}
				html+='</form>';
				$('#div1_2').html(html);
				
				//pageNo*numOfRow < $().find('totalcount').html() 더보기 버튼 출력
				let pageNo=$(data).find('pageNo').html();
				let numOfRows=$(data).find('numOfRows').html();
				let totalCount=$(data).find('totalCount').html();
				html='';
				if(pageNo*numOfRows < totalCount){
					html+='<button class="pageControl" id="more1">더보기</button>';
				}
				$('#div2').html(html);
			})
			.fail(function (error,textStatus,errorThrown) {
				console.log(error);
				alert('Error :'+error)
			})

			//왕복
			if($('#sel5 option:selected').val()=='round'){ 
				modalpopup();
				$.ajax({
					url:'/RestBoard/train',
					data:{serviceKey:'tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D',
				pageNo:i2,
				numOfRows:'10',
				_type:'xml',
				arrPlaceId:'NAT011668',
				depPlaceId:'NAT010000',
				depPlandTime:'20211201',
				trainGradeCode:'00'
				},
					method:'POST'
				}).done(function (data) {
					$(".modal").fadeOut();
					console.log(data);

					let html='<b style="background-color:yellow ;">교통편 선택하기</b>';
					$('#div3_1_1_1').html(html);
					
					html='<table id="list2">									';
					html+='	<tr>';
					html+='		<th>'+$('#sel2 option:selected').html()+'-><br>'+$('#sel1 option:selected').html()+'기차</th>';
					html+='		<th>편명</th>';
					html+='		<th>'+$('#date2').val()+'</th>';
					html+='		<th>금액</th>';
					html+='		<th>혜택</th>';
					html+='		<th>좌석</th>';
					html+='	</tr>';
					$(data).find('item').each(function (index,item) {
						html+='	<tr>';
						html+='		<td>'+(index+1)+'</td>';
						html+='		<td>'+$(item).find('traingradename').html()+' '+$(item).find('trainno').html()+'편</td>';
						let arrtime=$(item).find('arrplandtime').html();
						html+='		<td>'+arrtime.substring(8,10)+':'+arrtime.substring(10,12)+'</td>';
						html+='		<td>'+$(item).find('adultcharge').html()+'</td>';
						html+='		<td>-</td>';
						html+='		<td><a href="" id="seatchoose">선택하기</a></td>';
						html+='	</tr>';
					})
					html+='</table>';
					if(!$('#list2').length){
						$('#div3_1_1').append(html);
					}
					
					//pageNo*numOfRow < $().find('totalcount').html() 더보기 버튼 출력
					let pageNo=$(data).find('pageNo').html();
					let numOfRows=$(data).find('numOfRows').html();
					let totalCount=$(data).find('totalCount').html();
					html='';
					if(pageNo*numOfRows < totalCount){
						html+='<button class="pageControl2" id="more2">더보기</button>';
					}
					$('#div4').html(html);
				})
				.fail(function (error,textStatus,errorThrown) {
					console.log(error);
					alert('Error :'+error)
				})
			}
			
		})

		//더보기 버튼클릭이벤트 처리
		$(document).on('click','.pageControl',function(e){ 
			//날짜String 처리 (ex. 2022-06-14 ->20220614)
			let date1=$('#date1').val();
			//let dates1=date1.split('-');
			//date1=(dates1[0]-1)+dates1[1]+dates1[2];
			if($(e.target).html()=='더보기'){
				i1++;
			}
			else if($(e.target).html()=='이전'){
				i1--;
			}
			
			modalpopup();
			$.ajax({
				url:'/RestBoard/train',
				data:{serviceKey:'tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D',
              pageNo:i1,
              numOfRows:'10',
              _type:'xml',
              depPlaceId:$('#sel3 option:selected').val(),
              arrPlaceId:$('#sel4 option:selected').val(),
              depPlandTime:date1,
              trainGradeCode:$('#sel6 option:selected').val()
        },
				method:'POST'
			}).done(function (data) {
				$(".modal").fadeOut();
				console.log(data);

				let html='';
				html+='<table id="list1">									';
				html+='	<tr>';
				html+='		<th>'+$('#sel1 option:selected').html()+'-><br>'+$('#sel2 option:selected').html()+'기차</th>';
				html+='		<th>편명</th>';
				html+='		<th>'+$('#date1').val()+'</th>';
				html+='		<th>금액</th>';
				html+='		<th>혜택</th>';
				html+='		<th>좌석</th>';
				html+='	</tr>';
				$(data).find('item').each(function (index,item) {
					html+='	<tr>';
					html+='		<td>'+(index+1)+'</td>';
					html+='		<td>'+$(item).find('traingradename').html()+' '+$(item).find('trainno').html()+'편</td>';
					let arrtime=$(item).find('arrplandtime').html();
					html+='		<td>'+arrtime.substring(8,10)+':'+arrtime.substring(10,12)+'</td>';
					html+='		<td>'+$(item).find('adultcharge').html()+'</td>';
					html+='		<td>-</td>';
					//이전에 선택한 좌석이 있으면 세팅
					if($('#list1hiddeninform[ordernumber]').length){
						if(i1==$('#list1hiddeninform').attr('pageNo')){
							if((index+1)==$('#list1hiddeninform').attr('ordernumber')){
								html+='		<td><a href="" id="seatchoose" list1state="confirm"' ;
								html+='list1ordernumber="'+$('#list1hiddeninform').attr('ordernumber')+'" ';
								html+='list1seatcount="'+$('#list1hiddeninform').attr('seatcount')+'" ';
								html+='style="background-color:beige">선택완료</a></td>';
							}
							else{
								html+='		<td><a href="" id="seatchoose">선택하기</a></td>';
							}
						}
						else{
							html+='		<td><a href="" id="seatchoose">선택하기</a></td>';
						}
					}
					else{
						html+='		<td><a href="" id="seatchoose">선택하기</a></td>';
					}
					html+='	</tr>';
				})
				html+='</table>';
				$('#list1').remove();
				$('#div1_1_1').append(html);
				$('[list1state=confirm]').parent().parent().css('background-color','beige')
				
				let pageNo=$(data).find('pageNo').html();
				let numOfRows=$(data).find('numOfRows').html();
				let totalCount=$(data).find('totalCount').html();
				//더보기 로직
				if(pageNo*numOfRows < totalCount){
					if(!$('#more1').length){
						html='<button class="pageControl" id="more1">더보기</button>';
						$('#div2').html(html);
					}
				}
				else if(pageNo*numOfRows >= totalCount){ 
					// 더 볼페이지 없음
					$('#more1').remove();
				}
				//이전 로직
				if(pageNo!='1'){
					if(!$('#before1').length){
						html='<button class="pageControl" id="before1">이전</button>';
						$('#more1').before(html+'&nbsp;');
					}
				}
				else if(pageNo=='1'){
					if($('#before1').length){
						$('#before1').remove();
					}
				}
				
			})
			.fail(function (error,textStatus,errorThrown) {
				console.log(error);
				alert('Error :'+error)
			})
		})

		//왕복 list의 더보기 버튼클릭이벤트 처리
		$(document).on("click",".pageControl2",function(e){ 
			//날짜String 처리 (ex. 2022-06-14 -> 20220614)
			date2=$('#date2').val();
			//let dates2=date2.split('-');
			//date2=(dates2[0]-1)+dates2[1]+dates2[2];
			
			if($(e.target).html()=='더보기'){
				i2++;
			}
			else if($(e.target).html()=='이전'){
				i2--;
			}
			modalpopup();
			$.ajax({
				url:'/RestBoard/train',
				data:{serviceKey:'tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D',
              pageNo:i2,
              numOfRows:'10',
              _type:'xml',
              arrPlaceId:$('#sel3 option:selected').val(),
              depPlaceId:$('#sel4 option:selected').val(),
              depPlandTime:date2,
              trainGradeCode:$('#sel7 option:selected').val()
        },
				method:'POST'
			}).done(function (data) {
				$(".modal").fadeOut();
				console.log(data);

				let html='';
				html+='<table id="list2">									';
				html+='	<tr>';
				html+='		<th>'+$('#sel2 option:selected').html()+'-><br>'+$('#sel1 option:selected').html()+'기차</th>';
				html+='		<th>편명</th>';
				html+='		<th>'+$('#date2').val()+'</th>';
				html+='		<th>금액</th>';
				html+='		<th>혜택</th>';
				html+='		<th>좌석</th>';
				html+='	</tr>';
				$(data).find('item').each(function (index,item) {
					html+='	<tr>';
					html+='		<td>'+(index+1)+'</td>';
					html+='		<td>'+$(item).find('traingradename').html()+' '+$(item).find('trainno').html()+'편</td>';
					let arrtime=$(item).find('arrplandtime').html();
					html+='		<td>'+arrtime.substring(8,10)+':'+arrtime.substring(10,12)+'</td>';
					html+='		<td>'+$(item).find('adultcharge').html()+'</td>';
					html+='		<td>-</td>';
					//이전에 선택한 좌석이 있으면 세팅
					if($('#list2hiddeninform[ordernumber]').length){
						if(i2==$('#list2hiddeninform').attr('pageNo')){
							if((index+1)==$('#list2hiddeninform').attr('ordernumber')){
								html+='		<td><a href="" id="seatchoose" list2state="confirm"' ;
								html+='list2ordernumber="'+$('#list2hiddeninform').attr('ordernumber')+'" ';
								html+='list2seatcount="'+$('#list2hiddeninform').attr('seatcount')+'" ';
								html+='style="background-color:beige">선택완료</a></td>';
							}
							else{
								html+='		<td><a href="" id="seatchoose">선택하기</a></td>';
							}
						}
						else{
							html+='		<td><a href="" id="seatchoose">선택하기</a></td>';
						}
					}
					else{
						html+='		<td><a href="" id="seatchoose">선택하기</a></td>';
					}
					html+='	</tr>';
				})
				html+='</table>';
				$('#list2').remove();
				$('#div3_1_1').append(html);
				$('[list2state=confirm]').parent().parent().css('background-color','beige')
				
				let pageNo=$(data).find('pageNo').html();
				let numOfRows=$(data).find('numOfRows').html();
				let totalCount=$(data).find('totalCount').html();
				//더보기 로직
				if(pageNo*numOfRows < totalCount){
					if(!$('#more2').length){
						html='<button class="pageControl2" id="more2">더보기</button>';
						$('#div4').html(html);
					}
				}
				else if(pageNo*numOfRows >= totalCount){ 
					// 더 볼페이지 없음
					$('#more2').remove();
				}
				//이전 로직
				if(pageNo!='1'){
					if(!$('#before2').length){
						html='<button class="pageControl2" id="before2">이전</button>';
						$('#more2').before(html+'&nbsp;');
					}
				}
				else if(pageNo=='1'){
					if($('#before2').length){
						$('#before2').remove();
					}
				}
			})
			.fail(function (error,textStatus,errorThrown) {
				console.log(error);
				alert('Error :'+error)
			})
		})
		$(document).on("click","#seatchoose",function(e){
			e.preventDefault();
			e.stopPropagation();

			//예약폼상 인원수와 기차표상 인원수 체크
			let people=$('#adults').val()+$('#kids').val(); // 예약폼 상에서의 인원수
			let seatcounts=0;
			$('#list1 [list1state=confirm]').each(function(index,item){ //지정한 seatcount수 합하기
				seatcounts+=parseInt($(item).attr('list1seatcount')); 
			});
			if(people<=seatcounts){ // 인원수 초과
				if($(e.target).html()=='선택완료'){ //선택완료를 다시 선택함 = 수정
					seatpopup();
					$(e.target).attr("list1state","update");
				}
				else{
					let isList2=$(e.target).parent().parent().parent().parent().attr('id');
					if(isList2=='list2'){
						let seatcounts2=0;
						//list2 인원수 체크
						$('#list2 [list2state=confirm]').each(function(index,item){
							seatcounts2+=parseInt($(item).attr('list2seatcount')); 
						});
						if(people<=seatcounts2){
							if($(e.target).html()=='선택완료'){ //선택완료를 다시 선택함 = 수정
								seatpopuplist2();
								$(e.target).attr("list2state","update");
							}
							else{
								seatnumexceptionpopup();
							}
						}
						else{
							seatpopuplist2();
							$(e.target).attr("list2state","process");
							$('[list2state=process]').attr('list2ordernumber',$('[list2state=process]').parent().parent().children('td:eq(0)').html())
						}
					}
					else{
						seatnumexceptionpopup();
						return false;
					}
				}
			}
			else{ // list1 ok
				seatpopup();
				$(e.target).attr("list1state","process");
				$('[list1state=process]').attr('list1ordernumber',$('[list1state=process]').parent().parent().children('td:eq(0)').html())
				return false;
			}
			if($('#list2').length){//왕복 기차표 체크
				
			}
		
		})
		$(document).on("click","#seatclose",function(e){
			e.preventDefault();
			e.stopPropagation();
			if($('[list1state=process]').length){
				$('[list1state=process]').attr('list1state','none');
				$('[list1state=none]').removeAttr('list1ordernumber');
			}
			if($('[list2state=process]').length){
				$('[list2state=process]').attr('list2state','none');
				$('[list2state=none]').removeAttr('list2ordernumber');
			}
			if($('[list1state=update]').length){
				$('[list1state=update]').attr('list1state','none');
				$('[list1state=none]').removeAttr('list1ordernumber');
			}
			if($('[list2state=update]').length){
				$('[list2state=update]').attr('list2state','none');
				$('[list2state=none]').removeAttr('list2ordernumber');
			}
			$('.modal').fadeOut();			
		})
		$(document).on("click","#seatchosen",function(e){
			e.preventDefault();
			e.stopPropagation();
			let seatcount=$('#seatcount').val()
			let people=0;
			if($('#kids').val()==''){
				people=parseInt($('#adults').val());
			}
			else{
				people=parseInt($('#adults').val())+parseInt($('#kids').val());
			}
			let list1ordernumber=parseInt($('[list1state=process]').attr('list1ordernumber')); 
			let seatcounts=0;
			let seatcounts2=0;
			$('#list1 [list1state=confirm]').each(function(index,item){
				seatcounts+=parseInt($(item).attr('list1seatcount'));
				// counts = state:confirm인 자리수, count=입력창에서 입력한 자리수 
			});
			if(people<(parseInt(seatcounts)+parseInt(seatcount))){ //입력폼 인원수+ 남은 인원수보다 크면 예외처리
				seatnumexceptionpopup();
				
			}
			else if($('[list1state=update]').length){
				$('#list1 tr:eq('+(list1ordernumber)+') [list1state=update]').attr('list1seatcount',$('#seatcount').val());
				$('[list1state=update]').attr('list1state','confirm');
			}
			else{
				$('#list1 tr:eq('+(list1ordernumber)+') [list1state=process]').attr('list1seatcount',$('#seatcount').val());
				$('[list1state=process]').attr('list1state','confirm');
				$('[list1state=confirm]').html('선택완료');
				$('[list1state=confirm]').parent().parent().css('background-color','beige');
				let list1parent=$("[list1state='confirm']").parent().parent().children().eq(1).html();
				console.log(list1parent);
				$('#list1hiddeninform').attr('pageNo',i1)
				$('#list1hiddeninform').attr('orderNumber',list1ordernumber);
				$('.modal').fadeOut();
				return false;
			}
		})
		$(document).on("click","#seatchosen2",function(e){
			e.preventDefault();
			e.stopPropagation();
			let seatcount=$('#seatcount2').val()
			let people=0;
			if($('#kids').val()==''){
				people=parseInt($('#adults').val());
			}
			else{
				people=parseInt($('#adults').val())+parseInt($('#kids').val());
			}
			let list2ordernumber=parseInt($('[list2state=process]').attr('list2ordernumber')); 
			let seatcounts=0;
			let seatcounts2=0;
			$('#list2 [list2state=confirm]').each(function(index,item){
				seatcounts+=parseInt($(item).attr('list2seatcount'));
				// counts = state:confirm인 자리수, count=입력창에서 입력한 자리수 
			});
			console.log(people+','+(parseInt(seatcounts)+parseInt(seatcount)))
			if(people<(parseInt(seatcounts)+parseInt(seatcount))){ //입력폼 인원수+ 남은 인원수보다 크면 예외처리
				seatnumexceptionpopup();
				
			}
			else if($('[list2state=update]').length){
				$('#list2 tr:eq('+(list2ordernumber)+') [list2state=update]').attr('list2seatcount',$('#seatcount').val());
				$('[list2state=update]').attr('list2state','confirm');
			}
			else{
				$('#list2 tr:eq('+(list2ordernumber)+') [list2state=process]').attr('list2seatcount',$('#seatcount').val());
				$('[list2state=process]').attr('list2state','confirm');
				$('[list2state=confirm]').html('선택완료');
				$('[list2state=confirm]').parent().parent().css('background-color','beige');
				
				$('#list2hiddeninform').attr('pageNo',i1)
				$('#list2hiddeninform').attr('orderNumber',list2ordernumber);
				$('.modal').fadeOut();
			}
		})
		$(document).on("submit","#form1",function(e){
			e.preventDefault();
			e.stopPropagation();
			
			alert(e.target.action);
			let html='';
			html+='	<input type="text" name="depcity" id="depcity" value="서울특별시" hidden>';
			html+='	<input type="text" name="dep2city" id="dep2city" value="서울" hidden>';
			html+='	<input type="text" name="depvehi" id="depvehi" value="KTX" hidden>';
			html+='	<input type="text" name="depdate" id="depdate" value="2022-06-04" hidden>';
			html+='	<input type="text" name="onewayorround" id="onewayorround" value="왕복" hidden>';
			
			html+='	<input type="text" name="arrcity" id="arrcity" value="부산광역시" hidden>';
			html+='	<input type="text" name="arr2city" id="arr2city" value="부산" hidden>';
			html+='	<input type="text" name="arrvehi" id="arrvehi" value="KTX" hidden>';
			html+='	<input type="text" name="arrdate" id="arrdate" value="2022-06-16" hidden>';
			
			html+='	<input type="text" name="formadults" id="formadults" value="1" hidden>';
			html+='	<input type="text" name="formkids" id="formkids" value="" hidden>';
			html+='	<input type="text" name="accomrecomm" id="accomrecomm" value="숙박 추천(필요없음)" hidden>';
			
			let list1parent=$("[list1state='confirm']").parent().parent().children();
			html+='	<input type="text" name="list1traingradename" id="list1traingradename" value="KTX 1편" hidden>';
			html+='	<input type="text" name="list1depPlandTime" id="list1depPlandTime" value="07:49" hidden>';
			html+='	<input type="text" name="list1adultcharge" id="list1adultcharge" value="59800" hidden>';
			html+='	<input type="text" name="list1promotion" id="list1promotion" value="-" hidden>';
			html+='	<input type="text" name="formlist1seatcount" id="formlist1seatcount" value="1" hidden>';
			
			let list2parent=$("[list2state='confirm']").parent().parent().children();
			html+='	<input type="text" name="list2traingradename" id="list2traingradename" value="KTX4편" hidden>';
			html+='	<input type="text" name="list2depPlandTime" id="list2depPlandTime" value="07:55" hidden>';
			html+='	<input type="text" name="list2adultcharge" id="list2adultcharge" value="59800" hidden>';
			html+='	<input type="text" name="list2promotion" id="list2promotion" value="-" hidden>';
			html+='	<input type="text" name="formlist2seatcount" id="formlist2seatcount" value="1" hidden>';
			// html+='	<input type="text" name="depcity" id="depcity" value="'+$('#sel1 option:selected').html()+'" hidden>';
			// html+='	<input type="text" name="dep2city" id="dep2city" value="'+$('#sel3 option:selected').html()+'" hidden>';
			// html+='	<input type="text" name="depvehi" id="depvehi" value="'+$('#sel6 option:selected').html()+'" hidden>';
			// html+='	<input type="text" name="depdate" id="depdate" value="'+$('#date1').val()+'" hidden>';
			// html+='	<input type="text" name="onewayorround" id="onewayorround" value="'+$('#sel5 option:selected').html()+'" hidden>';
			
			// html+='	<input type="text" name="arrcity" id="arrcity" value="'+$('#sel2 option:selected').html()+'" hidden>';
			// html+='	<input type="text" name="arr2city" id="arr2city" value="'+$('#sel4 option:selected').html()+'" hidden>';
			// html+='	<input type="text" name="arrvehi" id="arrvehi" value="'+$('#sel7 option:selected').html()+'" hidden>';
			// html+='	<input type="text" name="arrdate" id="arrdate" value="'+$('#date2').val()+'" hidden>';
			
			// html+='	<input type="text" name="formadults" id="formadults" value="'+$('#adults').val()+'" hidden>';
			// html+='	<input type="text" name="formkids" id="formkids" value="'+$('#kids').val()+'" hidden>';
			// html+='	<input type="text" name="accomrecomm" id="accomrecomm" value="'+$('#sel8 option:selected').html()+'" hidden>';
			
			// let list1parent=$("[list1state='confirm']").parent().parent().children();
			// html+='	<input type="text" name="list1traingradename" id="list1traingradename" value="'+list1parent.eq(1).html()+'" hidden>';
			// html+='	<input type="text" name="list1depPlandTime" id="list1depPlandTime" value="'+list1parent.eq(2).html()+'" hidden>';
			// html+='	<input type="text" name="list1adultcharge" id="list1adultcharge" value="'+list1parent.eq(3).html()+'" hidden>';
			// html+='	<input type="text" name="list1promotion" id="list1promotion" value="'+list1parent.eq(4).html()+'" hidden>';
			// html+='	<input type="text" name="formlist1seatcount" id="formlist1seatcount" value="'+list1parent.eq(5).children().attr('list1seatcount')+'" hidden>';
			
			// let list2parent=$("[list2state='confirm']").parent().parent().children();
			// html+='	<input type="text" name="list2traingradename" id="list2traingradename" value="'+list2parent.eq(1).html()+'" hidden>';
			// html+='	<input type="text" name="list2depPlandTime" id="list2depPlandTime" value="'+list2parent.eq(2).html()+'" hidden>';
			// html+='	<input type="text" name="list2adultcharge" id="list2adultcharge" value="'+list2parent.eq(3).html()+'" hidden>';
			// html+='	<input type="text" name="list2promotion" id="list2promotion" value="'+list2parent.eq(4).html()+'" hidden>';
			// html+='	<input type="text" name="formlist2seatcount" id="formlist2seatcount" value="'+list2parent.eq(5).children().attr('list2seatcount')+'" hidden>';
			$('#form1').append(html);
			this.submit();
		})
		$(document).on("submit","#form2",function(e){
			e.preventDefault();
			e.stopPropagation();
			
			alert(e.target.action);
			let html='';
			html+='	<input type="text" name="depcity" id="depcity" value="서울특별시" hidden>';
			html+='	<input type="text" name="dep2city" id="dep2city" value="서울" hidden>';
			html+='	<input type="text" name="depvehi" id="depvehi" value="KTX" hidden>';
			html+='	<input type="text" name="depdate" id="depdate" value="2022-06-04" hidden>';
			html+='	<input type="text" name="onewayorround" id="onewayorround" value="편도" hidden>';
			
			html+='	<input type="text" name="arrcity" id="arrcity" value="부산광역시" hidden>';
			html+='	<input type="text" name="arr2city" id="arr2city" value="부산" hidden>';
			html+='	<input type="text" name="arrvehi" id="arrvehi" value="undefined" hidden>';
			
			
			html+='	<input type="text" name="formadults" id="formadults" value="1" hidden>';
			html+='	<input type="text" name="formkids" id="formkids" value="" hidden>';
			html+='	<input type="text" name="accomrecomm" id="accomrecomm" value="숙박 추천(필요없음)" hidden>';
			
			let list1parent=$("[list1state='confirm']").parent().parent().children();
			html+='	<input type="text" name="list1traingradename" id="list1traingradename" value="KTX 1편" hidden>';
			html+='	<input type="text" name="list1depPlandTime" id="list1depPlandTime" value="07:49" hidden>';
			html+='	<input type="text" name="list1adultcharge" id="list1adultcharge" value="59800" hidden>';
			html+='	<input type="text" name="list1promotion" id="list1promotion" value="-" hidden>';
			html+='	<input type="text" name="formlist1seatcount" id="formlist1seatcount" value="1" hidden>';
			
			// html+='	<input type="text" name="depcity" id="depcity" value="'+$('#sel1 option:selected').html()+'" hidden>';
			// html+='	<input type="text" name="dep2city" id="dep2city" value="'+$('#sel3 option:selected').html()+'" hidden>';
			// html+='	<input type="text" name="depvehi" id="depvehi" value="'+$('#sel6 option:selected').html()+'" hidden>';
			// html+='	<input type="text" name="depdate" id="depdate" value="'+$('#date1').val()+'" hidden>';
			// html+='	<input type="text" name="onewayorround" id="onewayorround" value="'+$('#sel5 option:selected').html()+'" hidden>';
			
			// html+='	<input type="text" name="arrcity" id="arrcity" value="'+$('#sel2 option:selected').html()+'" hidden>';
			// html+='	<input type="text" name="arr2city" id="arr2city" value="'+$('#sel4 option:selected').html()+'" hidden>';
			// html+='	<input type="text" name="arrvehi" id="arrvehi" value="'+$('#sel7 option:selected').html()+'" hidden>';
			// html+='	<input type="text" name="arrdate" id="arrdate" value="'+$('#date2').val()+'" hidden>';
			
			// html+='	<input type="text" name="formadults" id="formadults" value="'+$('#adults').val()+'" hidden>';
			// html+='	<input type="text" name="formkids" id="formkids" value="'+$('#kids').val()+'" hidden>';
			// html+='	<input type="text" name="accomrecomm" id="accomrecomm" value="'+$('#sel8 option:selected').html()+'" hidden>';
			
			// let list1parent=$("[list1state='confirm']").parent().parent().children();
			// html+='	<input type="text" name="list1traingradename" id="list1traingradename" value="'+list1parent.eq(1).html()+'" hidden>';
			// html+='	<input type="text" name="list1depPlandTime" id="list1depPlandTime" value="'+list1parent.eq(2).html()+'" hidden>';
			// html+='	<input type="text" name="list1adultcharge" id="list1adultcharge" value="'+list1parent.eq(3).html()+'" hidden>';
			// html+='	<input type="text" name="list1promotion" id="list1promotion" value="'+list1parent.eq(4).html()+'" hidden>';
			// html+='	<input type="text" name="formlist1seatcount" id="formlist1seatcount" value="'+list1parent.eq(5).children().attr('list1seatcount')+'" hidden>';
			
			// let list2parent=$("[list2state='confirm']").parent().parent().children();
			// html+='	<input type="text" name="list2traingradename" id="list2traingradename" value="'+list2parent.eq(1).html()+'" hidden>';
			// html+='	<input type="text" name="list2depPlandTime" id="list2depPlandTime" value="'+list2parent.eq(2).html()+'" hidden>';
			// html+='	<input type="text" name="list2adultcharge" id="list2adultcharge" value="'+list2parent.eq(3).html()+'" hidden>';
			// html+='	<input type="text" name="list2promotion" id="list2promotion" value="'+list2parent.eq(4).html()+'" hidden>';
			// html+='	<input type="text" name="formlist2seatcount" id="formlist2seatcount" value="'+list2parent.eq(5).children().attr('list2seatcount')+'" hidden>';
			$('#form2').append(html);
			this.submit();
		})
	})
	function modalpopup() {
		$("#modalcheck").fadeIn();
		$('#modalcheck').css("top", Math.max(0, (($(window).height() - $('#modalcheck').outerHeight()) / 2) + $(window).scrollTop()) + "px");
		$('#modalcheck').css("left", Math.max(0, (($(window).width() - $('#modalcheck').outerWidth()) / 2) + $(window).scrollLeft()) + "px");		
	}
	function seatpopup() {
		$("#seatpopup").fadeIn();
		$('#seatpopup').css("top", Math.max(0, (($(window).height() - $('#seatpopup').outerHeight()) / 2) + $(window).scrollTop()) + "px");
		$('#seatpopup').css("left", Math.max(0, (($(window).width() - $('#seatpopup').outerWidth()) / 2) + $(window).scrollLeft()) + "px");		
		if($('#kids').val()==''){
			$('#seatpopup #seatdiv').html('총 '+(parseInt($('#adults').val())+'명 선택가능'));
		}
		else{
			$('#seatpopup #seatdiv').html('총 '+(parseInt($('#adults').val())+parseInt($('#kids').val()))+'명 선택가능')

		}
		$('#seatdiv').append('<br><input type="text" name="" id="seatcount"> 명');
	}
	function seatpopuplist2() {
		$("#list2seatpopup").fadeIn();
		$('#list2seatpopup').css("top", Math.max(0, (($(window).height() - $('#list2seatpopup').outerHeight()) / 2) + $(window).scrollTop()) + "px");
		$('#list2seatpopup').css("left", Math.max(0, (($(window).width() - $('#list2seatpopup').outerWidth()) / 2) + $(window).scrollLeft()) + "px");		
		if($('#kids').val()==''){
			$('#list2seatpopup #seatdiv').html('총 '+(parseInt($('#adults').val())+'명 선택가능'));
		}
		else{
			$('#list2seatpopup #seatdiv').html('총 '+(parseInt($('#adults').val())+parseInt($('#kids').val()))+'명 선택가능')

		}$('#list2seatpopup #seatdiv').append('<br><input type="text" name="" id="list2seatcountinput"> 명');
	}
	function seatnumexceptionpopup() {
		$("#seatnumexceptionpopup").fadeIn();
		$('#seatnumexceptionpopup').css("top", Math.max(0, (($(window).height() - $('#seatnumexceptionpopup').outerHeight()) / 2) + $(window).scrollTop()) + "px");
		$('#seatnumexceptionpopup').css("left", Math.max(0, (($(window).width() - $('#seatnumexceptionpopup').outerWidth()) / 2) + $(window).scrollLeft()) + "px");		
		let str=$('#adults').val()+$('#kids').val()+'명 이상 선택할수 없습니다.'
		str+='<br><a href="" id="seatclose">[닫기]</a>';
		$('#seatnumexceptionpopup').children().html(str)
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
				출발지<select name="sel1" id="sel1">
					<option value="">출발지 선택</option>
				</select>
				<select name="" id="sel3" hidden>
					<!-- 도시 선택시 역명 select 태그 show() -->
				</select>
				<select name="" id="sel6" hidden>
					<!-- 역명 선택시 차량종류 select 태그 show() -->
				</select>
				<select name="" id="sel5">
					<option value="oneway">편도</option>
					<option value="round">왕복</option>
				</select>'
			</div>
			<br>
			<div id="div5">
				도착지<select name="sel2" id="sel2">
					<option value="default">도착지 선택</option>
				</select>
				<select name="" id="sel4" hidden>
					<!-- 도시 선택시 역명 select 태그 show() -->
				</select>
				<select name="" id="sel7" hidden>
					<!-- 역명 선택시 차량종류 select 태그 show() -->
				</select>
			</div>
			<br><br>
			성인 <input type="number" name="adults" id="adults" placeholder="성인 인원수" value="1">명&nbsp;&nbsp;&nbsp;
			아동 <input type="number" name="kids" id="kids" placeholder="없음" value="">명&nbsp;&nbsp;&nbsp;<select name="sel8" id="sel8">
				<option value="no">숙박 추천(필요없음)</option>
				<option value="yes">숙박 추천(필요)</option>
			</select><br><br>
			<div id="search">
				<button class="btnTrain">기차 조회</button>
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
	<b id="list1hiddeninform" hidden></b>
	<b id="list2hiddeninform" hidden></b>
	
	<form action="/reservconfirmform" method="post" id="form1">
			<input type="submit" value="">
			<input type="submit" value="왕복">
			</form>
	<form action="/reservconfirmform" method="post" id="form2">
			<input type="submit" value="">
			<input type="submit" value="편도">
			</form>
</body>
</html>