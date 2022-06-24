<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLine", "\n"); %>
<%--pageContext : 현재페이지에서만 사용하는 변수 --%>
				
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/css/common.css">
<style>
	#board td:nth-of-type(1){width: 150px; text-align: center;}
	#board td:nth-of-type(2){width:400px; text-align: left;}
	#board td:nth-of-type(3){width: 150px; text-align: center;}
	#board td:nth-of-type(4){width:400px; text-align: left;}
	#board tr:nth-of-type(4){height: 400px;vertical-align: top;}
	#board tr:not(:nth-of-type(5)) input{width: 100%;}
	#board textarea{width: 100%; height: 400px;}
	#board td[colspan]{text-align: left;}
	#board tr:last-child td[colspan]{text-align: center;}
	#file{border-width: 0px;}
	tr:nth-of-type(5) input{box-sizing: content-box;}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function () {
		let num=1;
		$('#btnAddFile').on('click',function (e) {
			// form태그내 input=button아닌 button은 submit으로 작동. submit기능 제거
			e.preventDefault();
			e.stopPropagation();
			let html='<input type="file" name="upfile'+num;
			html+='" class="upfile"><br>';
			$('#tdfile').append(html);
			num++;
		})
		$('form').on('submit',function (e) {
			if($('[name=title]').val().trim()==''){
				alert('제목을 입력해주세요.');
				$('[name=title]').focus();
				return false;
			}
		})
		$('#aDelete').on('click',function (e) {
			//a태그 기본이벤트 제거
			e.preventDefault();
			e.stopPropagation();
			let aDelete=e.target; // let aDelete=this; 같음
			let href=aDelete.href; 
			alert(href);
			$.ajax({
				url:href,
				method:get,
				success:function(data){
					alert('삭제 완료');
					$('#aDelete').parent().remove;
				},
				error:function(xhr){
					alert(xhr.status+' : '+xhr.statusText);
				}
				

			})
 		})
		$('.Xbutton').on('click',function (e) {
			e.preventDefault();
			e.stopPropagation();
			e.target.parentElement.remove();	
		})
	})
</script>
</head>
<body>
	<div id="main">
		<!-- 메뉴 목록-->
		<%@ include file="/WEB-INF/include/pdsmenus.jsp" %>
		<!-- 글 조회-->
		<table id="board">
			<form action="/Pds/Update" method="post" enctype="multipart/form-data">
				<!-- 첨부파일과 함께 글쓰기와 동일하게 enctype="multipart/form-data" 추가-->
				<input type="hidden" name="menu_id" value="${pdsVo.menu_id}">
				<input type="hidden" name="idx" value="${pdsVo.idx}">
				<caption><h2>내용 보기</h2></caption>
				<tr>
					<td>글 번호</td>
					<td>${pdsVo.idx} </td>
					<td>조회수</td>
					<td>${pdsVo.readcount} </td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${pdsVo.regdate}</td>
					<td>작성자</td>
					<td>${pdsVo.writter}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" name="title" id="title" value="${pdsVo.title}"> </td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">
						<textarea name="cont" id="cont" cols="30" rows="10">${pdsVo.cont}</textarea>
					</td> 
					
				</tr>
				<tr>
					<td>첨부파일</td>
					<td colspan="3" id="tdfile">
						<c:forEach var="filesVo" items="${filesList}" varStatus="status">
							<div id="fileAndXbutton${status.index}">
								<a href="/Pds/download/external/${filesVo.sfilename}">${filesVo.filename}</a>
								&nbsp;&nbsp;&nbsp;
								<a id="aDelete" href="/deleteFile?file_num=${filesVo.file_num}&sfilename=${filesVo.sfilename}">[X]</a><br>
								<input type="text" name="file" id="file" value="${fileVo.file_num}" readonly>
								<input type="text" name="file" id="file" value="${filesVo.filename}" readonly>
								 <button id="Xbutton${status.index}" class="Xbutton">X</button> <br>	
							</div>
						</c:forEach>
						<button id="btnAddFile">파일 추가</button></br>
						<input type="file" name="upfile" class="upfile"><br>
					</td>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<button type="submit">제출</button>
					</td>
				</tr>
			</form>
		</table>
	</div>
</body>
</html>