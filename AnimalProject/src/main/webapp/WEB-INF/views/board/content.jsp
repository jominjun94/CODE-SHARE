<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 포맷팅 관련 태그라이브러리(JSTL/fmt) --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<!-- 헤드는 본문이 아닌 태그다  -->
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
		CODE CONTENT
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
	 
	 			<table border="1">
	 				<tr>
	 					<td>번호</td>
	 					<td>작성자</td>
	 					<td>이름</td>
	 					<td>내용</td>
	 				</tr>
	 				<tr>
	 					<td>${get.boardNo}</td>
	 					<td>${get.content}</td>
	 					<td>${get.writer}</td>
	 					<td>${get.title}</td>
	 				</tr>
				</table>
				<input type ="button" id = "back" value ="back">
				<c:if test = "${login.name == get.writer}">
				<input type ="button" id = "modify" value ="변경">
				</c:if>
				<c:if test = "${login.name == get.writer}">
				<input type ="button" id = "delete" value ="삭제">
				</c:if>
			</main>
		
		</section>
		<footer>
		<i class="icon-home-outline"></i>
		<i class="icon-ie"></i>
		<i class="icon-instagram"></i>
		<i class="icon-facebook-squared"></i>
		<i class=" icon-gplus"></i><br>
		
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
	
	
	
	
	
	
	
	
	$("#back").click(function() {
	
		const page ="${SearchVO.page}";
		const countPerPage = "${SearchVO.countPerPage}";
		const keyword ="${SearchVO.keyword}";
		const condition = "${SearchVO.condition}";
		location.href = "/board/list?keyword=" + keyword	
									+"&condition=" + condition
									+"&countPerPage=" + countPerPage
									+"&page="+page; 
		
	});
	
	
	$("#modify").click(function() {
		
			const boardNo = "${get.boardNo}";
			const page ="${SearchVO.page}";
			const countPerPage = "${SearchVO.countPerPage}";
			const keyword ="${SearchVO.keyword}";
			const condition = "${SearchVO.condition}";
			location.href = "/board/modify?keyword=" + keyword	
										+"&condition=" + condition
										+"&countPerPage=" + countPerPage
										+"&page="+page
										+"&boardNo=" +boardNo;
		
	});
	
	
	$("#delete").click(function() {
		if(confirm('ok?')){
			alert("ok");
		
		
		const boardNo = "${get.boardNo}";
		
		location.href = "/board/delete?boardNo=" + boardNo;
		} else {
			alert("cancle");
		}
									
		
	});
});


</script>




</html>