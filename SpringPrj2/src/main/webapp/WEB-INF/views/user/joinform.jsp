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
    #joinb{display: inline-block; width: 100%;text-align: center;padding-bottom: 10px;}
    #boardd{display: grid; grid-template-columns: auto auto;}
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
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function () {
        $('.check').on('click',function () {
            $("#modalcheck").fadeIn();
        })
        $('.modal_content').on('click',function () {
            $(".modal").fadeOut();
        })
        $('#identinum').on('click',function () {
            $("#modalidenti").fadeIn();
        })
    })
</script>
</head>
<body>
    <!-- 메뉴 -->
    <%@ include file="/WEB-INF/include/menu.jsp" %>
     <hr>
    <div class="modal" id="modalcheck">
        <div class="modal_content" title="modal">
            중복 or 가능
        </div>
    </div>
    <div class="modal" id="modalidenti">
        <div class="modal_content" title="modal">
            이메일 보내기
        </div>
    </div>
    <div id="main">
        <b id="joinb">회원가입</b>
        <form action="/join" method="post">
            <div id="boardd">
                <table id="board">
                    <tr>
                        <td>이메일</td>
                        <td><input type="text" name="email" id="userid"></td>
                    </tr>
                    <tr>
                        <td>이메일 인증번호</td>
                        <td><input type="text" name="passwd" id="passwd"></td>
                    </tr>
                    <tr>
                        <td>닉네임</td>
                        <td><input type="text" name="passwd" id="passwd"></td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td><input type="text" name="passwd" id="passwd"></td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td><input type="text" name="passwd" id="passwd"></td>
                    </tr>
                </table>
                <div id="buttons">
                    <input type="button" value="중복확인" class="check">
                    <input type="button" value="인증번호 전송" id="identinum">
                    <br><br><br>
                    <input type="button" value="중복확인" class="check">
                </div>
            </div><br>
            <button type="submit">가입하기</button>
        </form>
    </div>

	</body>
</html>
