<%--
  Created by IntelliJ IDEA.
  User: 锴
  Date: 2018/2/1
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>PeiqiGo智能客服系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Peiqi,智能"/>
    <meta name="description" content="PeiqiGo智能客服系统">
    <link rel="stylesheet" href="static/css/chat.css">

</head>
<body>
    <div class="box">
        <div class="box-title">PeiqiGo智能客服系统</div>
        <div class="box-con" id="chat">
            <div class="box-left">
                <img src="static/images/peiqi.jpg" alt="Peiqi机器人" width="50" height="50"/>
                hello!
            </div>
            <%--<div class="box-right">--%>
                <%--nice!<img src="images/user.jpg" alt="user" width="50" height="50"/>--%>
            <%--</div>--%>

        </div>
        <div class="box-msg">
            <div class="box1" contenteditable="true">

            </div>
            <div class="send">
                <input type="button" value="发送" id="btn">
            </div>
        </div>
    </div>

<script type="text/javascript" src="static/js/jquery.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        $("#btn").click(function () {
            var value = $(".box1").text();
            //消息不能为空
            if (value.trim()!=""){
            $(".box-con").append("<div class='box-right'>"+
                value+"<img src='static/images/user.jpg' alt='user' width='50' height='50'/>"+
                "</div>");
            //清空聊天输入框内容
            $(".box1").html("");
            //发送ajax请求
            $.ajax({
                type:"post",
                url:"data.jsp",
                data:{info:value},
                success: function (data) {
                    var json = JSON.parse(data);
                    $(".box-con").append("<div class='box-left'>"+
                                 "<img src='static/images/peiqi.jpg' alt='Peiqi机器人' width='50' height='50'/>"+
                                json.text+
                                 "</div>");
                    //使滚动条始终在底部
                    $('#chat').scrollTop($('#chat')[0].scrollHeight);
                }
            });
            }else {
                alert("消息不能为空");
            }
        })
    });
</script>

</body>
</html>
