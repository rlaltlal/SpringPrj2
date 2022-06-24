<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />

<style>
  #mypost  td:nth-of-type(1)  { width:100px; text-align:center;}  
  #mypost  td:nth-of-type(2)  { width:500px; text-align:center;}  
  #mypost  td:nth-of-type(3)  { width:150px; text-align:center;}  
  
  #quest  td:nth-of-type(1)  { width:500px; text-align:center;}
  #quest  td:nth-of-type(2)  { width:200px; text-align:center;}  
  #quest  td:nth-of-type(3)  { width:150px; text-align:center;}  
  
  #submenu {text-align:right;}
  li {list-style: none; float: left; padding: 6px; }
  ul {  display : table; margin-left: auto;  margin-right: auto;}
  
table,th,td{border: 1px solid #c0c0c0; border-collapse: collapse; }
td,th{padding: 10px;}
th { background-color : #D9D9D9;}
table{width: 80%; margin-left:auto; margin-right: auto;}
.margin2 {margin-left:auto; margin-right: auto; height :300px;}
#board {width : 80%; text-align: right; margin-left:auto; margin-right: auto;}

</style>
<script>
$(document).ready(	function() {
	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e) {
				e.preventDefault();
				console.log('click');
				actionForm.find("input[name='pageNum']")
						.val($(this).attr("href"));
				actionForm.submit();
			});
	$(".move").on("click",	function(e) {
				e.preventDefault();
				actionForm.append("<input type='hidden' name='bseq' value='"
						+ $(this).attr("href")
								+ "'>");
				actionForm.attr("action",
						"/mypage/mypost");
				actionForm.submit();

			});

});
</script>
</head>
<body>
  <div id="main"> 
  <!--  메뉴목록  -->
  <%@ include file="/WEB-INF/include/menu.jsp" %>
  <hr>
    <br><br>
  <div id="submenu">
  <!--  서브메뉴목록  -->
  <input type="button" value="내 예약"        onclick="location.href='/Mypage/Myreserv?email=${vo.email}'" >  
  <input type="button" value="여행 기록"      onclick="location.href='/Mypage/Mylog?email=${vo.email}'" >  
  <input type="button" value="내글 보기"      onclick="location.href='/Mypage/Mypost?email=${vo.email}'" >  
  <input type="button" value="회원정보 수정"  onclick="location.href='/Mypage/Myinform?email=${vo.email}'" >  
  <c:set var="rate" value="${ vo.rate }" />
  <c:if test="${rate eq 'MASTER'}">
  <input type="button" value="회원관리"       onclick="location.href='/Mypage/Manage?email=${vo.email}'" >  
  </c:if>
  </div>
  <br><br>

    
  <div class="margin">  
  <!--  게시물 목록 -->
  <table id="mypost">
      <caption><h2>내 게시글</h2></caption>
  
  <tr>
    <th>말머리</th>
    <th>제목</th>
    <th>관리</th>
  </tr>
    <c:forEach  var="myPostList" items="${ myPostList }">
    <tr>
      <td>${ myPostList.subcategory }</td>
      <td><a href="/Board2/View?email=${vo.email}&bseq=${ myPostList.bseq }" >${ myPostList.title }</a></td>
      <td>  
 	  <a href="/Mypage/MypostDelete?email=${vo.email}&bseq=${ myPostList.bseq }&pageNum=${pageMaker.cri.pageNum }" >삭제</a>
      </td>     
    </tr>
    </c:forEach>
  </table>
  <br> 
 
	
 
   <br>
  	<div class="pull-right">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="/Mypage/Mypost?email=${vo.email}&pageNum=${pageMaker.startPage -1}">Previous</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="/Mypage/Mypost?email=${vo.email}&pageNum=${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="/Mypage/Mypost?email=${vo.email}&pageNum=${pageMaker.endPage +1 }">Next</a></li>
						</c:if>


					</ul>
	 </div>
				<!--  end Pagination -->
  </div>
			
			<form id='actionForm' action="/mypage/mypost" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> <input
					type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword }"/>'>
			</form>

  <br>
  
  <!--  문의글 목록 -->  
  <div class="margin2">
  <table id="quest">
      <caption><h2>내 문의글</h2></caption>
  <tr>
    <th>문의 제목</th>
    <th>상태</th>
    <th>관리</th>
  </tr>
    <c:forEach  var="myQuestList" items="${ myQuestList }">
    <tr>
      <td><a href="${path}/Board/View2?qseq=${myQuestList.qseq}&email=${myQuestList.email}">${ myQuestList.title }</a> </td>
      <c:choose>
      <c:when test="${ myQuestList.qstate == '답변 완료' }">
      <td><a href="${path}/Board/View3?nref=${myQuestList.nref}"  style="color:blue;">${ myQuestList.qstate }</a></td>
      </c:when>
      <c:otherwise>
      <td>${ myQuestList.qstate }</td>
      </c:otherwise>
      </c:choose>
      <td>  
 	  <a href="/Mypage/MyquestDelete?email=${vo.email}&qseq=${ myQuestList.qseq }&pageNum=${pageMaker.cri.pageNum }" >삭제</a>
      </td>     
    </tr>
    </c:forEach>
    <tr style="border-left-style:hidden; border-right-style:hidden; border-bottom-style:hidden;"  >
     <td colspan="3" style="text-align:right;"> 🥇🥈🥉 최근 작성한 글만 조회 됩니다.
   <a href="/Board/List2?searchOption=t.email&keyword=${sessionScope.email}" style="color:red;">이전 글 조회하기</a>
    </td></tr>
  </table>

  </div>
  <br><br><br><br>
 <br><br><br><br>
 </div> 
</body>
</html>







