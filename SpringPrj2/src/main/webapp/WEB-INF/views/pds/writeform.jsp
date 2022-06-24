<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/css/common.css">
<style>
	#pdsWriteTable td:first-child{width: 150px; text-align: center;}
	#pdsWriteTable td:last-child{text-align: center;}
	input[type=text]{width: 100%;}
	textarea{width: 100%; height: 300px;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function () {
		let num=1;
		$('#btnAddFile').on('click',function () {
			let html='<input type="file" name="upfile'+num;
			html+='" class="upfile"><br>';
			$('#tdfile').append(html);
			num++;
		})
	})
</script>
</head>
<body>
<!--* Post - HTTP 1.0버전 : 용량제한 있음
			HTTP 1.1버전 : 없음
	
	* enctype="multipart/form-data" 속성 반드시 추가
		=> file type binary 정보가 전송가능	
	
	* 파일 전송받는 Controller(java)에서 파일 저장해야함

	* 파일처리 라이브러리 사용필요
	  1) cos.jar 라이브러리 사용 : 코딩이 간단하면서 파일업로드 처리
	  2) commons-io.jar 
	     common-fileupload.jar 
	* 게시물,제목,내용 => ORACLE에 저장
		파일 저장 => ORACLE X 
		파일 이름만 ORACLE에 저장
		실제 파일은 C:\upload폴더에 저장
	-->
	<div id="main">
		<!-- 메뉴 -->
		<%@ include file="/WEB-INF/include/menus.jsp"%>

		<!-- 새글쓰기 자료실 -->
		<form action="/Pds/Write" method="post" id="form1" enctype="multipart/form-data">
			<input type="hidden" name="menu_id" value="${map.menu_id}">
			<input type="hidden" name="bnum" value="${map.bnum}">
			<input type="hidden" name="lvl" value="${ map.lvl}">
			<input type="hidden" name="step" value="${map.step}">
			<input type="hidden" name="nref" value="${map.nref}">
			<table id="pdsWriteTable">
				<caption><h2>새글쓰기 (자료실)</h2></caption>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writter" id="writter"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<td>글 내용</td>
					<td><textarea name="cont" id="cont" cols="30" rows="10"></textarea></td>
				</tr>
				<tr>
					<td>파일</td>
					<td id="tdfile">
						<input type="button" id="btnAddFile" value="파일 추가"><br>
						<input type="file" name="upfile" class="upfile"><br>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="저장"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>