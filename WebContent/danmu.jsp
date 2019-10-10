<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <title>斗鱼弹幕</title>
  <style>
    html,body{
    	font-size:10px;
    	overflow:hidden;
    	margin:0;
    	padding:0;
    }
    
    #box{
    	width:100%;
    	height:100%;
    }
    
    #dm{
    	width:100%;
    	height:90vh;
    	background:#E8F1F5;
    	/* background-image:url(image/1.png);
    	background-repeat:no-repeat;
    	background-size:100% 100%; */
    }
    
    #dm span{
    	width:auto;
    	height:3rem;
    	font-size:2rem;
    	line-height:2rem;
    	position:absolute;
    	white-space:nowrap;
    }
    
    #idDom{
    	width:100%;
    	height:10vh;
    	background:#666;
    	position:absolute;
    	bottom:0;display:flex;
    	align-items:center;
    	justify-content:center;
    }
    
    #content{
    	width:50rem;
    	height:10vh;
    	display:flex;
    	align-items:center;
    	justify-content:center;
    }
    
    .title{
    	font-size:2.2px rein;
    	color:#fff;
    	line-height:#ccc;
    }
    
    .text{
    	width:30rem;
    	height:2.5rem;
    	border:none;
    	border-radius:.5rem;
    	font-size:1.4rem;
    	margin:0 .5rem;
    	padding:0 1rem;
    }
    
    .btn{
    	width:6rem;
    	height:3rem;
    	border:none;
    	background:red;
    	color:#fff;
    }
    
  </style>
<link href="http://vjs.zencdn.net/5.0.2/video-js.css" rel="stylesheet">
<script src="http://vjs.zencdn.net/ie8/1.1.0/videojs-ie8.min.js"></script>
<script src="http://vjs.zencdn.net/5.0.2/video.js"></script>
</head>
<body>
<div class="box" id="box">
  <div id="dm">
  	<video
	    id="myvideo" width=960 height=540
	    class="video-js vjs-default-skin vjs-big-play-centered"
	    controls
	    preload="auto"
	    data-setup='{}'>
	    <source src="rtmp://192.168.1.11/han/live">
	    <p class="vjs-no-js">
	    To view this video please enable JavaScript, and consider upgrading to a
	    web browser that
	    <a href=" " target="_blank">
	        supports HTML5 video
	    </a>
	</p >
	</video>
  </div>
  <div class="idDom" id="idDom">
    <div id="content">
      <p class="title">吐槽:</p>
      <input type="text" class="text" id="text" placeholder="请输入你想说的话" />
      <button type="button" class="btn" id="btn">发射!</button>
    </div>
  </div>
</div>
<link href="http://vjs.zencdn.net/5.0.2/video-js.css" rel="stylesheet">
<script src="http://vjs.zencdn.net/ie8/1.1.0/videojs-ie8.min.js"></script>
<script src="http://vjs.zencdn.net/5.0.2/video.js"></script>
<script langugae="javascript">
	var timer;
	var btn = document.getElementById('btn');
	btn.onclick = function() {
		addBarrage();
	}

	document.onkeydown = function(evt) {
		var event = evt || window.event;if (event.keyCode == 13) {addBarrage();}
	}
	//字体颜色库
	//var colors = ['#2C3E50', '#FF0000', '#1E87F0', '#7AC84B', '#FF7F00', '#9B39F4', '#FF69B4'];//弹幕颜色库
	//字体位置
	function addBarrage() {
	  //设置该函数
	  //clearInterval(timer)
	  //获取用户输入内容
	  var text = document.getElementById('text').value;
	  //清空用户输出
	  document.getElementById('text').value = "";
//	  var index = parseInt(Math.random() * colors.length); //随机弹幕颜色
	  //获取屏幕宽度
	  var screenW = myvideo.offsetWidth;
	  //获取块的高度
	  var screenH = myvideo.offsetHeight;
	  console.log(screenW + "宽度")
	  console.log(screenH + "高度")
	  //获取屏幕高度/40的下舍入值
	  var max = Math.floor(screenH / 5);
	  //随机生成弹幕距顶端所在的高度
	  var height = 10 + 5 * (parseInt(Math.random() * (max + 1)) - 1);
	  //添加新的节点span
	  var span = document.createElement('span');
	  //设置新节点左侧的位置
	  span.style.left = screenW + 'px';
	  //设置新节点距该父节点顶端的高度
	  span.style.top = height + 'px';
	  //设置新节点文字的颜色
//	  span.style.color = colors[index];
	  span.style.color = 'red'
	  //将用户输入内容添加至span
	  span.innerHTML = text;
	  //弹幕所在的底层
	  var dmDom = document.getElementById('myvideo');
	  console.log(dmDom)
	  //将新节点添加至“dm”上
	  dmDom.appendChild(span);
	  //每10毫秒调用move（）函数
	  //timer = setInterval(move, 10);
	  var array = [];
	  var oSpan=document.getElementsByTagName('span');
	  
	  width = screenW - 500;
	  height = height - 100;
	  console.log(width)
	  console.log(height)
	  console.log(oSpan[0])
	  oSpan[0].style.left = width+'px';
	  oSpan[0].style.top = height+'px' 
	}
	function move() {
	  var arr=[];
	  //获取span元素
	  var oSpan=document.getElementsByTagName('span');
	  
	  for(var i=0;i<oSpan.length;i++){
		//想数组里添加获取到span元素的左偏移量
	    arr.push(oSpan[i].offsetLeft);
		arr.push(oSpan[i].offsetTop)
		console.log(arr)
		//每次调用本函数左偏移量向右移动2px
	    arr[i] -= 2;
		arr[i+1] -=1;
		console.log(arr[i+1])
	    oSpan[i].style.left = arr[i]+'px';
	    oSpan[i].style.top = arr[i+1]+'px'
	    if(arr[i]<-oSpan[i].offsetWidth){
	      var dmDom=document.getElementById('dm');
	      dmDom.removeChild(dmDom.childNodes[0]);
	    }
	    i++;
	  }
	}
</script>
</body>
</html>