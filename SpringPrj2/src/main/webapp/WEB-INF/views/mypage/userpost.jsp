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
						"/mypage/userpost");
				actionForm.submit();

			});

});


</script>
</head>
<body>
  <div id="main"> 

 <br><br><br><br>
 <div>  
  <!--  게시물 목록 -->
  
  <table id="mypost">
    <caption><h2>${email}님의 게시글</h2></caption>
<tr>
    <th>말머리</th>
    <th>제목</th>
    <th>관리</th>
  </tr>
    <c:forEach  var="myPostList" items="${ myPostList }">
    <tr>
      <td>${ myPostList.subcategory }</td>
      <td><a href="/Board2/View?email=${email}&bseq=${ myPostList.bseq }" >${ myPostList.title }</a></td>
      <td>  
 	  <a href="/Mypage/MypostDelete2?email=${email}&bseq=${ myPostList.bseq }&pageNum=${pageMaker.cri.pageNum }" >삭제</a>
      </td>     
    </tr>
    </c:forEach>
  </table>
  <br>  <br>
  	<div class="pull-right">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="/Mypage/Userpost?email=${email}&pageNum=${pageMaker.startPage -1}">Previous</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="/Mypage/Userpost?email=${email}&pageNum=${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="/Mypage/Userpost?email=${email}&pageNum=${pageMaker.endPage +1 }">Next</a></li>
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

  <br><br><br><br>
  
  


 
 </div> 
</body>
</html>







