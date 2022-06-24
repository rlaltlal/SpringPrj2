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
#list1 tr th{ width: 750px; background-color: gainsboro;}
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
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
let i1 = 1;
//숙박지 조회 버튼 클릭시 정보 출력
    $('#btnAccom').on('click',function () {
        let str=$('#sel2 option:selected').val().split(',');

        console.log($('#sel4 option:selected').html());
        let str1='';
        switch ($('#sel4 option:selected').html()) {
            case '서울': 
            str1=1; 
            break;
                case '인천': 
            str1=2; 
            break;
                case '대전': 
            str1=3; 
            break;
                case '대구': 
            str1=4; 
            break;
                case '광주': 
            str1=5; 
            break;
                case '부산': 
            str1=6; 
            break;
                case '울산': 
            str1=7; 
            break;
                case '세종특별자치시': 
            str1=8; 
            break;
                case '경기도': 
            str1=3; 
            break;
                case '강원도': 
            str1=3; 
            break;
            
                case '충청북도': 
            str1=3; 
            break;
            
                case '충청남도': 
            str1=3; 
            break;
            
                case '경상북도': 
            str1=3; 
            break;
            
                case '경상남도': 
            str1=3; 
            break;
            
                case '전라북도': 
            str1=3; 
            break;
            
                case '전라남도': 
            str1=3; 
            break;
            default:
                break;
        }

        console.log('어디로'+str1);

        console.log(str);
        console.log(str[0]);
        console.log(str[1]);

        $.ajax({
            url:'/RestBoard/accom',
            data:{serviceKey:'tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D',
                    numOfRows:'10',
                                pageNo:'1',
                                MobileOs:'ETC', 
                                MobileApp:'AppTest',
                                arrange:'A',
                                    listYN:'Y',
                    areaCode:str1
            },
            method:'POST'
        }).done(function (data) {
            console.log(data);
            let html='';
            html+='<table id="list1">					';
            html+='	<tr>';
            html+='		<th width="80">이름</th>';
            html+='		<th width="200">사진</th>';
            html+='		<th >주소</th>';
            html+='		<th>전화번호</th>';
            html+='		<th>가격</th>';
            html+='		<th>선택하기</th>';
            
            html+='	</tr>';
            $(data).find('item').each(function (index,item) {
                
                
            
                html+='	<tr>';
                html+='		<td><font size="2">'+$(item).find('title').html()+'</font></td>';
                let imgsrc=$(item).find('firstimage');
                if(imgsrc.length){
                    html+='		<td>'+'<img src="'+$(item).find('firstimage').html()+'" alt="" style="width:100px;height:100px">'+'</td>'
                }
                else{
                    html+='		<td>사진정보 없음</td>';
                }
                html+='		<td>'+$(item).find('addr1').html()+'</td>';
                let tel=$(item).find('tel');
                if(tel.length){
                    html+='		<td>'+$(item).find('tel').html()+'</td>';
                }
                else{
                    html+='		<td>전화정보 없음</td>';
                }
                html+='		<td>';
                let rand=Math.random();
                rand=Math.floor((rand*10+1)*10000);
                rand=Math.round(rand/1000)*5000;
                html+=rand+'</td>';
                html+='		<td><a href="" id="seatchoose">선택하기</a></td>';
                html+='	</tr>';
                
            })
            html+='</table>';
            let html2 = '<div id="div1_1"></div>';
            html2 += '<div id="div1_2"></div>';
            $('#div1').html(html2);
            
            $('#div1_1').html(html);
            html = '<button style="height: 100px; " id="pay" >결제<br>하기</button>';
            $('#div1_2').html(html);
            $('#div1_2').css('padding-left', '10px' );
        })
        .fail(function (error,textStatus,errorThrown) {
            console.log(error);
            alert('Error :'+error)
        })
        
        
        
        // 객실 인원 선택
        const changeSelected = (e) => {
            const $select = document.querySelector('#roomtype');
            $select.value = 'roomtype1'
        };
        
        // 성인 인원수 버튼 카운트
        function onlyNumber() {
            var str = 100;
            var Mynum =
                document.getElementById("adult").value;
            Mynum = Mynum.replace(/[^0~9]/g,'');
            document.getElementById("adult").value=Mynum;
            var plus = 
                doucument.getElementById("adult").value=Mynum;
            if( plus < str ) {
                document.getElementById("adult").value=100;
            } else if (plus > 300 ) {
                document.getElementById("adult").value=300;
            }
        }
        $(document).ready(function(){
            var inp =$("#adult").val();
            $(".up").on("click",function(){
                setTimeout(function(){
                if (inp == 300)
                {
                    inp;
                }
                else{inp ++;}
                $("#adult").val(inp);
                },500);
            });
            $(".down").on("click",function(){
                setTimeout(function(){
                if (inp == 100)
                {
                    inp;
                }
                else if(inp <= 300)
                {
                    inp--;
                }
                $("#adult").val(inp);
                },500);
            });
        }); // 인원수 버튼
        
        // 아동 인원수 버튼 카운트
        function onlyNumber() {
            var str = 100;
            var Mynum =
                document.getElementById("kid").value;
            Mynum = Mynum.replace(/[^0~9]/g,'');
            document.getElementById("kid").value=Mynum;
            var plus = 
                doucument.getElementById("kid").value=Mynum;
            if( plus < str ) {
                document.getElementById("kid").value=100;
            } else if (plus > 300 ) {
                document.getElementById("kid").value=300;
            }
        }
        $(document).ready(function(){
            var inp =$("#kid").val();
            $(".kidsup").on("click",function(){
                setTimeout(function(){
                if (inp == 300)
                {
                    inp;
                }
                else{inp ++;}
                $("#kid").val(inp);
                },500);
            });
            $(".kidsdown").on("click",function(){
                setTimeout(function(){
                if (inp == 100)
                {
                    inp;
                }
                else if(inp <= 300)
                {
                    inp--;
                }
                $("#kid").val(inp);
                },500);
            });
        }); // 인원수 버튼
        
        
        
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
            /* else{
                seatnumexceptionpopup();
                return false;
            } */ 
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
    $('#accomhiddeninform').empty();
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
        
        
        ///===========
        
        console.log($('#list1 tr').length);
        $('#list1 tr').each(function name(index, item) {
            if($(item).children().eq(0).html() == $('#accomhiddeninform').html().trim()) {
                console.log('here');
                $(item).css('background-color', 'beige');
                $(item).children().eq(5).children().html('선택완료');
            }
        });
        $('#accomhiddeninform').empty();

        let room = '';
        let adults = '';
        let kids = '';
        $('#roomdiv div').each(function (index, item) {
            room = $(item).children().eq(0).text();
            adults = $(item).children().eq(2).children('input').val();
            kids = $(item).children().eq(3).children('input').val();
            return false;
        }); 
        let roomtype = $('#roomdiv #templatediv #roomtypediv #roomtype option:selected').val();
        let html = '';
        html += '<input type="text" name="room" id="room" value="'+room+'" hidden>';
        html += '<input type="text" name="adults" id="adults" value="'+adults+'" hidden>';
        html += '<input type="text" name="kids" id="kids" value="'+kids+'" hidden>';
        html += '<input type="text" name="roomtype" id="roomtype" value="'+roomtype+'" hidden>';
        $('#form1').append(html);

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
});
console.log(people+','+(parseInt(seatcounts)+parseInt(seatcount)))
if(people<(parseInt(seatcounts)+parseInt(seatcount))){ 
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
})
    
$(document).on('click','#seatchoose',function(e) {
            e.preventDefault();
                        e.stopPropagation();
                        // modalpopup();
                        // roomnumexception();
                        console.log($(e.target).parent().parent().children().eq(0).html());
                        $('#accomhiddeninform').append($(e.target).parent().parent().children().eq(0).html());
                        seatpopup();
                        
        })
let count = 0;
$(document).on('click','#roomplus',function() {
    if( count < 3 ) {

        let html = '';
        html+='<div id="templatediv'+ count +'" style="display: grid; border-bottom: 1px solid lightgray;';
        html+='grid-template-columns: 25% 25% 25% 25%;">';
        html+='	<div id="roomnumdiv" style="border-right: 1px solid lightgray;">';
        html+='		객실<br>Room ' + (parseInt(count) + 2);
        html+='	</div>';
        html+='	<div id="roomtypediv" style="border-right: 1px solid lightgray;">';
        html+='		객실타입<br>';
        html+='		<select id="roomtype" >';
        html+='			<option value="싱글">싱글</option>';
        html+='			<option value="트윈">트윈</option>';
        html+='			<option value="패밀리트윈">패밀리트윈</option>';
        html+='			<option value="디럭스트윈">디럭스트윈</option>';
        html+='		</select>';
    html+='';
        html+='	</div>';
        html+='	<div id="roomadultdiv" style="border-right: 1px solid lightgray;">';
        html+='		성인<br>';
        html+='		<img src="/img/minusbtn.png" alt="" id="imgminusadult'+count+'">';
        html+='		<input type="text" value="1" id="adult" style="width:30px;"';
        html+='		onfocusout="onlyNumber();" />';
        html+='		<img src="/img/plubtn.png" alt="">';
    html+='';
        html+='	</div>';
        html+='	<div id="roomkidsdiv">';
        html+='		어린이<br>';
        html+='		<img src="/img/minusbtn.png" alt="" id="imgminuskids">';
        html+='		<input type="text" value="0" id="kid" style="width:30px;"';
        html+='		onfocusout="onlyNumber();" />';
        html+='		<img src="/img/plubtn.png" alt="">';
        html+='	</div>';
    
        html+='</div>'; count++;
        $('#roomplusdiv').before(html);
    } else {
        alert('더 이상 선택할 수 없습니다');
    }

})
$(document).on('click','#roomdiv img',function(e) {
    console.log($(e.target).attr('src'));
    if( $(e.target).attr('src') == '/img/minusbtn.png') {
        
        let input = $(e.target).parent().children('input').val();
        input--;
        $(e.target).parent().children('input').val(input);
    } else if( $(e.target).attr('src') == '/img/plubtn.png' ) {
        let input = $(e.target).parent().children('input').val();
        input++;
        $(e.target).parent().children('input').val(input);

    }
})

$(document).on('click','#pay',function() {
    let a = $('#list1 tr a');
    $(a).each(function(index, item) {
        if ($(item).html() =='선택완료' ) {
            console.log($(item).parent().parent().children().eq(0).html());
            console.log($(item).parent().parent().children().eq(2).html());
            console.log($(item).parent().parent().children().eq(3).html());
            console.log($(item).parent().parent().children().eq(4).html());
            let html = '';
            html += '<input type="text" name="accom_name" id="accom_name" value="'+$(item).parent().parent().children().eq(0).text()+'" hidden>';
            html += '<input type="text" name="address" id="address" value="'+$(item).parent().parent().children().eq(2).html()+'" hidden>';
            html += '<input type="text" name="phone" id="phone" value="'+$(item).parent().parent().children().eq(3).html()+'" hidden>';
            html += '<input type="text" name="price" id="price" value="'+$(item).parent().parent().children().eq(4).html()+'" hidden>';
            $('#form1').append(html);
        }
    })
     $('#form1').submit();
    
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
$('#seatpopup #innerseatpopup').css("width", "700px");		
$('#seatpopup #innerseatpopup').css("height", "500px");		
$('#seatpopup #innerseatpopup').css("top", "30%");		
$('#seatpopup #innerseatpopup').css("left", "40%");		
$('#seatpopup #title').html($('#accomhiddeninform').text()+ ' 객실, 인원 선택');
$('#seatpopup #title').css('font-weight','bold');

console.log($('#accomhiddeninform').text())
}
//function roomnumexception() {
//	$("#roomnumexception").fadeIn();
//		$('#roomnumexception').css("top", Math.max(0, (($(window).height() - $('#roomnumexception').outerHeight()) / 2) + $(window).scrollTop()) + "px");
//		$('#roomnumexception').css("left", Math.max(0, (($(window).width() - $('#roomnumexception').outerWidth()) / 2) + $(window).scrollLeft()) + "px");	
//}
function roomnumexception() {
            $("#roomnumexception").fadeIn();
            $('#roomnumexception').css("top", Math.max(0, (($(window).height() - $('#roomnumexception').outerHeight()) / 2) + $(window).scrollTop()) + "px");
            $('#roomnumexception').css("left", Math.max(0, (($(window).width() - $('#roomnumexception').outerWidth()) / 2) + $(window).scrollLeft()) + "px");      
            let str='명 이상 선택할수 없습니다.'
            str+='<br><a href="" id="justclose">[닫기]</a>';
            $('#roomnumexception').children().html(str)
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
/* function seatnumexceptionpopup() {
$("#seatnumexceptionpopup").fadeIn();
$('#seatnumexceptionpopup').css("top", Math.max(0, (($(window).height() - $('#seatnumexceptionpopup').outerHeight()) / 2) + $(window).scrollTop()) + "px");
$('#seatnumexceptionpopup').css("left", Math.max(0, (($(window).width() - $('#seatnumexceptionpopup').outerWidth()) / 2) + $(window).scrollLeft()) + "px");		
let str=$('#adults').val()+$('#kids').val()+'명 이상 선택할수 없습니다.'
str+='<br><a href="" id="seatclose">[닫기]</a>';
$('#seatnumexceptionpopup').children().html(str)
} */
</script>
</head>
<body>
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
        <button id="btnAccom">숙박 시설 조회</button>
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
<div class="modal" id="roomnumexception"> <!-- 로딩창 -->
<div class="modal_content" title="modal" id="innerexception">
    더 이상 선택할 수 없습니다.
</div>
</div>
<div class="modal" id="seatpopup"> <!-- 좌석선택창 -->
<div class="modal_content" title="modal" style="padding: 0; " id="innerseatpopup">
    <div id="title" style="background-color: #90C1D7; border-radius: 10px; ">

    </div>
    
    <div id="roomdiv" style="border: 1px solid lightgray;
    
    height: 350px;
    margin: 20px;">
    <div id="templatediv" style="display: grid; border-bottom: 1px solid lightgray;
    grid-template-columns: 25% 25% 25% 25%;">
        <div id="roomnumdiv" style="border-right: 1px solid lightgray;">
            객실<br>Room 1
        </div>
        <div id="roomtypediv" style="border-right: 1px solid lightgray;">
            객실타입<br>
            <select id="roomtype" >
                <option value="싱글">싱글</option>
                <option value="트윈">트윈</option>
                <option value="패밀리트윈">패밀리트윈</option>
                <option value="디럭스트윈">디럭스트윈</option>
            </select>

        </div>
        <div id="roomadultdiv" style="border-right: 1px solid lightgray;">
            성인<br>
            <img src="/img/minusbtn.png" alt="">
            <input type="text" value="1" id="adult" style="width:30px;"
            onfocusout="onlyNumber();" />
            <img src="/img/plubtn.png" alt="">

        </div>
        <div id="roomkidsdiv">
            어린이<br>
            <img src="/img/minusbtn.png" alt="">
            <input type="text" value="0" id="kid" style="width:30px;"
            onfocusout="onlyNumber();" />
            <img src="/img/plubtn.png" alt="">
        </div>

    </div>
    <div id="roomplusdiv" style="padding-top: 15px;">
        <img src="/img/plusbtn.png" alt="" id="roomplus">
    </div>
    </div>
    <div>
    </div>
    <br>
    <a href="http://localhost:9090/accomreservform" id="seatchosen">[완료]</a>
    <a href="http://localhost:9090/accomreservform" id="seatclose">[닫기]</a>
</div>
</div>
<div class="modal" id="list2seatpopup"> <!-- 호텔 선택창 -->
<div class="modal_content" title="modal">
    객실, 인원을 입력해주세요.
    <div id="seatdiv"></div>
    <a href="http://localhost:9090/accomreservform" id="seatchosen2">[완료]</a>
    <a href="http://localhost:9090/accomreservform" id="seatclose">[닫기]</a>
</div>
</div>
<div class="modal" id="seatnumexceptionpopup"> <!-- 로딩창 -->
<div class="modal_content" title="modal">
</div>
</div>
<b id="list1hiddeninform" hidden></b>
<b id="list2hiddeninform" hidden></b>x
<div id="accomhiddeninform" hidden>

</div>

<form action="/reservconfirmform" id="form1" >
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






</form>
</body>
</html>

