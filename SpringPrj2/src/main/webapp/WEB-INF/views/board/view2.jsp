<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link rel="stylesheet" href="/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#board  td:nth-of-type(1) { width:150px; text-align:center;}
  #board  td:nth-of-type(2) { width:400px; text-align:left;}
  #board  td:nth-of-type(3) { width:150px; text-align:center;}
  #board  td:nth-of-type(4) { width:400px; text-align:left;}
  body{background-color:#FCFFDF;}
  td{background-color:white;}
  h2{color:#1ABC9C;}
  table, th, td {  
      border : 10px solid  #E0E0E0;;
	  border-collapse : collapse;

   }
  #board  tr:nth-of-type(3) { height : 400px; vertical-align: top; }
  
  
  #board  input     { width:100%; }
  #board  textarea  { width:100%; height: 400px;  }
</style>
<script>
	$(document).ready(function() {
		
		// 댓글 목록 불러오기
	//	listReply2();
		
		// 댓글 쓰기 버튼 클릭 이벤트
		$("#btnReply").click(function() {
			var replytext=$("#replytext").val();
			var qseq = "${boardVo.qseq}";
			var param = "replytext="+replytext+"&qseq="+qseq+"&replayer=admin@admin.com";
			$.ajax({
				type: "post",
				url: "${path}/reply/insert.do",
				data:param,
				success: function() {
					alert('댓글이 등록되었습니다.');
					listReply2();
				}
			});
		});
		
		// 게시글 목록 버튼 클릭 이벤트 : 버튼 클릭시 상세보기 화면에 있던 페이지, 검색옵션, 키워드 값 가지고 목록
		$("#btnList").click(function() {
			location.href="${path}/Board/List2?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
		});
		
		// 게시글 삭제 버튼 클릭 이벤트
		$("#btnDelete").click(function() {
			if(confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/Board/Delete2";
				document.form1.submit();
			}
		});
	
	// 게시글 수정 버튼 클릭이벤트
	$("#bntUpdate").click(function() {
		var title = $("#title").val();
		var cont  = $("#cont").val();
		
		if(title == "") {
			alert("제목을 입력하세요");
			document.form1.title.focus();
			return;
		}
		if(cont == "") {
			alert("내용을 입력하세요");
			document.form1.cont.focus();
			return;
		}
		
		document.form1.action="${path}/Board/UpdateForm2";
		document.form1.submit();
	});
	
});

// 댓글목록 1
function listReply() {
	$.ajax({
		type:"get",
		url:"${path}/reply/list.do?qseq=${boardVo.qseq}",
		succsess: function(result) {
			$("#listReply").html(result);
		}
	});
}

// 댓글목록 2
function listReply2() {
	$.ajax({
		type:"get",
		url:"${path}/reply/listJson.do?qseq=${boardVo.qseq}",
		success: function(result) {
			console.log(result);
			var output = "<table>";
			for(var i in result) {
				output += "<tr>";
				 output += "<td>"+result[i].replayer;
				ouput  += "(" + result[i].regdate + ")<br>";
				output += result[i].replytext+"</td>"; 
				output += "</tr>";
			}
			output += "</table>";
			$("#listReply").html(output);
		}
	});
}
	/* function changeDate(date) {
		date  	= new Date(parseInst(date));
		year  	= date.getFullYear();
		month 	= date.getMonth();
		day   	= date.getDate();
		hour  	= date.getHours();
		minute  = date.getMinutes();
		second  = date.getSeconds();
		strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
		return strDate;
	} */

</script>
</head>
<body>
<%@ include file="/WEB-INF/include/menu.jsp" %>
	<hr>

	<%-- <!--  로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
	 <c:if test="${boardVo.email != null}">
	<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성해 주세요"></textarea>
	<br>
	<button type="button" id="btnReply">댓글 작성</button>
	 </c:if>  <!--나중에 로그인 한 사람만 댓글 쓰게 주석 해제-->
	<hr>
	</div>
	<!-- 댓글 출력할 위치 -->
	<div id="listReply"></div> --%>
	
 <div id="main">
    
    <!--  내용보기 -->      
      <table id="board">
       <caption><h2>게시글 보기</h2></caption>
       <tr>
        <td colspan="1">제목</td>        
        <td colspan="3">${ boardVo.title } </td>
       </tr>
       <tr>
        <td>작성일</td>        
        <td>${ boardVo.writedate } </td>
        <td>작성자</td>        
        <td>${ boardVo.email } </td>
       </tr>
       <tr>
        <td>내용</td>
        <td colspan="3">${ boardVo.cont }</td>
       </tr>
        <tr>
        <td>상태</td>
        <c:choose>
          <c:when test="${ boardVo.qstate == '답변 완료' }">
           <td colspan="3"><a href="${path}/Board/View3?nref=${boardVo.nref}"  style="color:blue;">${ boardVo.qstate }</a></td>
           </c:when>
           <c:otherwise>
           <td colspan="3">${ boardVo.qstate }</td>
           </c:otherwise>
           </c:choose>
       </tr>
       <tr>
        <td colspan="4">
        <c:choose>
        <c:when test="${boardVo.lvl == 0 && sessionScope.email == boardVo.email && boardVo.qstate ne '답변 완료'}">
                  [<a href="/Board/UpdateForm2?qseq=${boardVo.qseq}&menu_id=${menu_id}">수정</a>]        
                  [<a href="/Board/Delete2?qseq=${boardVo.qseq}&menu_id=${menu_id}">삭제</a>]   
        </c:when>
        <c:when test="${boardVo.lvl == 1 && sessionScope.email == 'www.admin@admin.com'}">
                  [<a href="/Board/UpdateForm2?qseq=${boardVo.qseq}&menu_id=${menu_id}">수정</a>]        
                  [<a href="/Board/Delete2?qseq=${boardVo.qseq}&menu_id=${menu_id}">삭제</a>]   
        </c:when>
        <c:otherwise>

        </c:otherwise>
        </c:choose>       
        [<a href="/Board/List2?menu_id=${ menu_id }">목록으로</a>]        
        [<a href="javascript:history.back()">이전으로</a>]  
        <c:if test="${sessionScope.email == 'www.admin@admin.com'}">
        [<a href="/Board/WriteForm2?menu_id=MENU02&qseq=${boardVo.qseq}&bnum=${boardVo.bnum}&lvl=${boardVo.lvl}&step=${boardVo.step}&nref=${boardVo.nref}&email=${boardVo.email}">답 글 쓰기</a>]      
        </c:if>
        [<a href="/">Home</a>]        
        </td>
       </tr>
      </table> 
   </div>
   <div style="height:300px;"></div>
</body>
</html>






