<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#myDiv{
	position:absolute;
	left:50%;
	top:50%;
	margin-left:-200px;
	margin-top:-50px;
	
}

</style>

<script type="text/javascript">
	var xmlHttp;
	function getMoreContents(){
		//获得用户的输入内容
		var content = document.getElementById("keyword");
		if(content.value == ""){
			return;
		}
		//给服务器发送用户输入的内容，使用xmlHttp对象，实现ajax异步请求
		xmlHttp = createXMLHttp();

		//要给服务器发送数据(escape处理中文)
		var url = "search?keyword="+escape(content.value);
		//true表示JavaScript脚本会在send()方法之后继续执行，而不会等待服务器响应
		xmlHttp.open("GET",url,true);
		//xmlHttp绑定回调方法，这个回调方法会在xmlHttp状态改变的时候被调用
		//xmlHttp的状态0-4，我们只关心4（complete）这个状态
		//当完成之后，再调用回调方法才有意义
		xmlHttp.onreadyStatechange = callback;
		xmlHttp.send(null);
	}
	
	//获取xmlHttp对象
	function createXMLHttp(){
		//对大多数浏览器都适用
		var xmlHttp;
		if(window.XMLHttpRequest){
			xmlHttp = new XMLHttpRequest();
		}
		if(window.ActiveXObject){
			xmlHttp = new ActiveObject("Microsoft.XMLHTTP");
			if(!xmlHttp){
				xmlHttp = new ActiveObject("Msxml2.XMLHTTP");
			}
		}
		return xmlHttp;
	}
	
	//回调函数
	function callback(){
		//4代表完成
		if(xmlHttp.readyState == 4){
			//200代表服务器响应成功
			//404代表资源未找到，500代表服务器内部错误
			if(xmlHttp.status == 200){
				//交互成功，获得相应的数据，是文本格式
				var result = xmlHttp.responseText;
				//解析获得数据
				var json = eval("("+result+")");
				//获得数据之后，就可以动态的显示这些数据了，把这些数据展示在输入框的下面
				
			}
		}
	}
	
	function setContent(contents){
		//首先获得关联数据的长度
		var size = contents.length;
		//设置内容
		for(var i = 0;i<size;i++){
			var nextNode = content[i];//代表的是json数据的第i个元素
			var tr = document.createElement("tr");
			var td = document.createElement("td");
			td.setAttribute("border","0");
			td.setAttribute("bgcolor","#FFFAFA");
			td.onmouseover = function(){
				this.className= 'mouseOver';
			};
			td.onmouseout = function(){
				this.className = 'mouseOut'
			};
			td.onclick = function(){
				//这个方法实现的是，当用鼠标点击一个关联数据时，输入框显示它
			};
			var text = document.createTextNode(nextNode);
			td.appendChild(text);
			tr.appendChild(td);
			document.getElementById("content_table_body").appendChild(tr);
			
		}
	}

</script>
</head>
<body>
	<div id = "myDiv">
		<input type="text" size="50" id="keyword" onkeyup="getMoreContents()"/>
		<input type="button" value="百度一下" width="50px">
		
		<!-- 下面是内容展示的区域 -->
		<div id = "popDiv">
			<table id = "content_table" bgcolor="#FFFAFA" border="0" 
				cellspacing="0" cellpadding="0">
				<tbody id　= "content_table_body">
				<!-- 动态查询出来的数据显示在这里 -->
					<tr><td>ajax</td></tr>
					<tr><td>ajax2</td></tr>
				</tbody>
			</table>
		</div>
		
		
	</div>
</body>
</html>