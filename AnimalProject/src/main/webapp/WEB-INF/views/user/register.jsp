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
	
<fieldset style="display: inline;">
<legend>register</legend>
 <button id="duplicate_check" type="button">duplicate_check</button> 
<form id="signUpForm" action="<c:url value ='/user/register'/>" method="post">
<p>ID : <input type="text" name="account" id = "user_id" required placeholder="id" ></p>
<p>PW : <input type="password" name="password" id ="user_pw"  required placeholder="pw" ></p>
<p>NAME : <input type="text" id = "user_name" name="name" required  placeholder="name"></p>
<p>TEL : <input type="number" id ="user_tel"  name="tel" required placeholder="tel" ></p>
<input id = "submit" type="submit" onclick="func_confirm()" value="submit" />
</form>
</fieldset>
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


function func_confirm () {
	if(confirm('ok?')){
		alert("ok");
	} else {
		alert("cancle");
	}
}











$(function() {
	
	

	
	
	

	$('#duplicate_check').on('click', function(){
	
	
		
		 id = $("#user_id").val();
		
		$.ajax({
		    url: '/user/ID_Check',
		    type: 'POST',
	
		    dataType: 'text', 
		 
		    data: id ,

		    success: function(data){
		         if(data === 'ok'){
		        	 alert("ok");
		        	 // $("#result_id_msg").html("사용 가능한 아이디 입니다.");
		        
		         }else if(data === 'no'){
		        	 alert("Already exists..sorry retry");
		        	 // $("#result_id_msg").html("사용 불가능한 아이디 입니다.");
		         	
		         }
		    },
		    error: function (){        
		                      
		    }
		
		  });
});
	
	
	
	
	

	
	
	
});


</script>




</html>