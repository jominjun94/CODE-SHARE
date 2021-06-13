<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/ex.js"></script>
<title>Insert title  here</title>
</head>
<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<input type="button" value="코드한번써볼래?" onclick="func_confirm()" />
<input type="button" value="너의 이름은 무엇인?" onclick="func_prompt()" />

<ul>
    <li>
        첫번째 인자는 새 창에 로드할 문서의 URL이다. 인자를 생략하면 이름이 붙지 않은 새 창이 만들어진다.<br />
        <input type="button" onclick="open1()" value="window.open('demo2.html');" />
    </li>
    <li>
        두번째 인자는 새 창의 이름이다. _self는 스크립트가 실행되는 창을 의미한다.<br />
        <input type="button" onclick="open2()" value="window.open('demo2.html', '_self');" />
    </li>
    <li>
        _blank는 새 창을 의미한다. <br />
        <input type="button" onclick="open3()" value="window.open('demo2.html', '_blank');" />
    </li>
    <li>
        창에 이름을 붙일 수 있다. open을 재실행 했을 때 동일한 이름의 창이 있다면 그곳으로 문서가 로드된다.<br />
        <input type="button" onclick="open4()" value="window.open('demo2.html', 'ot');" />
    </li>
    <li>
        세번재 인자는 새 창의 모양과 관련된 속성이 온다.<br />
        <input type="button" onclick="open5()" value="window.open('demo2.html', '_blank', 'width=200, height=200, resizable=yes');" />
    </li>
</ul>

 <script>
function func_confirm(){
if(confirm('Do you want?')){
		location.href = "/user/";
                } else {
                    alert('cancel');
                }
            }
function func_prompt(){
if(prompt('what is yout name?')==='minjun'){
	alert('hi minjun');
}else {
	alert('you?');
}	
	
	
	
}

function open1(){
    window.open('/user/');
}
function open2(){
    window.open('/user/', '_self');
}
function open3(){
    window.open('/user/', '_blank');
}
function open4(){
    window.open('/user/', 'onlyone');
}
function open5(){
    window.open('/user/', '_blank', 'width=200, height=200, resizable=no');
}



/*for(var i = 0; i < 10; i ++){
	
	document.write('coding everybody'+i+'<br />');
}*/
/*
alert(welcome());
var grades = {
	    'list': {'egoing': 10, 'k8805': 6, 'sorialgi': 80},
	    'show' : function(){
	        for(var name in this.list){
	            document.write(name+':'+this.list[name]+"<br />");
	        }
	    }
	};
	grades.show();
*/
/*
var grade = {'eg':10,'kr':20,'eng':50};
for(key in grade){
	
	key,grade[key]
}
var first = {};
first['asd'] = 10;

num();
num(1,2);
var man = ['ab','cd','ef'];
var man1 = man[1];
function num(){
	
	document.write('coding everybody');
	
}

function num(arg1,arg2){
	
	return arg1 + arg2;
	
}
*/
</script>
</body>
</html>