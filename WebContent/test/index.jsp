<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>ActiveMQ Demo程序</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/style.css" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	
	function send(controller){
		if($("#message").val()==""){
			$("#message").css("border","1px solid red");
			return;
		}else{
			$("#message").css("border","1px solid gray");
		}
		$.ajax({
			type: 'post',
			url:'<%=request.getContextPath()%>/activemq/' + controller,
			dataType : 'text',
			data : {
				"message" : $("#message").val()
			},
			success : function(data) {
				if (data == "suc") {
					$("#status").html("<font color=green>发送成功</font>");
					setTimeout(clear, 1000);
				} else {
					$("#status").html("<font color=red>" + data + "</font>");
					setTimeout(clear, 5000);
				}
			},
			error : function(data) {
				$("#status").html(
						"<font color=red>ERROR:" + data["status"] + ","
								+ data["statusText"] + "</font>");
				setTimeout(clear, 5000);
			}

		});
	}

	function clear() {
		$("#status").html("");
	}
</script>
</head>

<body>
	<h1>Hello ActiveMQ</h1>
	<div id="producer">
		<h2>Producer</h2>
		<textarea id="message"></textarea>
		<br>
		<button onclick="send('queueSender')">发送Queue消息</button>
		<button onclick="send('topicSender')">发送Topic消息</button>
		<br> <span id="status"></span>
	</div>
</body>
</html>
