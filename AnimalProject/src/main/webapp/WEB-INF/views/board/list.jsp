<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 포맷팅 관련 태그라이브러리(JSTL/fmt) --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<!-- 헤드는 본 문이 아닌 태그다  -->
<head>
<link rel="stylesheet" href= "/resources/css/fontello.css">
<link rel="stylesheet" href= "/resources/css/buttons.css">
<!-- 모바일 -- @media-->
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>






body{
background-color: silver;

}

.container{
	display:flex;
	flex-direction: column;
	text-align: center;
	position: relative;
	top: 100px;
	
	
	
}

header{
	border-bottom: 1px solid black;
	font-size : 100px;
	
	padding-left: 20px;
	padding-bottom: 80px;
	transition:all 0.1s;
}

header:hover{
  		/*transform:translate(20px, 20px);*/
  		font-size : 110px;
        color: black;

}

footer{

	border-top: 1px solid black;
	padding: 20px;
   
}

.content{

	display:flex;
	background-color: white;
	

}
.content nav{
	
	flex-basis : 300px;	
	font-weight: bold;
	
	
}

.content aside{
	
	
}

nav, aside{
   flex-basis : 200px;	
 	flex-grow: 1;
	
	
}

main{

	flex-shrink: 0;
 	flex-grow: 2;
 	text-align:left;
 	padding: 10px;
	font-weight: bold;
	font-size:large;

}


input:focus{


	color:black;
}

a{
/*
      transition-property: font-size transform;
      transition-duration: 0.1s;
      transition:all 0.1s;
*/
  
 text-decoration:none;
 color : black;
  } 
  

a:visited {

	color :  black;
}

a:hover {

	color : black;
	  
      font-size:2rem;
}  
  

  
  
#delete {

	color : gray;
	

}

ul li{


}


footer{
font-size: 20px;
padding-top: 100px;
}


</style>
</head>
<body>

	<div class ="container">
		<header>
		CODE SHARE LIST
		</header>
		
		<section class = "content">
			<nav>
				 <ul>
				 	<c:if test = "${login == null}">
					<li><a href="/user/login">LOGIN</a></li>
					</c:if>
					<c:if test = "${login != null}">
					<li>hello! ${login.name}</li>
					</c:if>
					<c:if test = "${login == null}">
					<li><a href="<c:url value ='/user/register'/>">SIGN UP</a></li>
					</c:if>
					<c:if test = "${login != null}">
					<li><a href="/user/logout">LOGOUT</a></li>
					</c:if>
					<li><a href="/board/list">CODE SHARE LIST</a></li>
					<c:if test = "${login != null}">
					<li><a href="/board/share">CODE SHARE</a></li>
					</c:if>
				</ul>
				 
			</nav>
			
			
			<main>
						<span id="count-per-page" ">
							
	                     <i>row</i> 
	                     <input class="btn btn-izone" type="button" value="5" >  
	                     <input class="btn btn-izone" type="button" value="10">   
	                     <input class="btn btn-izone" type="button" value="15">
          				 </span>
				<table border="1" style="text-align: center;">
					<thead style="background-color: gray;">
					<tr>
						<td>No</td>
						<td>Writer</td>
						<td>Title</td>
						<td>Date</td>
						<td>View</td>
					</tr>
					</thead>
					
						<c:forEach var="b" items="${list}" >
					<tr>
						<td> ${b.boardNo} </td>
						<td> ${b.writer} </td>
						<td> <a href="<c:url value='/board/content?boardNo=${b.boardNo}&keyword=${page.paging.keyword}&condition=${page.paging.condition}&countPerPage=${page.paging.countPerPage}&page=${page.paging.page}'/>">${b.title} </a></td>
						<td> <fmt:formatDate value="${b.regDate}" pattern="yyyy- MM- dd- a hh:mm" />	 </td>
						<td> ${b.viewCnt} </td>
					</tr>
						</c:forEach>
						
					</table>	
						
			
							<select id="condition" name="condition">                            	
	                            <option value="title" >제목</option>
	                            <option value="content" >내용</option>
	                            <option value="writer" >작성자</option>
	           	                <option value="titleContent">제목+내용</option>
	           				 </select>
			
	                            <input type="text" name="keywo"  id= "keywordInput"  placeholder="검색어">
	                         	<input type="button" value="검색"  id="searchBtn">                                       
	                           
	   
				
						
						<p style="position: relative; left: 170px;">
						<c:if test="${page.prev}">						
						<a href="<c:url value='/board/list?page=${page.beginPage - 1}&keyword=${page.paging.keyword}&condition=${page.paging.condition}&countPerPage=${page.paging.countPerPage}'/>">prev</a> 
						</c:if>
						<c:forEach var="pageNum" begin="${page.beginPage}" end="${page.endPage}">
						<a href="<c:url value='/board/list?page=${pageNum}&keyword=${page.paging.keyword}&condition=${page.paging.condition}&countPerPage=${page.paging.countPerPage}'/>">${pageNum}</a>
						</c:forEach>
						<c:if test="${page.next}">
						<a href="<c:url value='/board/list?page=${page.endPage + 1}&keyword=${page.paging.keyword}&condition=${page.paging.condition}&countPerPage=${page.paging.countPerPage}'/>">next</a> 
						</c:if>
						</p>
				
		
				
			</main>
		
		</section>
		<footer>
		<a href = "/board/list" class="icon-home-outline"></a>
		<a href = "https://www.google.co.kr/" class= "icon-ie"></a>
		<a href = "https://www.instagram.com/" class="icon-instagram"></a>
		<a href = "https://ko-kr.facebook.com/" class="icon-facebook-squared"></a>
		<a href = "https://www.google.co.kr/" class=" icon-gplus"></a><br>

		
		<strong>COMPANY BY MINJUN</strong>
		</footer>
	
	</div>
	
</body>

<script>
$(function() {
	
	
	/*
	//$("#ex").click(function(){
		
		//let countPerPage = $("#count-per-page .btn-izone").val();
		const page = "${page}"
		const keyword = "${page.paging.keyword}"
		const condition = "${page.paging.condition}"
		location.href = "/board/list?countPerPage="
				+countPerPage+
				"&keyword=" + keyword +"&condition=" + condition +"&page=" + page;
		
		// 자바스크립트로 val 값을 받아서 href에 값을 넣어서 보내주고 싶은데 안보내졋다 
		
	});*/
	
	
	
	
	$("#count-per-page .btn-izone").click(function() {
		
		let countPerPage = $(this).val();
		const keyword = "${page.paging.keyword}"
		const condition = "${page.paging.condition}"
		const page = "${page.paging.page}"
	
		location.href = 
				"/board/list?countPerPage="+countPerPage
				+"&keyword=" + keyword	
				+"&condition=" + condition
				+"&page=" + page;
	});
	
	
	
	$("#searchBtn").click(function() {
	
	
		const countPerPage = "${page.paging.countPerPage}"
		const keyword = $("#keywordInput").val();
		const condition = $("#condition option:selected").val();
		location.href = "/board/list?&keyword=" + keyword	
									+"&condition=" + condition
									+"&countPerPage=" + countPerPage;
		
	});
	
	
	
});


</script>




</html>