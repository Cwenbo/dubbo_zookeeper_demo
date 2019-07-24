<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>在线通讯录</title>
    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
</head>
<style type="text/css">
    tbody > tr:nth-child(odd) {
        background: mediumspringgreen;
    }

    thead > tr:nth-child(odd) {
        background: dodgerblue;
    }

</style>
<body background="">
<center>

    <table border="1" cellpadding="4" cellspacing="0" width="750px">
        <form action="<%=basePath %>/" method="post">
            <h1>在线通讯录</h1>
            <h3><p>查询联系人:<input type="text" name="cname" value="${cname}">&nbsp;
                <input type="submit" value="查找">

                <a href="<%=basePath %>/pages/addContact.jsp">添加联系人</a></p></h3>
            <thead>
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>手机</th>
                <th>QQ</th>
                <th>Email</th>
                <th>地址</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${contactList}" var="contact" varStatus="num">
                <tr>
                    <td>${num.count}</td>
                    <td><a href="<%=basePath %>/getContactById?id=${contact.id}">${contact.cname}</a></td>
                    <td>${contact.mobile}</td>
                    <td>${contact.qq}</td>
                    <td>${contact.email}</td>
                    <td>${contact.address}</td>
                </tr>
            </c:forEach>
            </tbody>
        </form>
    </table>

</center>

<script type="text/javascript">
    $(function () {


    });
</script>
</body>
</html>
