<%--
  Created by IntelliJ IDEA.
  User: 锴
  Date: 2018/2/1
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.lang.*,com.wk.util.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String info = request.getParameter("info");

    String answer = ChatUtil.getResult(info);
    out.print(answer);


%>