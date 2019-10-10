<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>jsp</title>
<style type="text/css">
	
	.p {text-indent:5em;
	   word-spacing:20px;
	   text-align:justify;
	   letter-spacing:10px;
	   text-transform:capitalize;
	   padding:10px;
	   border:1px solid red;
		}
		
	li {
		font-size:20px;
		display:inline;
		padding:21px 25px 24px 25px;
	}
	
	ul{
		height:5%;
		padding-top:20px;
		position:fixed;
		top:50px;
		right:200px;
		margin:0;
		
	}
	
	li:hover{
		
		background-color:#bebebe;
		
	}
	
	div{
		width:100%;
		height:120px;
	}
	
</style>


</head>
<body>
	<div id='bar'>
		<ul>
			<li>首页</li>
			<li>功能</li>
			<li>查询</li>
			<li>修改</li>
			<li>退出</li>
		</ul>
	</div>
	<p class = 'p' id = 'demo'></p>
	<p class = 'p' id = 'demo1'></p>
	<p class = 'p' id = 'date' ></p>
	<button id = 'but' onclick='but()'>点我</button>
	<br>
	
	<div id = 'creates'></div>
	<img id = "imgs" alt="" src="">
	
<script type="text/javascript">


	//添加元素
	//定位父元素
	var ele = document.getElementById("creates")
	//定义p元素
	var pare = document.createElement('p')
	//定义需要添加的元素内容
	var node = document.createTextNode("添加新的元素。")
	//将内容添加到定义好的元素中
	pare.appendChild(node)
	//设置元素内容的颜色
	pare.style.color = 'red'
	//将定义的元素添加到父级元素下
	ele.appendChild(pare)
	

	//添加图片
	var img = document.getElementById("imgs")
	var a = 1
	img.src = "image/1.png"
	
	//添加子元素
	var cre = document.getElementById("creates")
	var e = document.createElement("input")
	e.type = "button"
	e.id = "cre"
	e.value = "点击更换图片" 
	var ojt = cre.appendChild(e);
	
	document.getElementById("cre").onclick = function(){
		var con = confirm("是否更换图片")
		//点击按钮修改图片
		if(con == true){
			if (a === 1){
				img.src = "image/porsche.jpg"
				img.alt = "保时捷汽车"
				a = 0
			}else {
				img.src = "image/1.png"
				a = 1
			}
		}
	}
	
	//
	document.getElementById("demo").innerHTML = screen.width + "," + screen.height + 
	"," + navigator.javaEnabled() 
	function but(){
		var demo = {UserName:'xuyonghui',UserPass:'123456',UserHome:'henan'}
		window.alert("hello word")
	}
	

	function demo(){
		
		var demo = 123456
		var demo1 = 987654
		
	}
	//数组
	var numbers = [45, 4, 9, 16, 25];
	var sum = numbers.reduceRight(myFunction);

	document.getElementById("demo1").innerHTML = "总和是：" + sum;

	function myFunction(total, value) {
	
	  return total + value;
	  
	}
	
	//日期	
	var myVer = setInterval(times,1000)
	function times() {
		var d = new Date()
		document.getElementById('date').innerHTML = d.getFullYear() + "-" + (d.getMonth()+1)
		+ "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds()
	}
	
	
	
	
</script>
</body>
</html>