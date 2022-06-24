<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #main{width: 500px; margin: 0 auto; padding-top: 20px;}
    #board,tr,th{border: 1px solid black;border-collapse: collapse;}
    #board,tr,td{border: 1px solid black;border-collapse: collapse;}
    #loginb{display: inline-block; width: 100%;text-align: center;padding-bottom: 10px;}
    #boardd{display: grid; grid-template-columns: auto auto;}
   
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function () {
        $('#pwdsearch').on('click',function () {
            window.open('/pwdsearch','비밀번호 찾기','width=400,height=400');
        })
        $('#join').on('click',function () {
            location.href='/joinform';
        })
    })
</script>
</head>
<body>
    <!-- 메뉴 -->
    <%@ include file="/WEB-INF/include/menu.jsp" %>
     <hr>
    <div id="main">
        <b id="loginb">로그인</b>
        <form action="/" method="post">
            <div id="boardd">
                <table id="board">
                    <tr>
                        <td>아이디</td>
                        <td><input type="text" name="email" id="userid"></td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td><input type="text" name="passwd" id="passwd"></td>
                    </tr>
                </table>
                <button type="submit">로그인</button>
            </div><br>
        </form>
        <input type="button" value="비밀번호 찾기" id="pwdsearch">
        <input type="button" value="회원가입" id="join">
    </div>

	</body>
</html>
