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
		REGISTER
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
		<h1>회원가입</h1>
<span id="result_id_msg"></span>
<button id="duplicate_check" type="button">중복체크</button>
<form id="signUpForm" action="<c:url value ='/user/register'/>" method="post" onsubmit="return check()">
<table>

<tr>
    <td>아이디</td>
    <td><p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="idChk"></span></p></td>
    <td><input type="text" name="account" id = "user_id" required style="width: 99%;" /></td>
	
</tr>
<tr>
    <td>비밀번호</td>
    <td><p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span></p></td>
    <td><input type="password" name="password" id ="user_pw"  required  style="width: 99%;" /></td>
</tr>

<tr>
    <td style="width: 200px;">이름(Full Name)</td>
    <td><p><strong>이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span></p></td>
    <td style="width: 390px"><input type="text" id = "user_name" name="name" required  style="width: 99%;" /></td>
</tr>

<tr>
    <td style="width: 200px;">핸드폰번호</td>
    <td>핸드폰번호 작성은 선택사항입니다. </td>
    <td style="width: 390px"><input type="number" min ="0" max ="12" id ="user_tel"  name="tel" required  style="width: 99%;" /></td>
</tr>
<tr>
    <td colspan="2"   style="text-align: center;font-weight: bold;">
    	핸드폰 번호는  - 를 빼주세요 . 예) 01012345678
    </td>
</tr>
</table>

<div style="text-align: center;padding-bottom: 15px;">
    <input id = "submit" type="submit" value="확인" />
</div>
</form>

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
	
	

	
	
	

	$('#user_id').on('keyup', function(){
	
	
		
		 id = $("#user_id").val();
		
		$.ajax({
		    url: '/user/ID_Check',
		    type: 'POST',
	
		    dataType: 'text', 
		 
		    data: id ,

		    success: function(data){
		         if(data === 'ok'){
		        
		        	  $("#result_id_msg").html("사용 가능한 아이디 입니다.");
		        
		         }else if(data === 'no'){
		         
		        	 $("#result_id_msg").html("사용 불가능한 아이디 입니다.");
		         	
		         }
		    },
		    error: function (){        
		                      
		    }
		
		  });
});
	
	
	
	
	

	
	
	
});


</script>




</html>